@ECHO off
cls
:start
cls
ECHO. --Proyecto #1---
ECHO. --Andrey Arguedas Espinoza---
ECHO. --MENU RECUPERACION---
ECHO 1. Recuperar de un usuario
ECHO 2. Regresar a menu principal

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptRecuperarUsuario
if '%choice%'=='2' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto start

:OptRecuperarUsuario
start %~dp0\OptRecuperarUsuario.bat
goto start
exit

:OptSalir
start %~dp0\controles.bat
exit

:end
