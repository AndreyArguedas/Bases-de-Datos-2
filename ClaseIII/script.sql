-- start 2018-07-30-permisos8pm.sql
host cls
PROMPT Nos conectamos como system
conn system/root

PROMPT Dropeamos el usuario conta
drop user conta cascade;
drop user juan cascade;

PROMPT Dropeamos el rol R_CREA_TABLA
drop role R_CREA_TABLA;
drop role R_CONSULTA;

PROMPT Creamos el usuario CONTA (Sistema de Contabilidad)
create user conta identified by conta123;
create user juan identified by juan123;
create role R_CREA_TABLA;

grant create session to juan;

PROMPT Brindar los permisos minimos.
--probar comentando cada linea de permiso..
grant create table to R_CREA_TABLA;
grant create session to R_CREA_TABLA;
grant create procedure to R_CREA_TABLA;
grant create role to R_CREA_TABLA;
alter user conta quota unlimited on SYSTEM;
grant R_CREA_TABLA to conta;

--ORA-01031: insufficient privileges
-- ORA-01045: user CONTA lacks CREATE SESSION privilege; logon denied
-- ORA-01950: no privileges on tablespace 'SYSTEM'

PROMPT Conexion con usuario CONTA
conn conta/conta123

create role R_CONSULTA;

create table empleado(codigo number, nombre varchar2(10))
tablespace SYSTEM;

create or replace function fun_cant_emp return number is
	VCant number;
begin
	select count(*) into VCant from empleado;
	return(VCant);
end fun_cant_emp;
/
show error

insert into empleado (codigo,nombre) values (1,'Juan');
commit;

select fun_cant_emp() cantidad from dual;

--R_CONSULTA


--grant select on empleado to juan;
--grant execute on fun_cant_emp to juan;

grant select on empleado to R_CONSULTA;
grant execute on fun_cant_emp to R_CONSULTA;

grant R_CONSULTA to juan;

conn juan/juan123
select * from conta.empleado;

select conta.fun_cant_emp() cantidad from dual;



