# راهنمای تبدیل ARKA PREMIUM به فایل APK

## پیش‌نیازها:

### 1. نصب Node.js و npm
- از سایت [nodejs.org](https://nodejs.org) دانلود و نصب کنید
- برای بررسی نصب:
```bash
node --version
npm --version
```

### 2. نصب Android Studio
- از سایت [developer.android.com/studio](https://developer.android.com/studio) دانلود کنید
- Android SDK را نصب کنید
- متغیرهای محیطی را تنظیم کنید:
  - `ANDROID_HOME` = مسیر Android SDK
  - `PATH` شامل `platform-tools` و `tools`

### 3. نصب Java JDK
- JDK 11 یا بالاتر نیاز است
- از [adoptium.net](https://adoptium.net) دانلود کنید

## مراحل تبدیل به APK:

### روش 1: استفاده از Capacitor (توصیه شده)

#### مرحله 1: آماده‌سازی پروژه
```bash
cd appli

# کپی package-capacitor.json به package.json
copy package-capacitor.json package.json

# نصب وابستگی‌ها
npm install
```

#### مرحله 2: نصب Capacitor
```bash
# نصب Capacitor CLI
npm install -D @capacitor/cli

# نصب Capacitor Core و Android
npm install @capacitor/core @capacitor/android

# مقداردهی اولیه Capacitor (اگر پرسید، تنظیمات موجود را تایید کنید)
npx cap init
```

#### مرحله 3: اضافه کردن پلتفرم Android
```bash
# اضافه کردن Android
npx cap add android

# سینک کردن فایل‌ها
npx cap sync
```

#### مرحله 4: باز کردن در Android Studio
```bash
npx cap open android
```

#### مرحله 5: ساخت APK در Android Studio
1. صبر کنید تا پروژه کاملاً لود شود
2. از منوی **Build** گزینه **Build Bundle(s) / APK(s)** را انتخاب کنید
3. **Build APK(s)** را کلیک کنید
4. صبر کنید تا build کامل شود
5. APK در مسیر زیر ایجاد می‌شود:
   ```
   android/app/build/outputs/apk/debug/app-debug.apk
   ```

### روش 2: استفاده از PWA Builder (آنلاین)

#### مرحله 1: آپلود فایل‌ها
1. فایل‌های پروژه را روی یک هاست HTTPS آپلود کنید
2. به [pwabuilder.com](https://www.pwabuilder.com) بروید

#### مرحله 2: تولید APK
1. URL اپلیکیشن خود را وارد کنید
2. **Start** را کلیک کنید
3. بعد از آنالیز، **Build My PWA** را انتخاب کنید
4. **Android** را انتخاب کنید
5. تنظیمات را بررسی و **Download** کنید

### روش 3: استفاده از Bubblewrap (خط فرمان)

#### نصب Bubblewrap
```bash
npm install -g @bubblewrap/cli
```

#### ایجاد پروژه Android
```bash
bubblewrap init --manifest="https://your-domain.com/manifest.json"
bubblewrap build
```

## تنظیمات مهم برای APK:

### 1. آیکون‌ها
مطمئن شوید آیکون‌های زیر موجود هستند:
- `icons/icon-192x192.png`
- `icons/icon-512x512.png`

### 2. امضای APK
برای انتشار در Google Play، باید APK را امضا کنید:
```bash
# ایجاد keystore
keytool -genkey -v -keystore arka-release-key.keystore -alias arka -keyalg RSA -keysize 2048 -validity 10000

# امضای APK
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore arka-release-key.keystore app-release-unsigned.apk arka

# بهینه‌سازی APK
zipalign -v 4 app-release-unsigned.apk arka-premium.apk
```

### 3. تست APK
```bash
# نصب روی دستگاه متصل
adb install arka-premium.apk

# یا انتقال فایل APK به گوشی و نصب دستی
```

## رفع مشکلات رایج:

### خطای "JDK not found"
- مطمئن شوید `JAVA_HOME` به درستی تنظیم شده است

### خطای "Android SDK not found"
- `ANDROID_HOME` را تنظیم کنید
- Android SDK را از Android Studio نصب کنید

### خطای "Gradle build failed"
- اینترنت پایدار داشته باشید
- Gradle cache را پاک کنید: `cd android && ./gradlew clean`

## نکات نهایی:

1. **اندازه APK**: معمولاً 5-10 مگابایت
2. **حداقل Android**: API 21 (Android 5.0)
3. **مجوزها**: اینترنت و ذخیره‌سازی
4. **تست**: حتماً روی دستگاه‌های مختلف تست کنید

## دستورات سریع:

```bash
# همه مراحل در یک دستور
cd appli
copy package-capacitor.json package.json
npm install
npx cap add android
npx cap sync
npx cap open android
```

پس از اجرای این دستورات، Android Studio باز می‌شود و می‌توانید APK را بسازید.

---

**توجه**: برای ساخت APK نیاز به نصب Android Studio و تنظیمات محیطی دارید. اگر این امکانات را ندارید، از PWA Builder استفاده کنید.
