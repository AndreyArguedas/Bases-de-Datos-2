@ECHO off
cls
:start
cls
ECHO. --Controles en BD---
ECHO 1. Respaldo de HR
ECHO 2. Crear Usuario
ECHO 3. Importar dinamicamente
ECHO 5. Mostrar Cantidad de Objetos por Usuario
ECHO 6. Drop a Usuario
ECHO 0. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptRespaldoHR
if '%choice%'=='2' goto OptCreaUsuario
if '%choice%'=='3' goto OptImportarHR
if '%choice%'=='5' goto OptMostrarCantidadObjetos
if '%choice%'=='6' goto OptDropUsuario

if '%choice%'=='0' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto start

:OptRespaldoHR
start %~dp0\OptRespaldoHR.bat
goto start

:OptCreaUsuario
start %~dp0\OptCreaUsuario.bat
goto start

:OptImportarHR
start %~dp0\OptImportarHR.bat
goto start

:OptMostrarCantidadObjetos
start %~dp0\OptMostrarCantidadObjetos.bat
goto start

:OptDropUsuario
start %~dp0\OptDropUsuario.bat
goto start

:OptSalir
ECHO Sale del programa
goto end

:end
