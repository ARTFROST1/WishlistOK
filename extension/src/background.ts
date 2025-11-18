import browser from 'webextension-polyfill';

console.log('WishApp Extension: Background script loaded');

// Type definitions
interface PageParseData {
  url: string;
  title?: string;
  description?: string;
  image?: string;
  price?: string;
}

interface ExtensionMessage {
  type: 'PARSE_PAGE' | 'AUTH_STATUS' | 'STORE_TOKEN';
  data?: PageParseData;
  token?: string;
}

interface ExtensionResponse {
  success?: boolean;
  status?: string;
  message?: string;
  error?: string;
  isAuthenticated?: boolean;
  hasToken?: boolean;
}

// Extension installation/update handler
browser.runtime.onInstalled.addListener(async (details) => {
  console.log('WishApp Extension installed/updated:', details.reason);

  if (details.reason === 'install') {
    try {
      // Set default configuration on first install
      await browser.storage.local.set({
        version: 1,
        isAuthenticated: false,
        apiBaseUrl: import.meta.env.VITE_API_BASE_URL || 'http://localhost:3001/api/v1',
      });
      console.log('Storage initialized successfully');
    } catch (error) {
      console.error('Failed to initialize storage:', error);
    }
  }
});

// Handle messages from content script and popup
browser.runtime.onMessage.addListener(
  (message: ExtensionMessage, sender): Promise<ExtensionResponse> | undefined => {
    console.log('Background received message:', message);

    // Return a promise to keep the message channel open
    return handleMessage(message, sender).catch((error) => {
      console.error('Message handler error:', error);
      return { error: error instanceof Error ? error.message : 'Unknown error' };
    });
  }
);

async function handleMessage(
  message: ExtensionMessage,
  sender: browser.Runtime.MessageSender
): Promise<ExtensionResponse> {
  switch (message.type) {
    case 'PARSE_PAGE':
      if (!message.data) {
        return { error: 'PARSE_PAGE requires data field' };
      }
      return handlePageParse(message.data);

    case 'AUTH_STATUS':
      return getAuthStatus();

    case 'STORE_TOKEN':
      if (!message.token || typeof message.token !== 'string') {
        return { error: 'STORE_TOKEN requires token field' };
      }
      return storeAuthToken(message.token);

    default:
      console.warn('Unknown message type:', message.type);
      return { error: 'Unknown message type' };
  }
}

async function handlePageParse(data: PageParseData): Promise<ExtensionResponse> {
  // This will be implemented in Stage 2 with actual parsing logic
  console.log('Parse page data:', data);
  return { status: 'success', message: 'Parsing will be implemented in Stage 2' };
}

async function getAuthStatus(): Promise<ExtensionResponse> {
  try {
    const result = await browser.storage.local.get(['isAuthenticated', 'userToken']);
    return {
      isAuthenticated: Boolean(result.isAuthenticated),
      hasToken: Boolean(result.userToken),
    };
  } catch (error) {
    console.error('Failed to get auth status:', error);
    return { error: 'Failed to get auth status' };
  }
}

async function storeAuthToken(token: string): Promise<ExtensionResponse> {
  // Basic JWT validation (3 dot-separated parts)
  if (token.split('.').length !== 3) {
    return { error: 'Invalid token format' };
  }

  try {
    await browser.storage.local.set({
      userToken: token,
      isAuthenticated: true,
    });
    return { status: 'success' };
  } catch (error) {
    console.error('Failed to store auth token:', error);
    return { error: 'Failed to store token' };
  }
}
