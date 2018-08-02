-- Basado en: start 2018-07-26-permisos8pm4.sql
-- start 2018-07-30-roles8pm.sql
host cls
PROMPT Version 2
PROMPT Nos conectamos como system
conn system/root

PROMPT Dropeamos el usuario conta
drop user conta cascade;
drop user juan cascade;
--#1.1
DROP ROLE R_CREA_TABLA;
--#2.3
DROP ROLE R_CONSULTA;

PROMPT Creamos el usuario CONTA (Sistema de Contabilidad)
--#1.2
CREATE ROLE R_CREA_TABLA;
create user conta identified by conta123;
create user juan identified by juan123;
grant create session to juan;

PROMPT Brindar los permisos minimos.
--probar comentando cada linea de permiso..
--#1.3 cambiar
grant create table to R_CREA_TABLA;
grant create session to R_CREA_TABLA;
grant create procedure to R_CREA_TABLA;

--#2.1 para que pueda crear R_CONSULTA
grant create role to R_CREA_TABLA;

alter user conta quota unlimited on SYSTEM;
--#1.4
grant R_CREA_TABLA to conta;

-- ORA-01031: insufficient privileges
-- ORA-01045: user CONTA lacks CREATE SESSION privilege; logon denied
-- ORA-01950: no privileges on tablespace 'SYSTEM'

PROMPT Conexion con usuario CONTA
--
conn conta/conta123
--#2.2 crear role R_CONSULTA
create role R_CONSULTA;

create table empleado(codigo number, nombre varchar2(10))
tablespace SYSTEM;
--grant create procedure to R_CREA_TABLA;
create or replace function fun_cant_emp return number is
  VCant number;
begin
  select count(*) into VCant from empleado;
  return(VCant);
end fun_cant_emp;
/
insert into empleado (codigo,nombre) values (1,'Juan');
commit;
select fun_cant_emp() cantidad from dual;
-- PARTE #2 del Ejercicio...
--(Crear un rol llamado R_CONSULTA  "dar estos permisos a dicho rol"
--y dar el rol a JUAN) -- EL ROL R_CONSULTA lo debe crear CONTA,
--a CONTA deben darle el permiso de "create role" por medio del rol
--R_CREA_TABLA  
--el rol R_CONSULTA lo puede dropear system
--"dar estos permisos a dicho rol"
--#2.4
--grant select on empleado to R_CONSULTA;
grant execute on fun_cant_emp to R_CONSULTA;

--#2.5
grant R_CONSULTA to juan;

conn juan/juan123
select * from conta.empleado;	
select conta.fun_cant_emp() cantidad from dual;













