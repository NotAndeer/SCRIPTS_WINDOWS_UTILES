@echo off
:: ===========================================================
:: ADVERTENCIA: Este script eliminará permanentemente archivos
:: personales y temporales. Úsalo con precaución: By. b4dm3n - NotAndeer.
:: ===========================================================

echo ===========================================================
echo          ADVERTENCIA: Limpieza de archivos de usuario
echo ===========================================================
echo Este script borrará de forma PERMANENTE los archivos de:
echo  - Descargas
echo  - Documentos
echo  - Escritorio
echo  - Imágenes
echo  - Videos
echo  - Música
echo  - Archivos temporales del sistema y aplicaciones
echo.
echo Esta acción no se puede deshacer. Si no desea proceder, 
echo presione CTRL+C ahora. De lo contrario, pulse cualquier tecla para continuar.
pause >nul

:: Borrar archivos y carpetas en Descargas
echo Borrando archivos en Descargas...
del /f /s /q "%USERPROFILE%\Downloads\*.*"
for /d %%x in ("%USERPROFILE%\Downloads\*") do rmdir /s /q "%%x"

:: Borrar archivos y carpetas en Documentos
echo Borrando archivos en Documentos...
del /f /s /q "%USERPROFILE%\Documents\*.*"
for /d %%x in ("%USERPROFILE%\Documents\*") do rmdir /s /q "%%x"

:: Borrar archivos y carpetas en Escritorio
echo Borrando archivos en Escritorio...
del /f /s /q "%USERPROFILE%\Desktop\*.*"
for /d %%x in ("%USERPROFILE%\Desktop\*") do rmdir /s /q "%%x"

:: Borrar archivos y carpetas en Imágenes
echo Borrando archivos en Imágenes...
del /f /s /q "%USERPROFILE%\Pictures\*.*"
for /d %%x in ("%USERPROFILE%\Pictures\*") do rmdir /s /q "%%x"

:: Borrar archivos y carpetas en Videos
echo Borrando archivos en Videos...
del /f /s /q "%USERPROFILE%\Videos\*.*"
for /d %%x in ("%USERPROFILE%\Videos\*") do rmdir /s /q "%%x"

:: Borrar archivos y carpetas en Música
echo Borrando archivos en Música...
del /f /s /q "%USERPROFILE%\Music\*.*"
for /d %%x in ("%USERPROFILE%\Music\*") do rmdir /s /q "%%x"

:: Limpiar archivos temporales del sistema
echo Limpiando archivos temporales del sistema...
del /f /s /q "%TEMP%\*.*"
for /d %%x in ("%TEMP%\*") do rmdir /s /q "%%x"

del /f /s /q "C:\Windows\Temp\*.*"
for /d %%x in ("C:\Windows\Temp\*   ") do rmdir /s /q "%%x"

:: Limpiar archivos temporales de navegadores y aplicaciones comunes
echo Limpiando cachés de navegadores y aplicaciones...

:: Google Chrome
del /f /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*"
for /d %%x in ("%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*") do rmdir /s /q "%%x"

:: Microsoft Edge
del /f /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*"
for /d %%x in ("%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*") do rmdir /s /q "%%x"

:: Mozilla Firefox
for /d %%x in ("%APPDATA%\Mozilla\Firefox\Profiles\*") do (
    del /f /s /q "%%x\cache2\*.*"
    for /d %%y in ("%%x\cache2\*") do rmdir /s /q "%%y"
)

:: Limpiar archivos recientes
echo Limpiando lista de archivos recientes...
del /f /s /q "%APPDATA%\Microsoft\Windows\Recent\*.*"
for /d %%x in ("%APPDATA%\Microsoft\Windows\Recent\*") do rmdir /s /q "%%x"

echo.
echo Proceso de limpieza completado. El sistema ha sido limpiado.
pause
exit
