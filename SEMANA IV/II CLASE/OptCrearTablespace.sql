conn system/root

spool C:\controles\OptCrearTablespace.log

CREATE TABLESPACE datos 
datafile 'C:\oraclexe\app\oracle\oradata\XE\datos.DBF'
SIZE 10M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

spool off
exit