--
conn system/root

spool C:\controles\ListarUsuarios.log

select user_id, username
from dba_users
order by 1 desc;

spool off
exit