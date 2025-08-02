# 📱 راهنمای نهایی ساخت APK از ARKA PREMIUM

## ✅ وضعیت فعلی
- ✅ افزونه کروم به PWA تبدیل شد
- ✅ پروژه Capacitor آماده شد
- ✅ پوشه Android ایجاد شد
- ✅ فایل ZIP برای آپلود آماده شد: `www-for-upload.zip`
- ❌ Android Studio نصب نیست

## 🚀 روش‌های ساخت APK

### روش 1: Netlify + PWABuilder (سریع‌ترین)
1. **آپلود به Netlify:**
   - به https://app.netlify.com/drop بروید
   - فایل `www-for-upload.zip` را drag & drop کنید
   - URL سایت را کپی کنید

2. **ساخت APK با PWABuilder:**
   - به https://www.pwabuilder.com بروید
   - URL Netlify را وارد کنید
   - "Start" را کلیک کنید
   - "Package for stores" → "Android" را انتخاب کنید
   - تنظیمات:
     - Package ID: `com.arka.premium`
     - App name: `ARKA PREMIUM`
   - "Download" را کلیک کنید

### روش 2: Vercel (خودکار)
```batch
auto-deploy-vercel.bat
```
- این اسکریپت به صورت خودکار آپلود می‌کند
- URL نهایی را در PWABuilder استفاده کنید

### روش 3: GitHub Pages
1. یک repository جدید در GitHub بسازید
2. محتویات پوشه `www` را آپلود کنید
3. از Settings → Pages فعال کنید
4. URL را در PWABuilder استفاده کنید

### روش 4: AppsGeyser (بدون آپلود)
1. به https://www.appsgeyser.com بروید
2. "Create App" → "Website" را انتخاب کنید
3. URL: `file:///C:/Users/Byte/Desktop/appli/www/index.html`
4. نام و آیکون را تنظیم کنید
5. APK را دانلود کنید

## 📁 فایل‌های آماده
- `www-for-upload.zip` - آماده آپلود در Netlify
- `pwa-builder-guide.html` - راهنمای تصویری
- `auto-deploy-vercel.bat` - آپلود خودکار

## 🔑 اطلاعات تست
- Username: `ParsPremiummidjourney463`
- Password: `ParsPremium:1404`

## 📱 نصب APK
پس از دانلود APK:
1. فایل را به گوشی منتقل کنید
2. "Unknown sources" را فعال کنید
3. APK را نصب کنید

## ⚡ توصیه
**روش Netlify + PWABuilder** سریع‌ترین و ساده‌ترین روش است!
