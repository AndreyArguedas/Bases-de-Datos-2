@ECHO off
cls

set Owner=
set /p Owner=Indique el usuario:

sqlplus /nolog @C:\controles\OptDropUsuario.sql %Owner%

pause
exit