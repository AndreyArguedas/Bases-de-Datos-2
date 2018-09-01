@ECHO off
cls

sqlplus /nolog @C:\TAREA4\OptReporteObjUsuario.sql

cls
echo off
(
set /p Var1=
set /p Var2=
set /p Var3=
) < C:\TAREA4\Parametros.ini


REM valor posicional 25 al 100
SET VVar1=%Var1:~25,100%
SET VVar2=%Var2:~25,100%
SET VVar3=%Var3:~25,100%

start %VVar2% C:\TAREA4\OptReporteObjUsuario.xml


exit