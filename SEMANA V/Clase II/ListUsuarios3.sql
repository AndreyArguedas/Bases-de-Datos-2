--spool
--notar el EXIT, sale del SQLPLUS


conn system/root

set pagesize 0
set linesize 100
set feedback off
set verify off

spool C:\controles\ListUsuarios3.html
select '<html> <table border="1"><tr><th>ID</th><th>Nombre</th></tr>'
from dual;

--ojo con el orden, se aplica CAST a TEXTO
select '<tr><td>'||user_id||'</td><td>'||username||'</td></tr>'
from   dba_users
order by user_id desc;

select '<tr><td><font size="20" color="red">TOTAL</font></td><td><font size="30">'||count(*)||'</font></td></tr>'
from   dba_users;

select '</table></html>'
from dual;


spool off
exit
