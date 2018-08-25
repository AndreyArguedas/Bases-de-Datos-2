conn system/root
set pagesize 0
set linesize 100
set feedback off
set verify off

spool C:\controles\OptUsuario.html

-- select '<html><font size="10" color ="blue">
-- Filtro usado:'||'&1'||'</font><br><br>'
-- from dual;

select '<html><table border="1"><tr><th>OWNER</th><th>OBJECT_TYPE</th></tr>'
from dual;

select '<font size="10" color ="blue">
Filtro usado:'||'&1'||'</font><br><br>'
from dual;
select '<font size="10" color ="blue">
Filtro usado:'||'&2'||'</font><br><br>'
from dual;

select '<tr><td>'||OWNER||'</td><td>'||OBJECT_TYPE||'</td></tr>'
from   dba_objects
where  OWNER like '%'||'&1'||'%' and OBJECT_TYPE like '%'||'&2'||'%';

select '</table></html>'
from dual;

spool off
exit













