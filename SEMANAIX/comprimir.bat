C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\7z.exe a C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\resp_frio_online.7z C:\oraclexe\app\oracle\fast_recovery_area\XE\ONLINELOG\*.log 1> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\comprimir.log 2> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\comprimir.err

C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\7z.exe a C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\resp_frio_xe.7z C:\oraclexe\app\oracle\fast_recovery_area\XE\*.DBF 1> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\comprimir.log 2> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\comprimir.err

REM ENCRIPTAR AMBOS (STDERR Y STDOUT)

C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\aescrypt.exe -e -p clave123 C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\resp_frio_online.7z 1> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\encriptar.log 2> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\encriptar.err

C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\aescrypt.exe -e -p clave123 C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\resp_frio_xe.7z 1> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\encriptar.log 2> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\encriptar.err

REM NAMEDATE 

C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\namedate.exe /Y /ZZ:"F(Y-m-d)-(H-M-S).X" C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\resp_frio_online.7z.aes 1> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\namedate.log 2> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\namedate.err

C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\namedate.exe /Y /ZZ:"F(Y-m-d)-(H-M-S).X" C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\resp_frio_xe.7z.aes 1> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\namedate.log 2> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\namedate.err

REM BORRAR LOS 7Z

del C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\resp_frio_online.7z 1> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\borrar.log 2> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\borrar.err
del C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\resp_frio_xe.7z 1> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\borrar.log 2> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\borrar.err

rem subir servicio

net start OracleServiceXE 1> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\subir.log 2> C:\Users\Estudiante\Desktop\Bases-de-Datos-2\SEMANAIX\subir.err

REM UNIFICAR LOGS

echo Inicio================================================ > ./Bitacoras/Final.log
echo #0 Comprimir                      >> ./Bitacoras/Final.log
type comprimir.log                                        >> ./Bitacoras/Final.log

echo Final comprimir ================================================ >> ./Bitacoras/Final.log
echo Final comprimir ================================================ >> ./Bitacoras/Final.log


echo #1 Encriptar                      >> ./Bitacoras/Final.log
type encriptar.log                                        >> ./Bitacoras/Final.log

echo Final encriptar ================================================ >> ./Bitacoras/Final.log

echo #2 Namedate                      >> ./Bitacoras/Final.log
type namedate.log                                        >> ./Bitacoras/Final.log

echo Final namedate ================================================ >> ./Bitacoras/Final.log

echo #3 Borrar                      >> ./Bitacoras/Final.log
type borrar.log                                        >> ./Bitacoras/Final.log

echo Final borrar ================================================ >> ./Bitacoras/Final.log



echo Final ================================================ >> ./Bitacoras/Final.log


REM #7 Abrir con NOTEPAD.EXE
start notepad.exe .\Bitacoras\Final.log
exit
