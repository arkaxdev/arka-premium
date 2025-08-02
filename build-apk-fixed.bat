@echo off
echo ========================================
echo ARKA PREMIUM - APK Builder (Fixed)
echo ========================================
echo.

echo [1] Cleaning up...
if exist android (
    echo Removing old android folder...
    rmdir /s /q android
)
if exist node_modules\@capacitor\android\android (
    echo Cleaning capacitor android template...
    rmdir /s /q node_modules\@capacitor\android\android
)
echo.

echo [2] Creating www directory for web assets...
if not exist www mkdir www
xcopy /E /I /Y *.html www\
xcopy /E /I /Y *.json www\
xcopy /E /I /Y *.js www\
xcopy /E /I /Y css www\css\
xcopy /E /I /Y js www\js\
xcopy /E /I /Y pages www\pages\
xcopy /E /I /Y icons www\icons\
echo Web assets copied to www folder
echo.

echo [3] Creating proper capacitor.config.json...
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
echo capacitor.config.json updated
echo.

echo [4] Installing dependencies if needed...
if not exist node_modules (
    call npm install
)
echo.

echo [5] Checking for existing Android platform...
if exist android (
    echo Android platform already exists. Removing it first...
    call npx cap remove android
    rmdir /s /q android 2>nul
    echo Old Android platform removed.
)
echo.

echo [6] Adding fresh Android platform...
call npx cap add android
if %errorlevel% neq 0 (
    echo ERROR: Failed to add Android platform!
    echo Trying alternative method...
    rmdir /s /q android 2>nul
    timeout /t 2 >nul
    call npx cap add android
    if %errorlevel% neq 0 (
        echo ERROR: Still failed. Please try the online method in SIMPLE_APK_METHOD.md
        pause
        exit /b 1
    )
)
echo Android platform added successfully!
echo.

echo [6] Copying web assets...
call npx cap copy android
echo.

echo [7] Updating plugins...
call npx cap update android
echo.

echo ========================================
echo SUCCESS! Android project created!
echo ========================================
echo.
echo The android folder has been created successfully.
echo.
echo To build APK:
echo 1. Install Android Studio if not installed
echo 2. Run: npx cap open android
echo 3. Wait for project to load
echo 4. From menu: Build -^> Build Bundle(s) / APK(s) -^> Build APK(s)
echo 5. APK location: android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo Or use the easier method: PWA_TO_APK_EASY.md
echo.
pause
