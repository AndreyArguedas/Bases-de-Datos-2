@ECHO off
cls

set Owner=
set /p Owner=Indique el usuario:

sqlplus /nolog @C:\Controles\OptMostrarCantidadObjetos.sql %Owner%

cls
echo off
(
set /p Var1=
) < C:\Controles\Parametros.ini


REM valor posicional 25 al 100
SET VVar1=%Var1:~25,100%

start %VVar1% C:\Controles\OptMostrarCantidadObjetos.html

exit