@echo off
chcp 65001 >nul
title Installer Aplikasi - Firefox & WinRAR
color 1f

:menu
cls
echo ========================================
echo        INSTALLER APLIKASI OTOMATIS
echo ========================================
echo  1. Install Firefox (Latest)
echo  2. Install WinRAR (Latest)
echo  3. Install Keduanya
echo  4. Keluar
echo ========================================
echo.

set /p pilihan=Masukkan pilihan [1-4]: 

if "%pilihan%"=="1" goto firefox
if "%pilihan%"=="2" goto winrar
if "%pilihan%"=="3" goto both
if "%pilihan%"=="4" goto exit
echo Pilihan tidak valid! & pause & goto menu

:firefox
cls
echo ========================================
echo        DOWNLOAD FIREFOX
echo ========================================
echo.

:: Download Firefox (64-bit)
echo [INFO] Mendownload Firefox...
powershell -command "& {Invoke-WebRequest -Uri 'https://download.mozilla.org/?product=firefox-latest&os=win64&lang=id' -OutFile '%TEMP%\FirefoxSetup.exe'}"
if errorlevel 1 (
    echo [ERROR] Gagal mendownload Firefox!
    pause
    goto menu
)

:: Install Firefox dengan progress
echo.
echo ========================================
echo        INSTALL FIREFOX
echo ========================================
echo [INFO] Menginstall Firefox...
echo [INFO] Mohon tunggu...
start /wait "" "%TEMP%\FirefoxSetup.exe" /S /InstallDirectoryPath="C:\Program Files\Mozilla Firefox"
if errorlevel 1 (
    echo [ERROR] Gagal menginstall Firefox!
    pause
    goto menu
)

echo [SUCCESS] Firefox berhasil diinstall!
del "%TEMP%\FirefoxSetup.exe" >nul 2>&1
pause
goto menu

:winrar
cls
echo ========================================
echo        DOWNLOAD WINRAR
echo ========================================
echo.

:: Download WinRAR (64-bit)
echo [INFO] Mendownload WinRAR...
powershell -command "& {Invoke-WebRequest -Uri 'https://www.rarlab.com/rar/winrar-x64-700.exe' -OutFile '%TEMP%\WinRARSetup.exe'}"
if errorlevel 1 (
    echo [ERROR] Gagal mendownload WinRAR!
    pause
    goto menu
)

:: Install WinRAR dengan progress
echo.
echo ========================================
echo        INSTALL WINRAR
echo ========================================
echo [INFO] Menginstall WinRAR...
echo [INFO] Mohon tunggu...
start /wait "" "%TEMP%\WinRARSetup.exe" /S
if errorlevel 1 (
    echo [ERROR] Gagal menginstall WinRAR!
    pause
    goto menu
)

echo [SUCCESS] WinRAR berhasil diinstall!
del "%TEMP%\WinRARSetup.exe" >nul 2>&1
pause
goto menu

:both
cls
echo ========================================
echo        INSTALL FIREFOX & WINRAR
echo ========================================
echo.

:: Download Firefox
echo [INFO] Mendownload Firefox...
powershell -command "& {Invoke-WebRequest -Uri 'https://download.mozilla.org/?product=firefox-latest&os=win64&lang=id' -OutFile '%TEMP%\FirefoxSetup.exe'}"
if errorlevel 1 (
    echo [ERROR] Gagal mendownload Firefox!
    pause
    goto menu
)

:: Download WinRAR
echo [INFO] Mendownload WinRAR...
powershell -command "& {Invoke-WebRequest -Uri 'https://www.rarlab.com/rar/winrar-x64-700.exe' -OutFile '%TEMP%\WinRARSetup.exe'}"
if errorlevel 1 (
    echo [ERROR] Gagal mendownload WinRAR!
    del "%TEMP%\FirefoxSetup.exe" >nul 2>&1
    pause
    goto menu
)

:: Install Firefox
echo.
echo ========================================
echo        INSTALL FIREFOX
echo ========================================
echo [INFO] Menginstall Firefox...
start /wait "" "%TEMP%\FirefoxSetup.exe" /S /InstallDirectoryPath="C:\Program Files\Mozilla Firefox"
if errorlevel 1 (
    echo [ERROR] Gagal menginstall Firefox!
)

:: Install WinRAR
echo.
echo ========================================
echo        INSTALL WINRAR
echo ========================================
echo [INFO] Menginstall WinRAR...
start /wait "" "%TEMP%\WinRARSetup.exe" /S
if errorlevel 1 (
    echo [ERROR] Gagal menginstall WinRAR!
)

echo [SUCCESS] Installasi selesai!
del "%TEMP%\FirefoxSetup.exe" >nul 2>&1
del "%TEMP%\WinRARSetup.exe" >nul 2>&1
pause
goto menu

:exit
echo Terima kasih telah menggunakan installer ini!
echo https://github.com/xdr7/Tools_Automatic_Software_Install_BAT
echo by Asmaul Asni S, S.Kom
timeout /t 3 >nul

exit
