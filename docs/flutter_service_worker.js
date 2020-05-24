'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"main.dart.js": "16b62aeb2d79df89cac6689e400f6ed3",
"assets/images/bg2.jpg": "eb3b9e51cab01a9c44fb1bd547106c34",
"assets/images/stackoverflow.png": "abf5394958c7dd6722db8e9412df04ab",
"assets/images/sto.png": "7609d650d10b1ea78119fd4ec8e31197",
"assets/images/bg1.jpeg": "3dfcd3fddbe32375f80f44b5ff7a6126",
"assets/FontManifest.json": "f7161631e25fbd47f3180eae84053a51",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "d19bb755d21978517e2317953fafade6",
"assets/packages/flutter_markdown/assets/logo.png": "67642a0b80f3d50277c44cde8f450e50",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/AssetManifest.json": "fe8b71954e62758969ec92f75bccd59d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "2734d002a88ce8b7b26d1ddbf0239ce8",
"index.html": "2dbf9e6ad1a87b9d9f741dc040fb956d",
"/": "2dbf9e6ad1a87b9d9f741dc040fb956d"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
