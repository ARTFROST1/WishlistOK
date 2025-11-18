import browser from 'webextension-polyfill';

console.log('WishApp Extension: Content script loaded');

// Type definitions
interface PageData {
  url: string;
  title: string;
  description: string;
  image: string;
  price: string;
  timestamp: number;
}

interface ContentMessage {
  type: 'GET_PAGE_DATA';
}

interface ContentResponse {
  success: boolean;
  data?: PageData;
  error?: string;
}

// Listen for messages from popup
browser.runtime.onMessage.addListener(
  (
    message: ContentMessage,
    sender: browser.Runtime.MessageSender
  ): ContentResponse | undefined => {
    // Only respond to messages from the extension itself
    if (sender.id !== browser.runtime.id) {
      console.warn('Ignoring message from external sender');
      return { success: false, error: 'Unauthorized' };
    }

    try {
      if (message.type === 'GET_PAGE_DATA') {
        const pageData = extractPageData();
        return { success: true, data: pageData };
      }
      return { success: false, error: 'Unknown message type' };
    } catch (error) {
      console.error('Content script error:', error);
      return {
        success: false,
        error: error instanceof Error ? error.message : 'Unknown error',
      };
    }
  }
);

// Extract Open Graph and product metadata from the current page
function extractPageData(): PageData {
  const data: PageData = {
    url: window.location.href,
    title: document.title,
    description: '',
    image: '',
    price: '',
    timestamp: Date.now(),
  };

  // Extract Open Graph data
  const ogTitle = document.querySelector('meta[property="og:title"]')?.getAttribute('content');
  const ogDescription = document.querySelector('meta[property="og:description"]')?.getAttribute('content');
  const ogImage = document.querySelector('meta[property="og:image"]')?.getAttribute('content');

  // Extract product price (common selectors)
  const priceSelectors = [
    '[data-testid*="price"]',
    '.price',
    '[class*="price"]',
    '[id*="price"]',
    '.cost',
    '[class*="cost"]',
  ];

  let price = '';
  for (const selector of priceSelectors) {
    const priceElement = document.querySelector(selector);
    if (priceElement && priceElement.textContent) {
      const priceText = priceElement.textContent.trim();
      // Basic price pattern matching
      const priceMatch = priceText.match(/[\d,.\s]+(?:₽|руб|$|€|£)/);
      if (priceMatch) {
        price = priceMatch[0];
        break;
      }
    }
  }

  // Use extracted data with fallbacks
  data.title = ogTitle || document.title || '';
  data.description = ogDescription || 
    document.querySelector('meta[name="description"]')?.getAttribute('content') || '';
  data.image = ogImage || 
    document.querySelector('meta[property="og:image:secure_url"]')?.getAttribute('content') || '';
  data.price = price;

  console.log('Extracted page data:', data);
  return data;
}

// This will be expanded in Stage 2 with more sophisticated parsing
// and integration with the WishApp API
