@ECHO off
cls
:start
cls
ECHO. --Controles en BD---
ECHO 1. Borrar y Crear Usuario
ECHO 2. Crear Tabla
ECHO 3. Borrar Tabla
ECHO 4. Lista de Usuarios
ECHO 5. Lista de Objetos de Test
ECHO 0. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptUsuario
if '%choice%'=='2' goto OptCreaTabla
if '%choice%'=='3' goto OptBorraTabla
if '%choice%'=='4' goto OptListUsuarios
if '%choice%'=='5' goto OptListObjTest
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto start

:OptListObjTest
start C:\controles\ListObjTest.bat
goto start


:OptListUsuarios
start C:\controles\ListUsuarios.bat
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
