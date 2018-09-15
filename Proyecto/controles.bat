@ECHO off
cls
:start
cls
ECHO. --Proyecto #1---
ECHO. --Andrey Arguedas Espinoza---
ECHO. --MENU PRINCIPAL---

ECHO 1. Respaldos
ECHO 2. Recuperacion

ECHO 0. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%

if '%choice%'=='1' goto MenuRespaldos
if '%choice%'=='2' goto MenuRecuperacion
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto start

:MenuRespaldos
start %~dp0\MenuRespaldos.bat
exit

:MenuRecuperacion
start %~dp0\MenuRecuperacion.bat
exit


:OptSalir
ECHO Sale del programa
goto end

:end
