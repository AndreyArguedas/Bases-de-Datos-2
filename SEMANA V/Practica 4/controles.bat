@ECHO off
cls
:start
cls
ECHO. --Controles en BD---
ECHO 1. Objetos por usuario
ECHO 2. Reporte ejecutivo de Cantidad de Objetos por usuario

ECHO 0. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptUsuario
if '%choice%'=='2' goto OptReporteObjUsuario
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto start

:OptUsuario
start C:\controles\OptUsuario.bat
goto start

:OptReporteObjUsuario
start C:\controles\OptReporteObjUsuario.bat
goto start

:OptSalir
ECHO Sale del programa
goto end

:end
