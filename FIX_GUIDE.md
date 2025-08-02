# راهنمای رفع مشکل "No static resource api/v1/auth/login"

## علت مشکل:
Service Worker تمام درخواست‌ها را cache می‌کند و سعی می‌کند درخواست‌های API را از cache بخواند که باعث خطای 404 می‌شود.

## راه حل‌ها:

### راه حل 1: پاک کردن Cache مرورگر (سریع‌ترین)
1. در مرورگر کروم، `F12` را فشار دهید
2. به تب `Application` بروید
3. در منوی سمت چپ، `Storage` را پیدا کنید
4. روی `Clear site data` کلیک کنید
5. صفحه را رفرش کنید (`F5`)

### راه حل 2: استفاده از حالت Incognito
1. مرورگر را در حالت Incognito/Private باز کنید
2. به آدرس `http://localhost:8080` بروید
3. با اطلاعات زیر وارد شوید:
   - Username: `ParsPremiummidjourney463`
   - Password: `ParsPremium:1404`

### راه حل 3: غیرفعال کردن موقت Service Worker
1. فایل `index.html` را باز کنید
2. خط زیر را کامنت کنید:
   ```html
   <!-- <script src="js/sw-register.js"></script> -->
   ```
3. ذخیره کنید و صفحه را رفرش کنید

### راه حل 4: اصلاح Service Worker (دائمی)
Service Worker فعلی به درستی پیکربندی شده و درخواست‌های API را از cache مستثنی کرده است. اما اگر مشکل ادامه داشت:

1. فایل `service-worker.js` را باز کنید
2. در قسمت fetch event، مطمئن شوید این کد وجود دارد:
   ```javascript
   // Skip API requests (always fetch from network)
   if (event.request.url.includes('api.divateam.co') || 
       event.request.url.includes('/api/')) {
     event.respondWith(fetch(event.request));
     return;
   }
   ```

## تست بدون API واقعی:

برای تست کامل اپلیکیشن بدون نیاز به API واقعی:

1. فایل `test-login.html` را در مرورگر باز کنید:
   ```
   http://localhost:8080/test-login.html
   ```

2. با اطلاعات تست وارد شوید:
   - Username: `ParsPremiummidjourney463`
   - Password: `ParsPremium:1404`

این صفحه به صورت موک (mock) کار می‌کند و نیازی به API واقعی ندارد.

## نکات مهم:

1. **برای استفاده واقعی**: اپلیکیشن را روی یک هاست HTTPS آپلود کنید
2. **برای تست محلی**: از حالت Incognito یا پاک کردن cache استفاده کنید
3. **Service Worker**: فقط در محیط HTTPS به طور کامل کار می‌کند

## اطلاعات تماس:
در صورت ادامه مشکل، لطفاً با تیم پشتیبانی ARKA تماس بگیرید.
