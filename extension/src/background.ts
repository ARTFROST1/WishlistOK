import browser from 'webextension-polyfill';

// Background service worker for MV3
console.log('WishApp Extension: Background script loaded');

// Handle extension installation
browser.runtime.onInstalled.addListener((details) => {
  console.log('WishApp Extension installed:', details.reason);
});

// Handle messages from content script and popup
browser.runtime.onMessage.addListener((message, sender, sendResponse) => {
  console.log('Background received message:', message);
  
  switch (message.type) {
    case 'PARSE_PAGE':
      // Parse page functionality will be implemented in Stage 3
      console.log('Parse page request received');
      sendResponse({ success: true, message: 'Parse functionality coming in Stage 3' });
      break;
      
    default:
      console.log('Unknown message type:', message.type);
      sendResponse({ error: 'Unknown message type' });
  }
  
  return true; // Keep message channel open for async response
});
