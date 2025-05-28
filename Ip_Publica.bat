@echo off
title Ver mi IP Publica
echo Obteniendo tu IP pública...
for /f "delims=" %%i in ('curl -s ifconfig.me') do set IP=%%i
echo Tu IP pública es: %IP%
echo.
pause
