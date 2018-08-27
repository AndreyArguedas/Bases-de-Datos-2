@ECHO off
cls

cls
echo off
(
set /p Var1=
set /p Var2=
set /p Var3=
) < C:\controles\Parametros.ini





REM valor posicional 25 al 100
SET VVar1=%Var1:~25,100%
SET VVar2=%Var2:~25,100%
SET VVar3=%Var3:~25,100%

C:\controles\aescrypt.exe -d -p clave123 C:\controles\ListUsuarios.7z.aes

C:\controles\7z.exe e ListUsuarios.7z

del C:\controles\ListUsuarios.7z

start %VVar1% C:\controles\ListUsuarios.html



exit
