@ECHO off
cls

set User=
set /p User=Indique el usuario a crear:

REM Crear el usuario al que se le importara el respaldo
sqlplus /nolog  @.\Scripts\BorrarCrear.sql %User%

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
7z.exe x ./datos/%Respaldo%.7z

move %Respaldo%.dmp ./datos/

REM  Se crea el .par para poder importar
echo userid=system/root > ./parametros/importar.par
echo file=./datos/%Respaldo%.dmp >> ./parametros/importar.par
echo log=./logs/importar.log >> ./parametros/importar.par
echo fromuser=%Respaldo% >> ./parametros/importar.par
echo touser=%User% >> ./parametros/importar.par

REM Importa el respaldo al usuario deseado
imp parfile=./parametros/importar.par

pause

del recuperado.ini

exit