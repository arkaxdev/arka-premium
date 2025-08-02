@echo off
echo ========================================
echo FORCE REMOVE ANDROID PLATFORM
echo ========================================
echo.

echo [1] Force removing Android platform...
cd /d "C:\Users\Byte\Desktop\appli"

echo Removing android folder...
if exist android (
    attrib -r -s -h android\*.* /s /d
    rmdir /s /q android
)

echo Removing from Capacitor config...
if exist capacitor.config.json (
    del capacitor.config.json
)

echo Cleaning npm cache...
call npm cache clean --force >nul 2>&1

echo Removing platform from package.json...
call npx cap remove android >nul 2>&1

echo.
echo [2] Creating fresh capacitor.config.json...
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
echo [3] Creating www folder if not exists...
if not exist www mkdir www

echo Copying files to www...
copy *.html www\ >nul 2>&1
copy *.js www\ >nul 2>&1
copy *.json www\ >nul 2>&1
if exist css xcopy /E /I /Y css www\css\ >nul 2>&1
if exist js xcopy /E /I /Y js www\js\ >nul 2>&1
if exist pages xcopy /E /I /Y pages www\pages\ >nul 2>&1
if exist icons xcopy /E /I /Y icons www\icons\ >nul 2>&1

echo.
echo ========================================
echo Android platform completely removed!
echo ========================================
echo.
echo Now you can run one of these commands:
echo.
echo 1. npx cap add android
echo 2. build-apk-fixed.bat
echo 3. Use the online method (recommended)
echo.
pause
