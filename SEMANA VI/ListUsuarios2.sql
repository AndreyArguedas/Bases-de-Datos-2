--spool
--notar el EXIT, sale del SQLPLUS


conn system/root

set pagesize 0
set linesize 100
set feedback off
set verify off

spool C:\controles\ListUsuarios2.html
select '<html> <table border="1"><tr><th>ID</th><th>Nombre</th></tr>'
from dual;

select '<tr><td>'||user_id||'</td><td>'||username||'</td></tr>'
from   dba_users
order by 1 desc;

select '</table></html>'
from dual;


spool off
exit
