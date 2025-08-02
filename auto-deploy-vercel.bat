@echo off
echo ========================================
echo   ARKA PREMIUM - Auto Deploy to Vercel
echo ========================================
echo.

cd /d "C:\Users\Byte\Desktop\appli"

echo Installing Vercel CLI...
call npm install -g vercel

echo.
echo Deploying to Vercel...
echo.
echo NOTE: When prompted:
echo 1. Press Enter to continue
echo 2. Select "N" for new project
echo 3. Use default settings
echo.

cd www
vercel --prod

echo.
echo ========================================
echo Deployment complete!
echo.
echo Your app is now live on Vercel!
echo Use the URL above in PWABuilder.com
echo ========================================
pause
