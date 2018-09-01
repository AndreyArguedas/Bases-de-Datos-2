conn system/root
set pagesize 0
set linesize 100
set feedback off
set verify off

spool C:\TAREA4\OptReporteObjUsuario.xml

select '<?xml version="1.0" encoding="UTF-8"?>	<listobjetos>'
from dual;

select '<usuario>'||OWNER||'</usuario>	<objetos>'||count(*)||'</objetos>'
from   dba_objects
group by OWNER order by 1;

select '</listobjetos>'
from dual;

spool off
exit
