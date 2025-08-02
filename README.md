# ARKA PREMIUM - Progressive Web App (PWA)

## 🚀 درباره اپلیکیشن

ARKA PREMIUM یک اپلیکیشن Progressive Web App (PWA) برای مدیریت کوکی‌ها و دسترسی به سایت‌های مختلف است که از افزونه کروم به اپلیکیشن موبایل تبدیل شده است.

### ✨ ویژگی‌ها

- 🔐 سیستم احراز هویت امن
- 🍪 مدیریت کوکی‌ها و دسترسی‌ها
- 📱 طراحی کاملاً ریسپانسیو و بهینه برای موبایل
- 🌐 قابلیت کار آفلاین
- ⚡ عملکرد سریع و روان
- 🎨 رابط کاربری زیبا و مدرن
- 🔄 بروزرسانی خودکار

## 📱 نصب روی اندروید

### روش 1: نصب مستقیم از مرورگر (توصیه شده)

1. **باز کردن در Chrome/Edge:**
   - اپلیکیشن را در مرورگر Chrome یا Edge موبایل باز کنید
   - آدرس: `https://your-domain.com/android-app/`

2. **نصب PWA:**
   - منتظر بمانید تا نوار "Add to Home Screen" ظاهر شود
   - یا از منوی سه نقطه گزینه "Add to Home Screen" را انتخاب کنید
   - نام اپلیکیشن را تأیید کنید
   - روی "Install" کلیک کنید

3. **دسترسی به اپلیکیشن:**
   - آیکون اپلیکیشن در صفحه اصلی گوشی اضافه می‌شود
   - مثل یک اپلیکیشن معمولی اجرا می‌شود

### روش 2: استفاده از TWA (Trusted Web Activity)

برای تبدیل به APK و انتشار در Google Play:

1. **نصب Android Studio**
2. **استفاده از Bubblewrap:**
   ```bash
   npm i -g @bubblewrap/cli
   bubblewrap init --manifest https://your-domain.com/android-app/manifest.json
   bubblewrap build
   ```

## 🖥️ راه‌اندازی سرور محلی

### پیش‌نیازها

- Node.js (نسخه 14 یا بالاتر)
- npm یا yarn

### نصب و اجرا

1. **کلون کردن پروژه:**
   ```bash
   git clone [repository-url]
   cd android-app
   ```

2. **نصب وابستگی‌ها:**
   ```bash
   npm install
   ```

3. **اجرای سرور توسعه:**
   ```bash
   npm start
   ```

4. **دسترسی به اپلیکیشن:**
   - مرورگر: `http://localhost:8080`
   - موبایل (در همان شبکه): `http://[YOUR-IP]:8080`

## 🛠️ ساختار پروژه

```
android-app/
├── index.html          # صفحه اصلی PWA
├── manifest.json       # تنظیمات PWA
├── service-worker.js   # Service Worker برای آفلاین
├── pages/             # صفحات اپلیکیشن
│   ├── splash.html    # صفحه اسپلش
│   ├── login.html     # صفحه ورود
│   └── home.html      # صفحه اصلی
├── css/               # استایل‌ها
│   ├── splash.css
│   ├── login.css
│   └── home.css
├── js/                # اسکریپت‌ها
│   ├── app.js         # منطق اصلی
│   ├── login.js       # کنترلر لاگین
│   └── home.js        # کنترلر صفحه اصلی
└── icons/             # آیکون‌های PWA
```

## 🔧 تنظیمات

### تغییر آدرس API

در فایل‌های `js/login.js` و `js/home.js`:

```javascript
const apiBase = 'https://api.divateam.co/api';
```

### تنظیمات PWA

در فایل `manifest.json`:
- نام اپلیکیشن
- رنگ‌ها
- آیکون‌ها
- جهت نمایش

## 📝 نکات مهم

### امنیت

- اپلیکیشن باید روی HTTPS سرو شود
- کوکی‌ها در IndexedDB ذخیره می‌شوند
- توکن‌ها به صورت امن مدیریت می‌شوند

### سازگاری

- Android 5.0+ (Chrome 40+)
- iOS 11.3+ (Safari)
- تمام مرورگرهای مدرن

### بهینه‌سازی

- حجم کل اپلیکیشن: کمتر از 2MB
- زمان بارگذاری اولیه: کمتر از 3 ثانیه
- قابلیت کش کردن منابع

## 🚀 انتشار

### 1. آپلود روی هاست

```bash
# Build for production
npm run build

# Upload files to server
scp -r dist/* user@server:/var/www/html/
```

### 2. تنظیمات سرور

**Apache (.htaccess):**
```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^index\.html$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
</IfModule>

# Enable HTTPS
Header always set Strict-Transport-Security "max-age=31536000"
```

**Nginx:**
```nginx
server {
    listen 443 ssl http2;
    server_name your-domain.com;
    
    root /var/www/html;
    index index.html;
    
    location / {
        try_files $uri $uri/ /index.html;
    }
    
    # SSL configuration
    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;
}
```

## 🐛 عیب‌یابی

### اپلیکیشن نصب نمی‌شود

1. بررسی HTTPS
2. بررسی manifest.json
3. بررسی Service Worker

### مشکل در لاگین

1. بررسی اتصال اینترنت
2. بررسی آدرس API
3. بررسی CORS headers

### کوکی‌ها کار نمی‌کنند

1. بررسی دامنه سایت
2. بررسی تنظیمات امنیتی
3. بررسی IndexedDB

## 📞 پشتیبانی

- ایمیل: support@arkateam.com
- تلگرام: @arkasupport
- وبسایت: https://arkateam.com

## 📄 لایسنس

Copyright © 2024 ARKA Team. All rights reserved.
