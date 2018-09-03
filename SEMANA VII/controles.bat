@ECHO off
cls
:start
cls
ECHO. --Controles en BD---
ECHO 1. Respaldo de HR
ECHO 2. Crear Tabla
ECHO 3. Borrar Tabla
ECHO 0. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptRespaldoHR
if '%choice%'=='2' goto OptCreaUsuario
if '%choice%'=='3' goto OptImportarHR

if '%choice%'=='0' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto start

:OptRespaldoHR
start C:\controles\OptRespaldoHR.bat
goto start

:OptCreaUsuario
start C:\controles\OptCreaUsuario.bat
goto start

:OptImportarHR
start C:\controles\OptImportarHR.bat
goto start

:OptSalir
ECHO Sale del programa
goto end

:end
