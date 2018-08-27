REM Listar los usuarios a un archivo de spool
REM notar el EXIT, sale del SO


sqlplus /nolog @C:\controles\ListUsuarios2.sql
rem quitamos la pausa
rem pause

rem invocamos el chrome normal (solo para revision de logs)

start C:\PROGRA~2\Google\Chrome\Application\chrome.exe C:\controles\ListUsuarios2.html
exit