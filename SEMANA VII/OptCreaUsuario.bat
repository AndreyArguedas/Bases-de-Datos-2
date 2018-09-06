@ECHO off
cls

set Owner=
set /p Owner=Indique el usuario:

sqlplus /nolog @%~dp0\OptCreaUsuario.sql %Owner%

pause
exit