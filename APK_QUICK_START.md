# 🚀 راهنمای سریع ساخت APK

## روش 1: استفاده از اسکریپت آماده (ساده‌ترین روش)

### قدم 1: اجرای اسکریپت
در پوشه `appli` دابل کلیک کنید روی:
```
build-apk.bat
```

### قدم 2: دنبال کردن دستورات
اسکریپت به صورت خودکار:
- ✅ بررسی می‌کند Node.js نصب است
- ✅ وابستگی‌ها را نصب می‌کند
- ✅ Capacitor را راه‌اندازی می‌کند
- ✅ پروژه Android را می‌سازد

### قدم 3: ساخت APK در Android Studio
وقتی Android Studio باز شد:
1. صبر کنید پروژه کامل لود شود
2. از منوی بالا: **Build → Build APK(s)**
3. صبر کنید تا APK ساخته شود
4. پیام "APK(s) generated successfully" ظاهر می‌شود
5. روی **locate** کلیک کنید تا فایل APK را ببینید

---

## روش 2: استفاده از PWA Builder (بدون نصب نرم‌افزار)

### قدم 1: آپلود روی هاست
فایل‌های پوشه `appli` را روی یک هاست HTTPS آپلود کنید

### قدم 2: ساخت APK آنلاین
1. به [www.pwabuilder.com](https://www.pwabuilder.com) بروید
2. آدرس سایت خود را وارد کنید
3. **Start** را بزنید
4. بعد از آنالیز، **Build My PWA** را بزنید
5. **Android** را انتخاب کنید
6. **Download** را بزنید

---

## 📱 نصب APK روی گوشی

### روش 1: با کابل USB
```bash
adb install app-debug.apk
```

### روش 2: انتقال فایل
1. فایل APK را به گوشی منتقل کنید
2. در گوشی، **Settings → Security → Unknown sources** را فعال کنید
3. فایل APK را باز کنید و نصب کنید

---

## ⚠️ نکات مهم

### اگر خطا دادید:
1. **Node.js نصب نیست**: از [nodejs.org](https://nodejs.org) دانلود کنید
2. **Android Studio نصب نیست**: از [developer.android.com/studio](https://developer.android.com/studio) دانلود کنید
3. **خطای Gradle**: اینترنت پایدار داشته باشید

### حجم APK:
- APK debug: حدود 5-10 مگابایت
- APK release: حدود 3-7 مگابایت

---

## 🎯 خلاصه دستورات

```bash
# در پوشه appli
build-apk.bat

# یا به صورت دستی:
cd appli
copy package-capacitor.json package.json
npm install
npx cap add android
npx cap sync
npx cap open android
```

---

## 📞 پشتیبانی

اگر مشکلی داشتید:
1. فایل `APK_BUILD_GUIDE.md` را بخوانید
2. مطمئن شوید همه پیش‌نیازها نصب هستند
3. از روش PWA Builder استفاده کنید (ساده‌تر است)

**موفق باشید! 🎉**
