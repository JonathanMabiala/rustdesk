@echo off
REM Build release and assemble a portable folder next to the repo
setlocal enabledelayedexpansion
































exit /b 0endlocal
necho Portable bundle created: %DIST%
necho Zip: %SCRIPT_DIR%dist\rustdesk-portable.zippowershell -NoProfile -Command "if(Test-Path '%DIST%') {Compress-Archive -Path (Join-Path '%DIST%' '*') -DestinationPath (Join-Path '%SCRIPT_DIR%' 'dist\rustdesk-portable.zip') -Force}" >nul 2>&1
:: Optional: create a zip using PowerShell Compress-Archive
necho Creating zip archive dist\rustdesk-portable.zip ...if exist res\tray-icon.ico xcopy /y /i res\tray-icon.ico "%DIST%\" >nul
nif exist res\manifest.xml xcopy /y /i res\manifest.xml "%DIST%\" >nul
:: Copy other extras that may be needed (icons, manifest)xcopy /E /I src\ui "%DIST%\src\ui" >nul
nxcopy /E /I res "%DIST%\res" >nul
:: Copy UI files and resources (what worked for you))  xcopy /y /i sciter.dll "%DIST%\" >nul) else if exist sciter.dll (  xcopy /y /i target\release\sciter.dll "%DIST%\" >nulif exist target\release\sciter.dll (
:: Copy sciter.dll if the project ships it in release folder or repo rootxcopy /y /i target\release\rustdesk.exe "%DIST%\" >nul
nif exist target\release\rustdesk.pdb xcopy /y /i target\release\rustdesk.pdb "%DIST%\" >nul
:: Copy executable and debug info if presentmkdir "%DIST%")  rmdir /s /q "%DIST%"if exist "%DIST%" (set DIST=%SCRIPT_DIR%dist\rustdesk-portable
:: Prepare dist folder)  exit /b 1  echo Build failed, aborting.cargo build --release || (
:: Build releasecd /d "%SCRIPT_DIR%"set SCRIPT_DIR=%~dp0:: Root of repo (script location)