@ECHO off
cls
:start
cls
ECHO. --Controles en BD---
ECHO 1. Borrar y Crear Usuario
ECHO 2. Crear Tabla
ECHO 3. Borrar Tabla
ECHO 4. Listar Usuarios
ECHO 5. Listar Usuarios Test
ECHO 6. Crear Tablespace DATOS 10M
ECHO 7. Dropear Tablespace DATOS 10M
ECHO 8. Insertar en TAB1
ECHO 0. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptUsuario
if '%choice%'=='2' goto OptCreaTabla
if '%choice%'=='3' goto OptBorraTabla
if '%choice%'=='4' goto OptListarUsuarios
if '%choice%'=='5' goto OptListarUsuariosTest
if '%choice%'=='6' goto OptCrearTablespace
if '%choice%'=='7' goto OptDropTablespace
if '%choice%'=='8' goto OptInsertarEnTAB1
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

:OptListarUsuarios
start C:\controles\ListarUsuarios.bat
goto start

:OptListarUsuariosTest
start C:\controles\OptListarUsuariosTest.bat
goto start

:OptCrearTablespace
start C:\controles\OptCrearTablespace.bat
goto start

:OptDropTablespace
start C:\controles\OptDropTablespace.bat
goto start

:OptInsertarEnTAB1
start C:\controles\OptInsertarEnTAB1.bat
goto start

:OptSalir
ECHO Sale del programa
goto end

:end
