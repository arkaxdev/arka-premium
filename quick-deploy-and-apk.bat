@echo off
echo ========================================
echo ARKA PREMIUM - Quick Deploy & APK
echo ========================================
echo.
echo This script will help you quickly deploy your app and get APK
echo.

:menu
echo Choose an option:
echo [1] Deploy to Surge.sh (Recommended - Free & Fast)
echo [2] Fix and build with Capacitor
echo [3] Open PWABuilder website
echo [4] Exit
echo.
set /p choice=Enter your choice (1-4): 

if "%choice%"=="1" goto surge
if "%choice%"=="2" goto capacitor
if "%choice%"=="3" goto pwabuilder
if "%choice%"=="4" goto end

:surge
echo.
echo ========================================
echo Deploying to Surge.sh
echo ========================================
echo.

where surge >nul 2>nul
if %errorlevel% neq 0 (
    echo Installing Surge...
    call npm install -g surge
)

echo.
echo Deploying your app...
echo When prompted:
echo 1. Press Enter to use current directory
echo 2. Choose a domain like: arka-premium.surge.sh
echo.
call surge

echo.
echo ========================================
echo Deployment complete!
echo ========================================
echo.
echo Now:
echo 1. Go to https://www.pwabuilder.com
echo 2. Enter your surge.sh URL
echo 3. Click Start
echo 4. Download Android package
echo.
pause
goto menu

:capacitor
echo.
echo ========================================
echo Fixing Capacitor Setup
echo ========================================
echo.

echo Cleaning old files...
if exist android rmdir /s /q android
if exist www rmdir /s /q www

echo Creating www directory...
mkdir www
copy *.html www\ >nul 2>nul
copy *.json www\ >nul 2>nul
copy *.js www\ >nul 2>nul
copy *.css www\ >nul 2>nul
if exist css xcopy /E /I /Y css www\css\ >nul 2>nul
if exist js xcopy /E /I /Y js www\js\ >nul 2>nul
if exist pages xcopy /E /I /Y pages www\pages\ >nul 2>nul
if exist icons xcopy /E /I /Y icons www\icons\ >nul 2>nul

echo Updating capacitor.config.json...
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

echo Adding Android platform...
call npx cap add android
call npx cap sync

echo.
echo Done! Run 'npx cap open android' to open in Android Studio
echo.
pause
goto menu

:pwabuilder
echo.
echo Opening PWABuilder in your browser...
start https://www.pwabuilder.com
echo.
echo Steps:
echo 1. Deploy your app first using option [1]
echo 2. Enter your app URL in PWABuilder
echo 3. Download the Android package
echo.
pause
goto menu

:end
echo.
echo Goodbye!
pause
exit
