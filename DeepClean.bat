@echo off
title 🧹 Ultimate Windows Cleanup Tool
echo Running as Administrator...
echo.

:: ==============================
:: Windows Temp
echo Deleting Windows Temp...
del /s /f /q "C:\Windows\Temp\*.*" >nul 2>nul
for /d %%p in ("C:\Windows\Temp\*.*") do rmdir "%%p" /s /q >nul 2>nul

:: User Temp
echo Deleting User Temp...
del /s /f /q "%temp%\*.*" >nul 2>nul
for /d %%p in ("%temp%\*.*") do rmdir "%%p" /s /q >nul 2>nul

:: Prefetch
echo Deleting Prefetch files...
del /s /f /q "C:\Windows\Prefetch\*.*" >nul 2>nul

:: Recycle Bin
echo Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin >nul 2>nul

:: Windows Update Cache
echo Cleaning Windows Update cache...
del /s /f /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>nul
for /d %%p in ("C:\Windows\SoftwareDistribution\Download\*.*") do rmdir "%%p" /s /q >nul 2>nul

:: Windows Log Files
echo Cleaning Windows Log files...
del /s /f /q "C:\Windows\Logs\*.*" >nul 2>nul
for /d %%p in ("C:\Windows\Logs\*.*") do rmdir "%%p" /s /q >nul 2>nul

:: ==============================
:: Browser Cache Cleanup
setlocal enabledelayedexpansion

:: Chrome
echo Cleaning Google Chrome Cache...
set "chromeCache=%localappdata%\Google\Chrome\User Data\Default\Cache"
if exist "!chromeCache!" (
  del /s /f /q "!chromeCache!\*.*" >nul 2>nul
  for /d %%p in ("!chromeCache!\*.*") do rmdir "%%p" /s /q >nul 2>nul
)

:: Edge
echo Cleaning Microsoft Edge Cache...
set "edgeCache=%localappdata%\Microsoft\Edge\User Data\Default\Cache"
if exist "!edgeCache!" (
  del /s /f /q "!edgeCache!\*.*" >nul 2>nul
  for /d %%p in ("!edgeCache!\*.*") do rmdir "%%p" /s /q >nul 2>nul
)

:: Firefox
echo Cleaning Mozilla Firefox Cache...
for /d %%d in ("%appdata%\Mozilla\Firefox\Profiles\*") do (
  if exist "%%d\cache2" (
    del /s /f /q "%%d\cache2\*.*" >nul 2>nul
    for /d %%p in ("%%d\cache2\*.*") do rmdir "%%p" /s /q >nul 2>nul
  )
)


:: ==============================
:: Dump Files Cleanup
echo Cleaning Dump Files...
del /s /f /q "C:\Windows\MEMORY.DMP" >nul 2>nul
del /s /f /q "C:\Windows\Minidump\*.*" >nul 2>nul
for /d %%p in ("C:\Windows\Minidump\*.*") do rmdir "%%p" /s /q >nul 2>nul

:: ==============================
echo.
echo ✅ Full Cleanup Done! (Temp + Logs + Update Cache + Browser Caches + Dump Files)
pause
