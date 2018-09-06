conn system/root
set pagesize 0
set linesize 100
set feedback off
set verify off

spool C:\Controles\OptMostrarCantidadObjetos.html

select '<html><table border="1"><tr><th>OWNER</th><th>OBJECT_TYPE</th></tr>'
from dual;

select '<tr><td>'||OWNER||'</td><td>'||count(*)||'</td></tr>'
from   dba_objects
group by OWNER order by 1;

select '</table></html>'
from dual;

spool off
exit
