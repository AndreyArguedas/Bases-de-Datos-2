-- start 2018-07-26-permisos8pm.sql
--repasar TABLESPACE y DATAFILES...
--repasar reglas de COOD 0-7
host cls
PROMPT Nos conectamos como system
conn system/root

PROMPT Dropeamos el usuario conta
drop user conta cascade;
drop user juan cascade;

PROMPT Creamos el usuario CONTA (Sistema de Contabilidad)
create user conta identified by conta123;
create user juan identified by juan123;
grant create session to juan;

PROMPT Brindar los permisos minimos.
--probar comentando cada linea de permiso..
grant create table to conta;
grant create session to conta;
alter user conta quota unlimited on SYSTEM;

--ORA-01031: insufficient privileges
-- ORA-01045: user CONTA lacks CREATE SESSION privilege; logon denied
-- ORA-01950: no privileges on tablespace 'SYSTEM'

PROMPT Conexion con usuario CONTA
conn conta/conta123

create table empleado(codigo number, nombre varchar2(10))
tablespace SYSTEM;

insert into empleado (codigo,nombre) values (1,'Juan');
commit;
grant select on empleado to juan;
conn juan/juan123
select * from conta.empleado;





