@ECHO off
cls
:start
cls
ECHO. --ANDREY ARGUEDAS ESPINOZA---
ECHO. --		TAREA #4        ---
ECHO 1. Objetos por usuario
ECHO 2. Reporte ejecutivo de Cantidad de Objetos por usuario
ECHO 3. Comprimir, encriptar y aplicar NAMEDATE
ECHO 4. Desencriptar, Descomprimir y volver a abrir los archivos

ECHO 0. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptUsuario
if '%choice%'=='2' goto OptReporteObjUsuario
if '%choice%'=='3' goto OptComprimirEncriptarNameDate
if '%choice%'=='4' goto OptDesencriptarDescomprimirAbrirArchivos
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" Opcion incorrecta.
pause
ECHO.
goto start

:OptUsuario
start C:\TAREA4\OptUsuario.bat
goto start

:OptReporteObjUsuario
start C:\TAREA4\OptReporteObjUsuario.bat
goto start

:OptComprimirEncriptarNameDate
start C:\TAREA4\OptComprimirEncriptarNameDate.bat
goto start

:OptDesencriptarDescomprimirAbrirArchivos
start C:\TAREA4\OptDesencriptarDescomprimirAbrirArchivos.bat
goto start

:OptSalir
ECHO Sale del programa
goto end

:end
