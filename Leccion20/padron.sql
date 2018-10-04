spool padron_obj.log
conn system/root
drop user mineria cascade;

drop TABLESPACE padron_datos including contents and datafiles;
drop TABLESPACE padron_indices including contents and datafiles;

CREATE TABLESPACE padron_datos 
datafile 'C:\oraclexe\app\oracle\oradata\XE\padron_datos.DBF'  
SIZE 200M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

CREATE TABLESPACE padron_indices 
datafile 'C:\oraclexe\app\oracle\oradata\XE\padron_indices.DBF'  
SIZE 200M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

create user mineria identified by mineria default tablespace padron_datos;

grant dba to mineria;

spool off
exit