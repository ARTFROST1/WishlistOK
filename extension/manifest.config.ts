import { defineManifest } from 'vite-plugin-web-extension';

export default defineManifest({
  name: 'WishApp Extension',
  description: 'Add products to your wishlists from any store',
  version: '1.0.0',
  manifest_version: 3,
  
  icons: {
    16: 'public/icons/icon-16.png',
    32: 'public/icons/icon-32.png',
    48: 'public/icons/icon-48.png',
    128: 'public/icons/icon-128.png',
  },
  
  action: {
    default_popup: 'src/popup/index.html',
    default_title: 'WishApp - Add to Wishlist',
  },
  
  background: {
    service_worker: 'src/background.ts',
  },
  
  content_scripts: [
    {
      matches: ['<all_urls>'],
      js: ['src/content.ts'],
      run_at: 'document_end',
    },
  ],
  
  permissions: [
    'activeTab',
    'storage',
  ],
  
  host_permissions: [
    'http://localhost/*',
    'https://api.wishapp.dev/*',
  ],
  
  web_accessible_resources: [
    {
      resources: ['public/icons/*'],
      matches: ['<all_urls>'],
    },
  ],
});
