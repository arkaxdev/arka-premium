# 📱 راهنمای ساخت APK از ARKA PREMIUM

## 🚨 مشکل فعلی:
پوشه android قبلاً ایجاد شده و باعث خطا می‌شود.

## ✅ راه‌حل‌ها (به ترتیب سادگی):

### 1️⃣ **روش آنلاین (ساده‌ترین - 5 دقیقه)**
```batch
quick-deploy-and-apk.bat
```
- گزینه 1 را انتخاب کنید (Deploy to Surge.sh)
- سپس به PWABuilder بروید
- APK را دانلود کنید

### 2️⃣ **پاک کردن و ساخت مجدد**
```batch
clean-and-rebuild.bat
```
این اسکریپت:
- ✅ همه چیز را پاک می‌کند
- ✅ از اول می‌سازد
- ✅ مشکل android موجود را حل می‌کند

### 3️⃣ **روش دستی سریع**
```batch
rmdir /s /q android
rmdir /s /q www
build-apk-fixed.bat
```

## 🌐 بدون نیاز به Android Studio:

### استفاده از Surge + PWABuilder:
1. در Command Prompt:
   ```batch
   npm install -g surge
   surge
   ```
2. یک نام دامنه انتخاب کنید (مثل: arka-premium.surge.sh)
3. به [pwabuilder.com](https://www.pwabuilder.com) بروید
4. URL را وارد کنید
5. APK را دانلود کنید

## 📂 فایل‌های موجود:
- `clean-and-rebuild.bat` - پاک‌سازی کامل و ساخت مجدد
- `quick-deploy-and-apk.bat` - منوی تعاملی
- `build-apk-fixed.bat` - ساخت با رفع مشکلات
- `SIMPLE_APK_METHOD.md` - روش‌های جایگزین
- `PWA_TO_APK_EASY.md` - راهنمای PWABuilder

## 🔑 اطلاعات تست:
- Username: `ParsPremiummidjourney463`
- Password: `ParsPremium:1404`

## ⚡ سریع‌ترین روش:
```
1. clean-and-rebuild.bat را اجرا کنید
2. یا از quick-deploy-and-apk.bat استفاده کنید
```

---
**نکته:** اگر همچنان مشکل دارید، از روش آنلاین (Surge + PWABuilder) استفاده کنید که تضمینی کار می‌کند! 🚀
