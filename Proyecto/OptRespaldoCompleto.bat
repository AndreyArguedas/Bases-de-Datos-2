@ECHO off
cls

REM  Se crea el .par con la info 
echo userid=system/root > ./parametros/full.par
echo full=y >>./parametros/full.par
echo file=full.dmp >> ./parametros/full.par
echo log=./logs/full.log >> ./parametros/full.par
echo statistics=none >> ./parametros/full.par

REM se realiza el export
exp parfile=./parametros/full.par

REM Se comprime el archivo en un 7z
7z.exe a full.7z full.dmp

REM Se encripta el 7z
aescrypt.exe -e -p clave123 full.7z

REM Se realiza el movimiento del dmp a la carpeta datos
move full.dmp .\datos\

REM Se pone el namedate
namedate.exe /Y /ZZ:"F(Y-m-d)-(H-M-S).X" full.7z.aes

dir /b *.aes > encriptado.ini

REM Pasar el encriptado a respaldos
echo off
(
set /p Var1=
) < encriptado.ini

SET VVar1=%Var1:~0,100%
 
move %VVar1% .\respaldos\

REM eliminar archivos sobrantes

del full.7z
del encriptado.ini

exit