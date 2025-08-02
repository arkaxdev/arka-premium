@echo off
echo ========================================
echo ARKA PREMIUM - Clean & Rebuild
echo ========================================
echo.
echo This will completely clean and rebuild the Android project
echo.

echo [1] Removing all build artifacts...
if exist android (
    echo Removing android folder...
    rmdir /s /q android
)
if exist www (
    echo Removing www folder...
    rmdir /s /q www
)
if exist node_modules (
    echo Removing node_modules...
    rmdir /s /q node_modules
)
echo.

echo [2] Reinstalling dependencies...
call npm install
echo.

echo [3] Creating www directory...
mkdir www
echo Copying files to www...
copy *.html www\ >nul 2>nul
copy *.json www\ >nul 2>nul
copy *.js www\ >nul 2>nul
if exist css xcopy /E /I /Y css www\css\ >nul 2>nul
if exist js xcopy /E /I /Y js www\js\ >nul 2>nul
if exist pages xcopy /E /I /Y pages www\pages\ >nul 2>nul
if exist icons xcopy /E /I /Y icons www\icons\ >nul 2>nul
echo.

echo [4] Creating capacitor.config.json...
(
echo {
echo   "appId": "com.arka.premium",
echo   "appName": "ARKA PREMIUM",
echo   "webDir": "www",
echo   "server": {
echo     "androidScheme": "https"
echo   }
echo }
) > capacitor.config.json
echo.

echo [5] Adding Android platform...
call npx cap add android
echo.

echo [6] Syncing...
call npx cap sync
echo.

echo ========================================
echo Clean rebuild complete!
echo ========================================
echo.
echo Next steps:
echo Option 1: Run 'npx cap open android' to open in Android Studio
echo Option 2: Use quick-deploy-and-apk.bat for online APK generation
echo.
pause
