import browser from 'webextension-polyfill';

// Popup functionality
console.log('WishApp Extension: Popup script loaded');

// Test function for Stage 1 validation
(window as any).testFunction = async () => {
  try {
    // Get current tab
    const [tab] = await browser.tabs.query({ active: true, currentWindow: true });
    
    if (!tab.id) {
      console.error('No active tab found');
      return;
    }
    
    // Send message to content script
    const response = await browser.tabs.sendMessage(tab.id, {
      type: 'EXTRACT_PRODUCT_DATA'
    });
    
    console.log('Product data extracted:', response);
    
    // Show success message
    const statusDiv = document.querySelector('.status');
    if (statusDiv) {
      statusDiv.textContent = 'Extension test successful! Product data extracted.';
      statusDiv.className = 'status info';
    }
    
  } catch (error) {
    console.error('Extension test failed:', error);
    
    const statusDiv = document.querySelector('.status');
    if (statusDiv) {
      statusDiv.textContent = 'Extension test failed. Check console for details.';
      statusDiv.className = 'status error';
    }
  }
};

// Initialize popup
document.addEventListener('DOMContentLoaded', () => {
  console.log('Popup DOM loaded');
});
