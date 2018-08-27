REM Listar los usuarios a un archivo de spool
REM notar el EXIT, sale del SO


sqlplus /nolog @C:\controles\ListUsuarios3.sql
rem quitamos la pausa
rem pause

rem invocamos el chrome normal (solo para revision de logs)

REM start C:\PROGRA~2\Google\Chrome\Application\chrome.exe C:\controles\ListUsuarios3.html
REM start "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" C:\controles\ListUsuarios3.html
start C:\PROGRA~2\MOZILL~1\firefox.exe C:\controles\ListUsuarios3.html
exit