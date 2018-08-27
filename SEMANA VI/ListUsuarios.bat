@ECHO off
cls
REM Listar los usuarios a un archivo de spool
REM notar el EXIT, sale del SO

set Palabra=
set /p Palabra=Indique la Palabra a Filtrar:

sqlplus /nolog @C:\controles\ListUsuarios.sql %Palabra%

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

REM start notepad.exe C:\controles\ListUsuarios.html
REM usar dir /x ubicar carpetas con nombre corto 8 LETRAS
REM start %VVar1% C:\controles\ListUsuarios.html

C:\controles\7z.exe a ListUsuarios.7z C:\controles\ListUsuarios.html

C:\controles\aescrypt.exe -e -p clave123 ListUsuarios.7z

del C:\controles\ListUsuarios.html
del C:\controles\ListUsuarios.7z

exit












