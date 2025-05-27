@echo off
title 🛠️ Activar Opciones para Carpetas Compartidas - Soporte Redes

echo Verificando permisos de administrador...
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Ejecuta este script como administrador.
    pause
    exit /b
)

echo Activando descubrimiento de red y uso compartido de archivos...
:: Activa descubrimiento de red
powershell -Command "Set-NetFirewallRule -DisplayGroup 'Network Discovery' -Enabled True"
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes

:: Activa uso compartido de archivos e impresoras
powershell -Command "Set-NetFirewallRule -DisplayGroup 'File and Printer Sharing' -Enabled True"
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

echo Habilitando servicios necesarios...

:: Habilita y arranca el servicio "Servidor"
sc config lanmanserver start= auto
sc start lanmanserver

:: Habilita y arranca el servicio "Estación de trabajo" (Cliente SMB)
sc config lanmanworkstation start= auto
sc start lanmanworkstation

:: Habilita y arranca el servicio "Publicación de recursos de detección de función"
sc config fdphost start= auto
sc start fdphost

:: Habilita y arranca el servicio "Host de proveedor de detección de función"
sc config fdrespub start= auto
sc start fdrespub

echo Configurando SMBv1 (opcional - necesario en algunas redes antiguas)...
:: Para habilitar SMBv1, solo si es necesario (puede ser un riesgo de seguridad)
:: Descomenta la siguiente línea si lo necesitas:
:: dism /online /enable-feature /featurename:SMB1Protocol-Client /all /norestart

echo Configurando permisos para compartir sin autenticación (solo para redes privadas)...
:: Esto permite compartir sin pedir usuario y contraseña, para redes confiables
:: Descomenta para activar:
:: reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d 1 /f

echo.
echo ✅ Configuración completada. Reinicia el equipo para aplicar cambios.
pause
