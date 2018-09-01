@ECHO off
cls

echo off
(
set /p Var1=
set /p Var2=
set /p Var3=
set /p Var4=
) < C:\TAREA4\Parametros.ini


REM valor posicional 25 al 100
SET VVar1=%Var1:~25,100%
SET VVar2=%Var2:~25,100%
SET VVar3=%Var3:~25,100%
SET VVar4=%Var4:~25,100%

C:\TAREA4\7z.exe a %VVar3%.7z C:\TAREA4\OptUsuario.html C:\TAREA4\OptReporteObjUsuario.xml

C:\TAREA4\aescrypt.exe -e -p clave123 %VVar3%.7z

C:\TAREA4\namedate.exe /Y /ZZ:"F(Y-m-d)-(H-M-S).X" C:\TAREA4\%VVar3%.7z.aes

del C:\TAREA4\OptUsuario.html
del C:\TAREA4\OptReporteObjUsuario.xml
del C:\TAREA4\tarea4.7z

dir /b *.aes > comprimido.ini

start %VVar2% C:\TAREA4\comprimido.ini

exit