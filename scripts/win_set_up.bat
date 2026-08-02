@echo off
setlocal enabledelayedexpansion

echo ----------------------------------------
powershell -NoProfile -Command "Write-Host ' Welcome To Make It Setup ' -ForegroundColor Blue"
powershell -NoProfile -Command "Write-Host ' Developer : Niranjan Kumar K ' -ForegroundColor Green"
powershell -NoProfile -Command "Write-Host ' Version   : 1.0 ' -ForegroundColor Red"
echo ----------------------------------------

set INSTALL=C:\makeit
set BIN=%INSTALL%\bin
set DATA=%INSTALL%\data

if not exist "%BIN%" mkdir "%BIN%"
if not exist "%DATA%" mkdir "%DATA%"

echo.
powershell -NoProfile -Command "Write-Host 'Downloading Make It...' -ForegroundColor Yellow"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Invoke-WebRequest -Uri 'https://hacker1514.github.io/make_it/download/make_it_win.exe' -OutFile '%BIN%\makeit.exe'"

if not exist "%BIN%\makeit.exe" (
    echo.
    powershell -NoProfile -Command "Write-Host 'ERROR: Download failed' -ForegroundColor Red"
    pause
    exit /b 1
)

powershell -NoProfile -Command "Write-Host 'Download successful!' -ForegroundColor Green"

echo.
powershell -NoProfile -Command "Write-Host 'Adding PATH...' -ForegroundColor Yellow"

setx PATH "%PATH%;%BIN%" >nul

powershell -NoProfile -Command "Write-Host 'PATH updated.' -ForegroundColor Green"

echo.
echo ----------------------------------------
powershell -NoProfile -Command "Write-Host 'Groq API Key Configuration' -ForegroundColor Cyan"
echo ----------------------------------------

set /p AI_KEY="Enter Groq API Key: "

if "%AI_KEY%"=="" (
    echo API key empty
    pause
    exit /b 1
)

echo.
powershell -NoProfile -Command "Write-Host 'Validating API key...' -ForegroundColor Yellow"

curl -s ^
-H "Authorization: Bearer %AI_KEY%" ^
https://api.groq.com/openai/v1/models ^
-o "%TEMP%\groq.json"

findstr "object" "%TEMP%\groq.json" >nul

if errorlevel 1 (
    powershell -NoProfile -Command "Write-Host 'Invalid API key' -ForegroundColor Red"
    del "%TEMP%\groq.json"
    pause
    exit /b 1
)

powershell -NoProfile -Command "Write-Host 'API key verified!' -ForegroundColor Green"

(
echo {
echo   "api_key": "%AI_KEY%"
echo }
) > "%DATA%\api.json"

echo.
echo ----------------------------------------
powershell -NoProfile -Command "Write-Host 'Make It Installed Successfully!' -ForegroundColor Green"
echo ----------------------------------------

echo Location : %INSTALL%
echo Binary   : %BIN%\makeit.exe
echo Config   : %DATA%\api.json

echo.
echo Close this CMD and open a new one.
echo Run:
echo.
echo     makeit
echo.

pause
del "%~f0" >nul 2>&1
endlocal
