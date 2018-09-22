conn system/root
spool ./logs/BorrarCrear.log
drop user &1 cascade;
create user &1 identified by &1;
grant dba to &1;
spool off
exit