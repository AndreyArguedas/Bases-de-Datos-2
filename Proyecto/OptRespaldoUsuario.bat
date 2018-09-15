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
7z.exe a %User%.7z %User%.dmp

REM Se encripta el 7z
aescrypt.exe -e -p clave123 %User%.7z

REM Se realiza el movimiento del dmp a la carpeta datos
move %User%.dmp .\datos\

REM Se pone el namedate
namedate.exe /Y /ZZ:"F(Y-m-d)-(H-M-S).X" %User%.7z.aes

dir /b *.aes > encriptado.ini

REM Pasar el encriptado a respaldos
echo off
(
set /p Var1=
) < encriptado.ini

SET VVar1=%Var1:~0,100%
 
move %VVar1% .\respaldos\

REM eliminar archivos sobrantes

del %User%.7z
del encriptado.ini

exit