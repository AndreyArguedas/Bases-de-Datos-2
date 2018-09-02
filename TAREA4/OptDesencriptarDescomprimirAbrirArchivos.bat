@ECHO off
cls

echo off
(
set /p Var1=
) < C:\TAREA4\comprimido.ini

echo off
(
set /p PVar1=
set /p PVar2=
) < C:\TAREA4\Parametros.ini

SET VVar1=%Var1:~0,29%

SET PVVar2=%PVar1:~25,100%
SET PVVar3=%PVar2:~25,100%


C:\TAREA4\aescrypt.exe -d -p clave123 C:\TAREA4\%VVar1%.7z.aes

C:\TAREA4\7z.exe e %VVar1%.7z

start %PVVar3% C:\TAREA4\OptReporteObjUsuario.xml
start %PVVar2% C:\TAREA4\OptUsuario.html

exit