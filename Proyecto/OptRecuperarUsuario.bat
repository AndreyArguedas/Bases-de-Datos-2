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

aescrypt.exe -d -p clave123 -o ./datos/%Respaldo%.7z ./respaldos/%VVar1% 1> ./logs/desencripta.log 2> ./logs/desencripta.err

REM Descomprime en la carpeta actual
7z.exe e ./datos/%Respaldo%.7z 1> ./logs/descomprime.log 2> ./logs/descomprime.err

move %Respaldo%.dmp ./datos/

REM  Se crea el .par para poder importar
echo userid=system/root > ./parametros/importar.par
echo file=./datos/%Respaldo%.dmp >> ./parametros/importar.par
echo log=./logs/importar.log >> ./parametros/importar.par
echo fromuser=%Respaldo% >> ./parametros/importar.par
echo touser=%User% >> ./parametros/importar.par

REM Importa el respaldo al usuario deseado
imp parfile=./parametros/importar.par

echo Inicio================================================ >> ./logs/imports.log
echo #1 Crear el usuario %User% en la base de datos         >> ./logs/imports.log
type .\logs\BorrarCrear.log                                 >> ./logs/imports.log

echo ______________________________________________________ >> ./logs/imports.log
echo #2 Se desencripta el respaldo (.aes) en un 7z    		>> ./logs/imports.log
echo error:                                                 >> ./logs/imports.log
type .\logs\desencripta.err                                 >> ./logs/imports.log
echo log:                                                   >> ./logs/imports.log
type .\logs\desencripta.log                                 >> ./logs/imports.log

echo ______________________________________________________ >> ./logs/imports.log
echo #3 Se descomprime el respaldo (7z)    					>> ./logs/imports.log
echo error:                                                 >> ./logs/imports.log
type .\logs\descomprime.err                                 >> ./logs/imports.log
echo log:                                                   >> ./logs/imports.log
type .\logs\descomprime.log                                 >> ./logs/imports.log

echo ______________________________________________________ >> ./logs/imports.log
echo #4 Se realiza el import hacia el usuario %User%   	    >> ./logs/imports.log
echo error:                                                 >> ./logs/imports.log
type .\logs\importar.err                                    >> ./logs/imports.log
echo log:                                                   >> ./logs/imports.log
type .\logs\importar.log                                    >> ./logs/imports.log

echo ______________________________________________________ >> ./logs/imports.log
echo Final ================================================ >> ./logs/imports.log

del recuperado.ini
del .\datos\%Respaldo%.7z
del .\datos\%Respaldo%.dmp
del .\logs\BorrarCrear.log
del .\logs\desencripta.err
del .\logs\desencripta.log
del .\logs\descomprime.err
del .\logs\descomprime.log
del .\logs\importar.log

exit