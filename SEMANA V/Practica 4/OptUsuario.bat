@ECHO off
cls

set Owner=
set /p Owner=Indique el usuario por el cual se filtrara:

set Object=
set /p Object=Indique un objeto (Table, View) por el cual se filtrara:

sqlplus /nolog @C:\controles\OptUsuario.sql %Owner% %Object%

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

start %VVar1% C:\controles\OptUsuario.html


exit