// ARKA PREMIUM Service Worker
const CACHE_NAME = 'arka-premium-v1';
const urlsToCache = [
  '/',
  '/index.html',
  '/manifest.json',
  '/js/app.js',
  '/js/storage.js',
  '/js/cookie-manager.js',
  '/pages/splash.html',
  '/pages/login.html',
  '/pages/home.html',
  '/css/splash.css',
  '/css/login.css',
  '/css/home.css',
  '/icons/icon-192x192.png',
  '/icons/icon-512x512.png'
];

// Install event
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('Opened cache');
        return cache.addAll(urlsToCache);
      })
      .catch(err => {
        console.log('Cache error:', err);
      })
  );
});

// Fetch event
self.addEventListener('fetch', event => {
  // Skip non-GET requests
  if (event.request.method !== 'GET') return;
  
  // Skip API requests (always fetch from network)
  if (event.request.url.includes('api.divateam.co')) {
    event.respondWith(
      fetch(event.request)
        .catch(() => {
          return new Response(JSON.stringify({error: 'Network error'}), {
            headers: {'Content-Type': 'application/json'},
            status: 503
          });
        })
    );
    return;
  }
  
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        // Cache hit - return response
        if (response) {
          return response;
        }
        
        // Clone the request
        const fetchRequest = event.request.clone();
        
        return fetch(fetchRequest).then(response => {
          // Check if valid response
          if (!response || response.status !== 200 || response.type !== 'basic') {
            return response;
          }
          
          // Clone the response
          const responseToCache = response.clone();
          
          caches.open(CACHE_NAME)
            .then(cache => {
              cache.put(event.request, responseToCache);
            });
          
          return response;
        });
      })
      .catch(() => {
        // Return offline page for navigation requests
        if (event.request.mode === 'navigate') {
          return caches.match('/index.html');
        }
      })
  );
});

// Activate event
self.addEventListener('activate', event => {
  const cacheWhitelist = [CACHE_NAME];
  
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});

// Background sync for offline actions
self.addEventListener('sync', event => {
  if (event.tag === 'sync-products') {
    event.waitUntil(syncProducts());
  }
});

async function syncProducts() {
  try {
    const cache = await caches.open(CACHE_NAME);
    const token = await getTokenFromIndexedDB();
    
    if (!token) return;
    
    const response = await fetch('https://api.divateam.co/api/v1/profile/products', {
      headers: {
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json'
      }
    });
    
    if (response.ok) {
      await cache.put('/api/products', response.clone());
    }
  } catch (error) {
    console.error('Sync error:', error);
  }
}

// Helper function to get token from IndexedDB
async function getTokenFromIndexedDB() {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open('ArkaDB', 1);
    
    request.onsuccess = event => {
      const db = event.target.result;
      const transaction = db.transaction(['storage'], 'readonly');
      const store = transaction.objectStore('storage');
      const getRequest = store.get('token');
      
      getRequest.onsuccess = () => {
        resolve(getRequest.result?.value);
      };
      
      getRequest.onerror = () => {
        reject(getRequest.error);
      };
    };
    
    request.onerror = () => {
      reject(request.error);
    };
  });
}
