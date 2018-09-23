@ECHO off
cls

REM  Se crea el .par con la info 
echo userid=system/root > ./parametros/full.par
echo full=y >>./parametros/full.par
echo file=completo.dmp >> ./parametros/full.par
echo log=./logs/full.log >> ./parametros/full.par
echo statistics=none >> ./parametros/full.par

REM se realiza el export
exp parfile=./parametros/full.par

REM Se comprime el archivo en un 7z
7z.exe a completo.7z full.dmp 1> ./logs/comprime.log 2> ./logs/comprime.err

REM Se encripta el 7z
aescrypt.exe -e -p clave123 completo.7z 1> ./logs/encripta.log 2> ./logs/encripta.err

REM Se realiza el movimiento del dmp a la carpeta datos
move completo.dmp .\datos\

REM Se pone el namedate
namedate.exe /Y /ZZ:"F(Y-m-d)-(H-M-S).X" completo.7z.aes 1> ./logs/namedate.log 2> ./logs/namedate.err

dir /b *.aes > encriptado.ini

REM Pasar el encriptado a respaldos
echo off
(
set /p Var1=
) < encriptado.ini

SET VVar1=%Var1:~0,100%
 
move  %VVar1% .\respaldos\

REM  Concatenar todos los LOGS!

echo Inicio================================================ >> ./logs/respaldos.log
echo #1 Exportar el usuario %User%                          >> ./logs/respaldos.log
type .\logs\full.log                                        >> ./logs/respaldos.log

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

del completo.7z
del encriptado.ini
del .\logs\full.log
del .\logs\comprime.err
del .\logs\comprime.log
del .\logs\encripta.err
del .\logs\encripta.log
del .\logs\namedate.err
del .\logs\namedate.log 

exit