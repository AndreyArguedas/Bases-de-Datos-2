--spool
--notar el EXIT, sale del SQLPLUS
conn system/root
set pagesize 0
set linesize 100
set feedback off
set verify off

spool C:\controles\ListUsuarios.html

select '<html><font size="10" color ="blue">
Filtro usado:'||'&1'||'</font><br><br>'
from dual;

select '<table border="1"><tr><th>ID</th><th>USUARIO</th></tr>'
from dual;

--ORDER BY 1, CAST a TEXTO
select '<tr><td>'||user_id||'</td><td>'||username||'</td></tr>'
from   dba_users
where  username like '%'||'&1'||'%'
order by to_char(user_id) desc;

select '<tr><td><font size="20" color="red">TOTAL:</font></td><td><font size="20" color="red">'||count(*)||'</font></td></tr>'
from   dba_users
where  username like '%'||'&1'||'%';

select '</table></html>'
from dual;

spool off
exit













