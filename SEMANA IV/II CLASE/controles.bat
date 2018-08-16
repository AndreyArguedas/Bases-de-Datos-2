@ECHO off
cls
:start
cls
ECHO. --Controles en BD---
ECHO 1. Borrar y Crear Usuario
ECHO 2. Crear Tabla
ECHO 3. Borrar Tabla
ECHO 0. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptUsuario
if '%choice%'=='2' goto OptCreaTabla
if '%choice%'=='3' goto OptBorraTabla
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto start

:OptUsuario
start C:\controles\crea_usuario.bat
goto start

:OptCreaTabla
start C:\controles\crea_tabla.bat
goto start

:OptBorraTabla
start C:\controles\borra_tabla.bat
goto start

:OptSalir
ECHO Sale del programa
goto end

:end
