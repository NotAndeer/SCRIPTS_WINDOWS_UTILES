@echo off
title 🖨️ MENÚ DE SOPORTE PARA IMPRESORAS - BY NotAndeer - b4dm3n
color 0B

:MENU
cls
echo =====================================================
echo           🛠️ SOPORTE DE IMPRESORAS - MENU
echo =====================================================
echo [1] Reiniciar cola de impresión
echo [2] Borrar documentos en cola
echo [3] Eliminar impresora específica
echo [4] Listar impresoras instaladas
echo [5] Establecer impresora como predeterminada
echo [6] Diagnóstico rápido de impresión
echo [7] Eliminar TODAS las impresoras (excepto XPS)
echo [0] Salir
echo =====================================================
set /p opcion=Selecciona una opción:

if "%opcion%"=="1" goto REINICIAR
if "%opcion%"=="2" goto BORRAR_COLA
if "%opcion%"=="3" goto ELIMINAR
if "%opcion%"=="4" goto LISTAR
if "%opcion%"=="5" goto PREDETERMINADA
if "%opcion%"=="6" goto DIAGNOSTICO
if "%opcion%"=="7" goto ELIMINAR_TODAS
if "%opcion%"=="0" exit
goto MENU

:REINICIAR
net stop spooler
net start spooler
echo ✅ Cola de impresión reiniciada.
pause
goto MENU

:BORRAR_COLA
net stop spooler
del /q /f /s %systemroot%\System32\spool\PRINTERS\*
net start spooler
echo ✅ Documentos en cola eliminados.
pause
goto MENU

:ELIMINAR
set /p nombre=Ingresa el nombre exacto de la impresora a eliminar:
printui /dl /n "%nombre%"
echo ✅ Impresora eliminada.
pause
goto MENU

:LISTAR
wmic printer get name,portname,default
pause
goto MENU

:PREDETERMINADA
set /p impresora=Nombre exacto de la impresora:
rundll32 printui.dll,PrintUIEntry /y /n "%impresora%"
echo ✅ Impresora predeterminada cambiada.
pause
goto MENU

:DIAGNOSTICO
echo ==================== ESTADO DEL SPOOLER ====================
sc query spooler
echo ==================== IMPRESORAS INSTALADAS ====================
wmic printer get name,portname,default
echo ==================== COLA DE IMPRESIÓN ====================
dir %systemroot%\System32\spool\PRINTERS
pause
goto MENU

:ELIMINAR_TODAS
echo ❗ Esto eliminará todas las impresoras  (menos la XPS).
pause
wmic printer where "Name != 'Microsoft XPS Document Writer'" delete
echo ✅ Impresoras eliminadas.
pause
goto MENU
