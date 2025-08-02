@echo off
echo ========================================
echo ARKA PREMIUM - APK Builder
echo ========================================
echo.

echo [1] Checking prerequisites...
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed!
    echo Please install Node.js from https://nodejs.org
    pause
    exit /b 1
)

where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: npm is not installed!
    echo Please install Node.js from https://nodejs.org
    pause
    exit /b 1
)

echo Node.js and npm found!
echo.

echo [2] Preparing project...
copy /Y package-capacitor.json package.json >nul
echo package.json updated for Capacitor
echo.

echo [3] Installing dependencies...
echo This may take a few minutes...
call npm install
if %errorlevel% neq 0 (
    echo ERROR: Failed to install dependencies!
    pause
    exit /b 1
)
echo.

echo [4] Installing Capacitor...
call npm install -D @capacitor/cli
call npm install @capacitor/core @capacitor/android
if %errorlevel% neq 0 (
    echo ERROR: Failed to install Capacitor!
    pause
    exit /b 1
)
echo.

echo [5] Initializing Capacitor...
echo Using existing capacitor.config.json
echo.

echo [6] Adding Android platform...
call npx cap add android
if %errorlevel% neq 0 (
    echo ERROR: Failed to add Android platform!
    pause
    exit /b 1
)
echo.

echo [7] Syncing project...
call npx cap sync
echo.

echo ========================================
echo SUCCESS! Android project created!
echo ========================================
echo.
echo Next steps:
echo 1. Make sure Android Studio is installed
echo 2. Run: npx cap open android
echo 3. In Android Studio: Build ^> Build APK(s)
echo.
echo Would you like to open Android Studio now? (Y/N)
set /p answer=

if /i "%answer%"=="Y" (
    echo Opening Android Studio...
    call npx cap open android
) else (
    echo You can open it later with: npx cap open android
)

echo.
echo ========================================
echo APK build process completed!
echo ========================================
pause
