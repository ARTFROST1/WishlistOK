class Api::V1::IdeasController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show, :categories]

  # GET /api/v1/ideas
  def index
    # For MVP, return curated collections from fixtures/seeds
    collections = get_curated_collections
    
    # Filter by category if provided
    if params[:category].present?
      collections = collections.select { |c| c[:category] == params[:category] }
    end
    
    # Paginate results
    page = params[:page]&.to_i || 1
    per_page = params[:per_page]&.to_i || 20
    per_page = [per_page, 50].min # Max 50 items per page
    
    offset = (page - 1) * per_page
    paginated_collections = collections[offset, per_page] || []
    
    render_success({
      collections: paginated_collections,
      meta: {
        page: page,
        per_page: per_page,
        total_count: collections.length,
        total_pages: (collections.length.to_f / per_page).ceil
      }
    })
  end

  # GET /api/v1/ideas/:id
  def show
    collection = get_curated_collections.find { |c| c[:id] == params[:id] }
    
    unless collection
      render_error('Collection not found', status: :not_found)
      return
    end

    render_success({
      collection: collection
    })
  end

  # GET /api/v1/ideas/categories
  def categories
    categories = [
      {
        id: 'birthday',
        name: 'Birthday Gifts',
        description: 'Perfect gifts for birthday celebrations',
        icon: '🎂',
        color: '#FF7A59'
      },
      {
        id: 'wedding',
        name: 'Wedding & Anniversary',
        description: 'Romantic and practical gifts for couples',
        icon: '💍',
        color: '#EC4899'
      },
      {
        id: 'holiday',
        name: 'Holiday Gifts',
        description: 'Festive gifts for holiday seasons',
        icon: '🎄',
        color: '#10B981'
      },
      {
        id: 'baby',
        name: 'Baby & Kids',
        description: 'Adorable gifts for little ones',
        icon: '👶',
        color: '#F59E0B'
      },
      {
        id: 'tech',
        name: 'Tech & Gadgets',
        description: 'Latest technology and cool gadgets',
        icon: '📱',
        color: '#3B82F6'
      },
      {
        id: 'home',
        name: 'Home & Living',
        description: 'Beautiful items for the home',
        icon: '🏠',
        color: '#8B5CF6'
      },
      {
        id: 'fashion',
        name: 'Fashion & Style',
        description: 'Trendy clothing and accessories',
        icon: '👗',
        color: '#EF4444'
      },
      {
        id: 'hobbies',
        name: 'Hobbies & Interests',
        description: 'Gifts for specific interests and hobbies',
        icon: '🎨',
        color: '#06B6D4'
      }
    ]

    render_success({
      categories: categories
    })
  end

  # GET /api/v1/ideas/featured
  def featured
    # Return featured/trending collections
    featured_collections = get_curated_collections.select { |c| c[:featured] }
                                                  .first(6)

    render_success({
      collections: featured_collections
    })
  end

  # GET /api/v1/ideas/trending
  def trending
    # Return trending collections (for MVP, just rotate through popular ones)
    trending_collections = get_curated_collections.select { |c| c[:trending] }
                                                  .first(10)

    render_success({
      collections: trending_collections
    })
  end

  private

  def get_curated_collections
    # For MVP, return hardcoded curated collections
    # In production, this would come from a database with admin CMS
    [
      {
        id: 'tech-gadgets-2024',
        title: 'Best Tech Gadgets 2024',
        description: 'The latest and greatest technology gifts that everyone wants.',
        category: 'tech',
        image_url: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400',
        featured: true,
        trending: true,
        items_count: 15,
        price_range: '$25 - $500',
        items: generate_sample_items('tech'),
        created_at: 1.week.ago.iso8601
      },
      {
        id: 'cozy-home-essentials',
        title: 'Cozy Home Essentials',
        description: 'Create the perfect cozy atmosphere with these home essentials.',
        category: 'home',
        image_url: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
        featured: true,
        trending: false,
        items_count: 12,
        price_range: '$15 - $200',
        items: generate_sample_items('home'),
        created_at: 2.weeks.ago.iso8601
      },
      {
        id: 'birthday-surprises',
        title: 'Birthday Surprises Under $50',
        description: 'Thoughtful birthday gifts that won\'t break the bank.',
        category: 'birthday',
        image_url: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=400',
        featured: false,
        trending: true,
        items_count: 20,
        price_range: '$10 - $50',
        items: generate_sample_items('birthday'),
        created_at: 3.days.ago.iso8601
      },
      {
        id: 'fashion-forward',
        title: 'Fashion Forward Finds',
        description: 'Stylish accessories and clothing for the fashion-conscious.',
        category: 'fashion',
        image_url: 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=400',
        featured: false,
        trending: true,
        items_count: 18,
        price_range: '$20 - $150',
        items: generate_sample_items('fashion'),
        created_at: 5.days.ago.iso8601
      },
      {
        id: 'baby-shower-must-haves',
        title: 'Baby Shower Must-Haves',
        description: 'Essential gifts for new parents and babies.',
        category: 'baby',
        image_url: 'https://images.unsplash.com/photo-1515488042361-ee00e0ddd4e4?w=400',
        featured: true,
        trending: false,
        items_count: 14,
        price_range: '$15 - $100',
        items: generate_sample_items('baby'),
        created_at: 1.day.ago.iso8601
      },
      {
        id: 'holiday-magic',
        title: 'Holiday Magic Collection',
        description: 'Spread holiday cheer with these magical gift ideas.',
        category: 'holiday',
        image_url: 'https://images.unsplash.com/photo-1512389142860-9c449e58a543?w=400',
        featured: false,
        trending: false,
        items_count: 16,
        price_range: '$5 - $75',
        items: generate_sample_items('holiday'),
        created_at: 1.month.ago.iso8601
      }
    ]
  end

  def generate_sample_items(category)
    # Generate sample items for each category
    case category
    when 'tech'
      [
        { title: 'Wireless Earbuds', price: '$89', image_url: 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=300' },
        { title: 'Smart Watch', price: '$249', image_url: 'https://images.unsplash.com/photo-1551816230-ef5deaed4a26?w=300' },
        { title: 'Portable Charger', price: '$35', image_url: 'https://images.unsplash.com/photo-1609091839311-d5365f9ff1c5?w=300' }
      ]
    when 'home'
      [
        { title: 'Scented Candles Set', price: '$42', image_url: 'https://images.unsplash.com/photo-1602874801007-05749084e2fe?w=300' },
        { title: 'Cozy Throw Blanket', price: '$65', image_url: 'https://images.unsplash.com/photo-1586075010923-2dd4570fb338?w=300' },
        { title: 'Plant & Pot Set', price: '$28', image_url: 'https://images.unsplash.com/photo-1485955900006-10f4d324d411?w=300' }
      ]
    when 'birthday'
      [
        { title: 'Personalized Mug', price: '$18', image_url: 'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=300' },
        { title: 'Board Game', price: '$35', image_url: 'https://images.unsplash.com/photo-1594736797933-d0dc2eedd8ab?w=300' },
        { title: 'Gourmet Chocolate Box', price: '$25', image_url: 'https://images.unsplash.com/photo-1549007953-2f2dc0b24019?w=300' }
      ]
    else
      [
        { title: 'Sample Item 1', price: '$25', image_url: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=300' },
        { title: 'Sample Item 2', price: '$45', image_url: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=300' }
      ]
    end
  end
end
