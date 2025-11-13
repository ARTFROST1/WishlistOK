import type { ManifestV3Export } from 'vite-plugin-web-extension';

const manifest: ManifestV3Export = {
  manifest_version: 3,
  name: 'WishApp',
  version: '1.0.0',
  description: 'Add items to your wishlists from any website',
  
  permissions: [
    'activeTab',
    'storage',
  ],
  
  host_permissions: [
    'http://localhost:3001/*',
  ],
  
  background: {
    service_worker: 'src/background.ts',
    type: 'module',
  },
  
  content_scripts: [
    {
      matches: ['<all_urls>'],
      js: ['src/content.ts'],
      run_at: 'document_idle',
    },
  ],
  
  action: {
    default_popup: 'src/popup/popup.html',
    default_title: 'WishApp',
  },
  
  icons: {
    16: 'icons/icon-16.png',
    32: 'icons/icon-32.png',
    48: 'icons/icon-48.png',
    128: 'icons/icon-128.png',
  },
  
  web_accessible_resources: [
    {
      resources: ['icons/*'],
      matches: ['<all_urls>'],
    },
  ],
};

export default manifest;
