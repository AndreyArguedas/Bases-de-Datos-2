@ECHO off
cls

set Owner=
set /p Owner=Indique el usuario:

sqlplus /nolog @%~dp0\OptDropUsuario.sql %Owner%

pause
exit