@echo off
title 🚀 OPTIMIZACIÓN MODO DIOS - BY b4dm3n - NotAndeer
color 0A

echo Cerrando Chrome para limpiar caché...
taskkill /f /im chrome.exe >nul 2>&1

echo Liberando memoria y limpiando temporales...
del /f /s /q %TEMP%\* >nul 2>&1
del /f /s /q C:\Windows\Temp\* >nul 2>&1
del /f /s /q C:\Windows\Prefetch\* >nul 2>&1

echo Limpiando caché de Chrome...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache"
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Code Cache"
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Media Cache"
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\ShaderCache"
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Service Worker\CacheStorage"

echo Limpiando caché DNS...
ipconfig /flushdns

echo Activando modo de energia: Alto rendimiento...
powercfg -setactive SCHEME_MIN

echo Deshabilitando servicios innecesarios temporalmente...
net stop SysMain >nul 2>&1
net stop DiagTrack >nul 2>&1
net stop WSearch >nul 2>&1

echo Optimizando disco (TRIM y desfragmentar)...
defrag C: /O

echo Liberando caché de RAM (esto fuerza limpieza de páginas no usadas)...
echo. > %windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks

echo.
echo ✅ Optimización completa. Reinicia para aplicar todo al 100%%.
pause
