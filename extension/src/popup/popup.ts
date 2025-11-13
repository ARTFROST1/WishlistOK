import browser from 'webextension-polyfill';

console.log('WishApp Extension: Popup script loaded');

// Initialize popup when DOM is loaded
document.addEventListener('DOMContentLoaded', async () => {
  console.log('Popup DOM loaded');
  
  // Get current tab
  const [tab] = await browser.tabs.query({ active: true, currentWindow: true });
  
  if (tab.id) {
    // Get page data from content script
    try {
      const pageData = await browser.tabs.sendMessage(tab.id, { type: 'GET_PAGE_DATA' });
      console.log('Page data received:', pageData);
      
      // This will be used in Stage 2 to populate the UI with extracted data
    } catch (error) {
      console.log('Could not get page data:', error);
    }
  }
  
  // Setup button event listeners
  setupEventListeners();
});

function setupEventListeners() {
  const addButton = document.querySelector('.button:not(.secondary-button)');
  const parseButton = document.querySelector('.secondary-button');
  
  if (addButton) {
    addButton.addEventListener('click', () => {
      console.log('Add to Wishlist clicked - will be implemented in Stage 2');
    });
  }
  
  if (parseButton) {
    parseButton.addEventListener('click', () => {
      console.log('Quick Parse clicked - will be implemented in Stage 2');
    });
  }
}
