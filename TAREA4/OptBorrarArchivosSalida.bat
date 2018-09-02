@ECHO off
cls

echo off
(
set /p Var1=
) < C:\TAREA4\comprimido.ini

SET VVar1=%Var1:~0,29%

del C:\TAREA4\OptUsuario.html
del C:\TAREA4\OptReporteObjUsuario.xml
del C:\TAREA4\comprimido.ini
del C:\TAREA4\%VVar1%.7z.aes
del C:\TAREA4\%VVar1%.7z

exit