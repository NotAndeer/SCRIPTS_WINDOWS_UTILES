@echo off
setlocal

REM Nombre del usuario que se conservará y será administrador
set KEEP=user

echo.
echo [INFO] Configurando privilegios de administrador para: %KEEP%
net localgroup Administradores %KEEP% /add >nul 2>&1
if %errorlevel%==0 (
    echo [✓] %KEEP% ahora es administrador.
) else (
    echo [!] No se pudo añadir %KEEP% al grupo Administradores o ya lo es.
)

echo.
echo [INFO] Eliminando otras cuentas locales de usuario...
echo.

for /f "skip=1 tokens=1" %%i in ('wmic useraccount where "localaccount='true' and disabled='false'" get name') do (
    set USER=%%i
    call :process_user
)

goto :eof

:process_user
set USER=%USER: =%
if "%USER%"=="" goto :eof
if /i "%USER%"=="%KEEP%" (
    echo [✓] Conservando cuenta: %USER%
) else (
    echo [!] Eliminando cuenta: %USER%
    net user "%USER%" /delete >nul 2>&1
    if %errorlevel%==0 (
        echo     --> Cuenta %USER% eliminada.
    ) else (
        echo     --> [X] Error al eliminar la cuenta %USER%.
    )
)

goto :eof
