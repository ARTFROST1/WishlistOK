import browser from 'webextension-polyfill';

console.log('WishApp Extension: Background script loaded');

// Extension installation/update handler
browser.runtime.onInstalled.addListener((details) => {
  console.log('WishApp Extension installed/updated:', details.reason);
  
  if (details.reason === 'install') {
    // Set default configuration on first install
    browser.storage.local.set({
      isAuthenticated: false,
      apiBaseUrl: import.meta.env.VITE_API_BASE_URL || 'http://localhost:3001/api/v1',
    });
  }
});

// Handle messages from content script and popup
browser.runtime.onMessage.addListener(async (message, sender, sendResponse) => {
  console.log('Background received message:', message);
  
  switch (message.type) {
    case 'PARSE_PAGE':
      // Handle page parsing request (Stage 2+)
      return handlePageParse(message.data);
    
    case 'AUTH_STATUS':
      // Check authentication status
      return getAuthStatus();
    
    case 'STORE_TOKEN':
      // Store authentication token
      return storeAuthToken(message.token);
    
    default:
      console.warn('Unknown message type:', message.type);
      return { error: 'Unknown message type' };
  }
});

async function handlePageParse(data: any) {
  // This will be implemented in Stage 2 with actual parsing logic
  console.log('Parse page data:', data);
  return { status: 'success', message: 'Parsing will be implemented in Stage 2' };
}

async function getAuthStatus() {
  const result = await browser.storage.local.get(['isAuthenticated', 'userToken']);
  return {
    isAuthenticated: result.isAuthenticated || false,
    hasToken: !!result.userToken,
  };
}

async function storeAuthToken(token: string) {
  await browser.storage.local.set({
    userToken: token,
    isAuthenticated: true,
  });
  return { status: 'success' };
}
