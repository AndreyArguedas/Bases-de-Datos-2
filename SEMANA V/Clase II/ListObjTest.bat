REM Listar los usuarios a un archivo de spool
REM notar el EXIT, sale del SO


sqlplus /nolog @C:\controles\ListObjTest.sql
rem quitamos la pausa
rem pause

rem invocamos el notepad normal (solo para revision de logs)


start notepad.exe C:\controles\ListObjTest.log
exit