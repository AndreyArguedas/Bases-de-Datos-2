conn system/root
set pagesize 0
set linesize 100
set feedback off
set verify off

spool C:\TAREA4\OptUsuario.html

select '<html><table border="1"><tr><th>OWNER</th><th>OBJECT_TYPE</th></tr>'
from dual;

select '<font size="10" color ="green">
Fecha y hora actual: ' || to_char(sysdate, 'dd-mm-yyyy hh24:mi:ss') ||'</font><br><br>'
from dual;

select '<font size="10" color ="blue">
Parametros indicados: (USUARIO: '||'&1'||' TIPO OBJETO: '||'&2'||' )</font><br><br>'
from dual;


select '<tr><td>'||OWNER||'</td><td>'||OBJECT_TYPE||'</td></tr>'
from   dba_objects
where  OWNER like '%'||UPPER('&1')||'%' and OBJECT_TYPE like '%'||UPPER('&2')||'%';

select '</table></html>'
from dual;

spool off
exit













