@ECHO off
cls

set Owner=
set /p Owner=Indique el usuario:

sqlplus /nolog @C:\controles\OptCreaUsuario.sql %Owner%

pause
exit