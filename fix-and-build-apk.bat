@echo off
echo ========================================
echo ARKA PREMIUM - APK Builder (Fixed Version)
echo ========================================
echo.

echo [1] Cleaning previous attempts...
if exist android (
    echo Removing old android folder...
    rmdir /s /q android
)
echo.

echo [2] Checking prerequisites...
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed!
    echo Please install Node.js from https://nodejs.org
    pause
    exit /b 1
)
echo Node.js found!
echo.

echo [3] Preparing project...
copy /Y package-capacitor.json package.json >nul
echo package.json updated
echo.

echo [4] Installing dependencies...
call npm install
echo.

echo [5] Installing Capacitor...
call npm install -D @capacitor/cli
call npm install @capacitor/core @capacitor/android @capacitor/splash-screen
echo.

echo [6] Creating capacitor.config.ts file...
(
echo import { CapacitorConfig } from '@capacitor/cli';
echo.
echo const config: CapacitorConfig = {
echo   appId: 'com.arka.premium',
echo   appName: 'ARKA PREMIUM',
echo   webDir: '.',
echo   server: {
echo     androidScheme: 'https'
echo   },
echo   android: {
echo     backgroundColor: '#667eea'
echo   }
echo };
echo.
echo export default config;
) > capacitor.config.ts
echo capacitor.config.ts created
echo.

echo [7] Adding Android platform...
call npx cap add android
if %errorlevel% neq 0 (
    echo.
    echo Trying alternative approach...
    mkdir android
    call npx cap add android --no-sync
)
echo.

echo [8] Creating required directories...
if not exist android\app\src\main\assets mkdir android\app\src\main\assets
echo.

echo [9] Syncing project...
call npx cap sync android
echo.

echo ========================================
echo Android project setup completed!
echo ========================================
echo.
echo Next steps:
echo 1. Run: npx cap open android
echo 2. Wait for Android Studio to load
echo 3. From menu: Build -^> Build Bundle(s) / APK(s) -^> Build APK(s)
echo 4. APK will be in: android\app\build\outputs\apk\debug\
echo.
echo Press any key to open Android Studio...
pause >nul

echo Opening Android Studio...
call npx cap open android

echo.
echo ========================================
echo Process completed!
echo ========================================
pause
