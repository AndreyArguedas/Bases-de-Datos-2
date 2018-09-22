@ECHO off
cls

REM set User=
REM set /p User=Indique el usuario a crear:

REM REM Crear el usuario al que se le importara el respaldo
REM sqlplus /nolog  @.\Scripts\BorrarCrear.sql %User%

set Respaldo=
set /p Respaldo=Indique el respaldo a importar:

dir /b .\respaldos\*%Respaldo%*.* /od > recuperado.ini

REM Extrae el respaldo mas antiguo
echo off
(
set /p Var1=
) < recuperado.ini

SET VVar1=%Var1:~0,100%

REM Desencripta

aescrypt.exe -d -p clave123 -o ./datos/%Respaldo%.7z ./respaldos/%VVar1%

REM Descomprime en la carpeta actual
7z.exe x ./Datos/hr.7z 1> 2.log 2> 2.err

pause

del recuperado.ini

exit