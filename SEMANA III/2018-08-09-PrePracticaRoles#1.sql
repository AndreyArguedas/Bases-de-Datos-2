-- Basado en: start 2018-07-26-permisos8pm4.sql
-- start 2018-08-09-PrePracticaRoles#1.sql
host cls
PROMPT Version 2
PROMPT Nos conectamos como system
conn system/root

spool 2018-08-09-PrePracticaRoles#1.log

--CREATE TABLESPACE datos 
--datafile 'C:\oraclexe\app\oracle\oradata\XE\datos.DBF'
--SIZE 10M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

--CREATE TABLESPACE indices 
--datafile 'C:\oraclexe\app\oracle\oradata\XE\indices.DBF'  
--SIZE 10M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

PROMPT Dropeamos el usuario conta
drop user conta cascade;
drop user juan cascade;

DROP ROLE R_CREA_TABLA;

DROP ROLE R_CONSULTA;

PROMPT Creamos el usuario CONTA (Sistema de Contabilidad)

CREATE ROLE R_CREA_TABLA;
create user conta identified by conta123;
create user juan identified by juan123;
grant create session to juan;

PROMPT Brindar los permisos minimos.

grant create table to R_CREA_TABLA;
grant create session to R_CREA_TABLA;
grant create procedure to R_CREA_TABLA;


grant create role to R_CREA_TABLA;

--alter user conta quota unlimited on SYSTEM;
alter user conta quota unlimited on DATOS;
alter user conta quota unlimited on INDICES;

grant R_CREA_TABLA to conta;


PROMPT Conexion con usuario CONTA
--
conn conta/conta123

create role R_CONSULTA;

create table empleado(codigo number, nombre varchar2(10))
tablespace DATOS;

PROMPT  5.10
alter table empleado
ADD primary key (codigo) USING INDEX TABLESPACE INDICES;
 

create or replace function fun_cant_emp return number is
  VCant number;
begin
  select count(*) into VCant from empleado;
  return(VCant);
end fun_cant_emp;
/

--5.3
PROMPT 5.3
create or replace procedure PRC_INS_EMP(PCod in number, PNombre in varchar2) is

begin
  insert into empleado (codigo,nombre) values (PCod,PNombre);
	commit;
end PRC_INS_EMP;
/

insert into empleado (codigo,nombre) values (1,'Juan');
commit;

--5.4
PROMPT 5.4

exec conta.PRC_INS_EMP(2, 'ANA');

select fun_cant_emp() cantidad from dual;

grant execute on fun_cant_emp to R_CONSULTA;

PROMPT 5.5 Permisos a Juan

grant select on empleado to R_CONSULTA;
grant R_CONSULTA to juan;

PROMPT 5.7

grant execute on PRC_INS_EMP to R_CONSULTA;


conn juan/juan123
select * from conta.empleado;	
select conta.fun_cant_emp() cantidad from dual;

--5.6
PROMPT 5.6

execute conta.PRC_INS_EMP(3, 'Pedro');

--5.7
PROMPT 5.7
execute conta.PRC_INS_EMP(4, 'Juana');
select * from conta.empleado;


spool off









