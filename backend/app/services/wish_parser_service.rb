class WishParserService
  include HTTParty
  
  USER_AGENT = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
  
  def initialize(url)
    @url = normalize_url(url)
    @parsed_data = {}
  end

  def call
    return { success: false, error: 'Invalid URL' } unless valid_url?

    begin
      response = HTTParty.get(@url, {
        headers: {
          'User-Agent' => USER_AGENT,
          'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
          'Accept-Language' => 'en-US,en;q=0.5',
          'Accept-Encoding' => 'gzip, deflate',
          'Connection' => 'keep-alive'
        },
        timeout: 10,
        follow_redirects: true
      })

      return { success: false, error: 'Failed to fetch URL' } unless response.success?

      doc = Nokogiri::HTML(response.body)
      parse_metadata(doc)
      
      # OG image is required per policy
      unless @parsed_data[:image_url].present?
        return { success: false, error: 'No image found - OG image is required' }
      end

      {
        success: true,
        **@parsed_data
      }

    rescue HTTParty::Error, Timeout::Error => e
      { success: false, error: "Network error: #{e.message}" }
    rescue Nokogiri::Error => e
      { success: false, error: "Parse error: #{e.message}" }
    rescue StandardError => e
      { success: false, error: "Unexpected error: #{e.message}" }
    end
  end

  private

  def normalize_url(url)
    return url if url.match(/\Ahttps?:\/\//)
    "https://#{url}"
  end

  def valid_url?
    uri = URI.parse(@url)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end

  def parse_metadata(doc)
    # Parse Open Graph tags (priority)
    parse_og_tags(doc)
    
    # Parse Twitter Card tags (fallback)
    parse_twitter_tags(doc)
    
    # Parse standard HTML tags (fallback)
    parse_html_tags(doc)
    
    # Parse structured data (JSON-LD, microdata)
    parse_structured_data(doc)
    
    # Detect brand/store
    detect_brand
    
    # Detect category
    detect_category
  end

  def parse_og_tags(doc)
    @parsed_data[:title] ||= doc.at('meta[property="og:title"]')&.[]('content')
    @parsed_data[:description] ||= doc.at('meta[property="og:description"]')&.[]('content')
    @parsed_data[:image_url] ||= doc.at('meta[property="og:image"]')&.[]('content')
    
    # Parse price from og:price or product specific tags
    price_content = doc.at('meta[property="og:price:amount"]')&.[]('content') ||
                   doc.at('meta[property="product:price:amount"]')&.[]('content')
    
    if price_content
      @parsed_data[:price] = parse_price(price_content)
      @parsed_data[:currency] = doc.at('meta[property="og:price:currency"]')&.[]('content') ||
                               doc.at('meta[property="product:price:currency"]')&.[]('content') ||
                               'USD'
    end

    # Collect additional images
    images = doc.css('meta[property="og:image"]').map { |img| img['content'] }.compact
    @parsed_data[:images] = images.uniq if images.any?
  end

  def parse_twitter_tags(doc)
    @parsed_data[:title] ||= doc.at('meta[name="twitter:title"]')&.[]('content')
    @parsed_data[:description] ||= doc.at('meta[name="twitter:description"]')&.[]('content')
    @parsed_data[:image_url] ||= doc.at('meta[name="twitter:image"]')&.[]('content')
  end

  def parse_html_tags(doc)
    @parsed_data[:title] ||= doc.at('title')&.text&.strip
    @parsed_data[:description] ||= doc.at('meta[name="description"]')&.[]('content')
    
    # Try to find price in various common selectors
    unless @parsed_data[:price]
      price_selectors = [
        '.price', '.cost', '.amount', '[class*="price"]', '[class*="cost"]',
        '[data-price]', '.product-price', '.current-price', '.sale-price'
      ]
      
      price_selectors.each do |selector|
        price_element = doc.at(selector)
        next unless price_element
        
        price_text = price_element.text.strip
        parsed_price = parse_price(price_text)
        if parsed_price
          @parsed_data[:price] = parsed_price
          @parsed_data[:currency] ||= detect_currency(price_text)
          break
        end
      end
    end

    # Try to find main product image if OG image not found
    unless @parsed_data[:image_url]
      image_selectors = [
        '.product-image img', '.main-image img', '[class*="product"] img',
        '.gallery img', '[class*="hero"] img'
      ]
      
      image_selectors.each do |selector|
        img = doc.at(selector)
        next unless img
        
        src = img['src'] || img['data-src']
        if src && !src.include?('placeholder') && !src.include?('loading')
          @parsed_data[:image_url] = make_absolute_url(src)
          break
        end
      end
    end
  end

  def parse_structured_data(doc)
    # Parse JSON-LD structured data
    json_ld_scripts = doc.css('script[type="application/ld+json"]')
    
    json_ld_scripts.each do |script|
      begin
        data = JSON.parse(script.content)
        data = [data] unless data.is_a?(Array)
        
        data.each do |item|
          parse_product_schema(item) if item['@type']&.include?('Product')
        end
      rescue JSON::ParserError
        # Skip invalid JSON
      end
    end
  end

  def parse_product_schema(product_data)
    @parsed_data[:title] ||= product_data['name']
    @parsed_data[:description] ||= product_data['description']
    @parsed_data[:brand] ||= product_data.dig('brand', 'name') || product_data['brand']
    @parsed_data[:category] ||= product_data['category']
    
    # Parse offers for price
    offers = product_data['offers']
    offers = [offers] unless offers.is_a?(Array)
    
    offers&.each do |offer|
      if offer['price'] || offer['priceSpecification']
        price_spec = offer['priceSpecification'] || offer
        @parsed_data[:price] ||= parse_price(price_spec['price'])
        @parsed_data[:currency] ||= price_spec['priceCurrency'] || 'USD'
      end
    end

    # Parse images
    if product_data['image']
      images = product_data['image']
      images = [images] unless images.is_a?(Array)
      
      image_urls = images.map do |img|
        img.is_a?(String) ? img : img['url']
      end.compact
      
      @parsed_data[:image_url] ||= image_urls.first
      @parsed_data[:images] = (@parsed_data[:images] || []).concat(image_urls).uniq
    end
  end

  def detect_brand
    return if @parsed_data[:brand]
    
    # Try to detect brand from URL domain
    domain = URI.parse(@url).host.downcase
    
    brand_patterns = {
      'amazon' => /amazon\./,
      'wildberries' => /wildberries\./,
      'ozon' => /ozon\./,
      'lamoda' => /lamoda\./,
      'ikea' => /ikea\./,
      'zara' => /zara\./,
      'h&m' => /hm\./
    }
    
    brand_patterns.each do |brand, pattern|
      if domain.match?(pattern)
        @parsed_data[:brand] = brand.titleize
        break
      end
    end
  end

  def detect_category
    return if @parsed_data[:category]
    
    # Basic category detection from URL path and title
    url_and_title = "#{@url} #{@parsed_data[:title]}".downcase
    
    category_keywords = {
      'electronics' => %w[phone laptop computer tablet headphone speaker tv monitor],
      'clothing' => %w[shirt dress pants shoes jacket coat fashion clothing apparel],
      'home' => %w[furniture chair table lamp pillow blanket kitchen home decor],
      'beauty' => %w[makeup cosmetics skincare perfume beauty hair],
      'books' => %w[book novel textbook ebook literature reading],
      'sports' => %w[fitness gym sport exercise workout athletic gear]
    }
    
    category_keywords.each do |category, keywords|
      if keywords.any? { |keyword| url_and_title.include?(keyword) }
        @parsed_data[:category] = category.titleize
        break
      end
    end
  end

  def parse_price(price_text)
    return nil unless price_text
    
    # Extract numeric value from price text
    price_match = price_text.to_s.gsub(/[^\d.,]/, '').match(/(\d+(?:[.,]\d+)?)/)
    return nil unless price_match
    
    price_value = price_match[1].gsub(',', '.')
    Float(price_value)
  rescue ArgumentError
    nil
  end

  def detect_currency(text)
    currency_symbols = {
      '$' => 'USD',
      '€' => 'EUR',
      '₽' => 'RUB',
      '£' => 'GBP'
    }
    
    currency_symbols.each do |symbol, code|
      return code if text.include?(symbol)
    end
    
    'USD' # default
  end

  def make_absolute_url(url)
    return url if url.match(/\Ahttps?:\/\//)
    
    base_uri = URI.parse(@url)
    if url.start_with?('//')
      "#{base_uri.scheme}:#{url}"
    elsif url.start_with?('/')
      "#{base_uri.scheme}://#{base_uri.host}#{url}"
    else
      "#{base_uri.scheme}://#{base_uri.host}/#{url}"
    end
  rescue URI::InvalidURIError
    url
  end
end
