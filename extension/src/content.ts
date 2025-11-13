import browser from 'webextension-polyfill';

// Content script for DOM parsing
console.log('WishApp Extension: Content script loaded');

// Function to extract product metadata (will be fully implemented in Stage 3)
function extractProductData() {
  // Basic meta tag extraction for Open Graph data
  const getMetaContent = (property: string): string | null => {
    const element = document.querySelector(`meta[property="${property}"], meta[name="${property}"]`);
    return element ? element.getAttribute('content') : null;
  };

  return {
    title: getMetaContent('og:title') || document.title || '',
    description: getMetaContent('og:description') || getMetaContent('description') || '',
    image: getMetaContent('og:image') || '',
    url: window.location.href,
    price: '', // Will be implemented with better parsing in Stage 3
  };
}

// Listen for messages from popup or background
browser.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (message.type === 'EXTRACT_PRODUCT_DATA') {
    const productData = extractProductData();
    sendResponse(productData);
  }
  
  return true;
});
