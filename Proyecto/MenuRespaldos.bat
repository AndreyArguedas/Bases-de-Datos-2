@ECHO off
cls
:start
cls
ECHO. --Proyecto #1---
ECHO. --Andrey Arguedas Espinoza---
ECHO. --MENU RESPALDOS---
ECHO 1. Respaldo Usuario Oracle
ECHO 2. Respaldo Completo

ECHO 3. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptRespaldoUsuario
if '%choice%'=='2' goto OptRespaldoCompleto

if '%choice%'=='3' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto start

:OptRespaldoUsuario
start %~dp0\OptRespaldoUsuario.bat
goto start
exit

:OptRespaldoCompleto
start %~dp0\OptRespaldoCompleto.bat
goto start
exit

:OptSalir
start %~dp0\controles.bat
exit

:end
