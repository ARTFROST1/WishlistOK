import browser from 'webextension-polyfill';

console.log('WishApp Extension: Popup script loaded');

// Initialize popup when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  initPopup().catch((error) => {
    console.error('Popup initialization failed:', error);
    showError('Failed to initialize popup');
  });
});

async function initPopup(): Promise<void> {
  console.log('Popup DOM loaded');

  // Get current tab
  const tabs = await browser.tabs.query({ active: true, currentWindow: true });
  const tab = tabs[0];

  if (!tab || !tab.id) {
    console.error('No active tab found');
    showError('Could not access current tab');
    return;
  }

  // Get page data from content script
  try {
    const response = await browser.tabs.sendMessage(tab.id, {
      type: 'GET_PAGE_DATA',
    });
    console.log('Page data received:', response);

    if (response?.success && response.data) {
      // This will be used in Stage 2 to populate the UI with extracted data
      console.log('Extracted data:', response.data);
    } else {
      console.warn('Failed to extract page data:', response?.error);
    }
  } catch (error) {
    console.error('Could not get page data:', error);
    showError('Extension not available on this page');
  }

  // Setup button event listeners
  setupEventListeners();
}

function showError(message: string): void {
  const statusElement = document.getElementById('status');
  if (statusElement) {
    statusElement.textContent = message;
    statusElement.classList.add('error');
  }
}

function setupEventListeners(): void {
  const addButton = document.getElementById('add-button');
  const parseButton = document.getElementById('parse-button');

  // Fallback to class-based selectors if IDs not found
  const addButtonFallback =
    addButton || document.querySelector('.button:not(.secondary-button)');
  const parseButtonFallback =
    parseButton || document.querySelector('.secondary-button');

  if (addButtonFallback) {
    addButtonFallback.addEventListener('click', () => {
      console.log('Add to Wishlist clicked - will be implemented in Stage 2');
    });
  }

  if (parseButtonFallback) {
    parseButtonFallback.addEventListener('click', () => {
      console.log('Quick Parse clicked - will be implemented in Stage 2');
    });
  }
}
