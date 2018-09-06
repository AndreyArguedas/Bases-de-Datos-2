@ECHO off
cls

set Owner=
set /p Owner=Indique el usuario:

sqlplus /nolog @%~dp0\OptMostrarCantidadObjetos.sql %Owner%

cls
echo off
(
set /p Var1=
) < %~dp0\Parametros.ini


REM valor posicional 25 al 100
SET VVar1=%Var1:~25,100%

start %VVar1% %~dp0\OptMostrarCantidadObjetos.html

exit