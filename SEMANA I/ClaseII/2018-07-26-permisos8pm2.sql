-- start 2018-07-26-permisos8pm.sql
host cls
PROMPT Nos conectamos como system
conn system/root

PROMPT Dropeamos el usuario conta
drop user conta cascade;

PROMPT Creamos el usuario CONTA (Sistema de Contabilidad)
create user conta identified by conta123;


PROMPT Brindar los permisos minimos.
--probar comentando cada linea de permiso..
grant create table to conta;
grant create session to conta;
alter user conta quota unlimited on SYSTEM;
--repasar TABLESPACE y DATAFILES...









