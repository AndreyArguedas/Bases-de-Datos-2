@ECHO off
cls

set User=
set /p User=Indique el usuario a respaldar:

REM  Se crea el .par con la info del Usuario
echo userid=system/root > ./parametros/%User%.par
echo owner=%User% >> ./parametros/%User%.par
echo file=%User%.dmp >> ./parametros/%User%.par
echo log=./logs/%User%.log >> ./parametros/%User%.par
echo statistics=none >> ./parametros/%User%.par

REM se realiza el export
exp parfile=./parametros/%User%.par

REM Se comprime el archivo en un 7z
7z.exe a %User%.7z %User%.dmp 1> ./logs/comprime.log 2> ./logs/comprime.err

REM Se encripta el 7z
aescrypt.exe -e -p clave123 %User%.7z 1> ./logs/encripta.log 2> ./logs/encripta.err

REM Se realiza el movimiento del dmp a la carpeta datos
move %User%.dmp .\datos\

REM Se pone el namedate
namedate.exe /Y /ZZ:"F(Y-m-d)-(H-M-S).X" %User%.7z.aes 1> ./logs/namedate.log 2> ./logs/namedate.err

dir /b *.aes > encriptado.ini

REM Pasar el encriptado a respaldos
echo off
(
set /p Var1=
) < encriptado.ini

SET VVar1=%Var1:~0,100%
 
move %VVar1% .\respaldos\

REM  Concatenar todos los LOGS!

echo Inicio================================================ >> ./logs/respaldos.log
echo #1 Exportar el usuario %User%                          >> ./logs/respaldos.log
type .\logs\%User%.log                                      >> ./logs/respaldos.log

echo ______________________________________________________ >> ./logs/respaldos.log
echo #2 Se comprime el respaldo (.dmp) en un 7z    		    >> ./logs/respaldos.log
echo error:                                                 >> ./logs/respaldos.log
type .\logs\comprime.err                                    >> ./logs/respaldos.log
echo log:                                                   >> ./logs/respaldos.log
type .\logs\comprime.log                                    >> ./logs/respaldos.log

echo ______________________________________________________ >> ./logs/respaldos.log
echo #3 Se encripta el respaldo (7z) en un 7z.aes    		>> ./logs/respaldos.log
echo error:                                                 >> ./logs/respaldos.log
type .\logs\encripta.err                                    >> ./logs/respaldos.log
echo log:                                                   >> ./logs/respaldos.log
type .\logs\encripta.log                                    >> ./logs/respaldos.log

echo ______________________________________________________ >> ./logs/respaldos.log
echo #4 Se aplica namedate al respaldo ya encriptado    	>> ./logs/respaldos.log
echo error:                                                 >> ./logs/respaldos.log
type .\logs\namedate.err                                    >> ./logs/respaldos.log
echo log:                                                   >> ./logs/respaldos.log
type .\logs\namedate.log                                    >> ./logs/respaldos.log

echo ______________________________________________________ >> ./logs/respaldos.log
echo Nombre Final del archivo: %VVar1%						>> ./logs/respaldos.log			
echo Final ================================================ >> ./logs/respaldos.log

REM eliminar archivos sobrantes

del %User%.7z
del .\logs\%User%.log 
del encriptado.ini
del .\logs\comprime.err
del .\logs\comprime.log
del .\logs\encripta.err
del .\logs\encripta.log
del .\logs\namedate.err
del .\logs\namedate.log

exit