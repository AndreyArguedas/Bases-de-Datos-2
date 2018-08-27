REM Listar los usuarios a un archivo de spool
REM notar el EXIT, sale del SO


sqlplus /nolog @C:\controles\ListObjTest.sql
rem quitamos la pausa
rem pause

rem invocamos el notepad normal (solo para revision de logs)


REM start notepad.exe C:\controles\ListObjTest.log
REM Usamos el endate.exe para renombrar el archivo

C:\controles\namedate.exe /Y /ZZ: "F(Y-m-d)-(H-M-S).X" C:\controles\ListObjTest.log 
exit