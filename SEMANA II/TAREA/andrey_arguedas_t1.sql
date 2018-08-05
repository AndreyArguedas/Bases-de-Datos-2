-- start andrey_arguedas_t1.sql

host cls

PROMPT ANDREY ARGUEDAS / BD2
PROMPT Tarea #1 (3pm) 
PROMPT Fecha Entrega: 06-agosto-2018

PROMPT ==========================================
PROMPT Nos conectamos como system
conn system/root
PROMPT ==========================================

PROMPT Dropeos de 3 usuarios y 3 roles

--Users
drop user conta cascade;
drop user juan cascade;
drop user pedro cascade;

--Roles
drop ROLE R_CREA_TABLA;
drop ROLE R_CONSULTA;
drop ROLE R_ACTUALIZA;

PROMPT ==========================================

PROMPT Creacion de Role R_CREA_TABLA, 3 usuarios
PROMPT Permiso directo de conectarse a pedro y juan

CREATE ROLE R_CREA_TABLA;

create user conta identified by conta123;
create user juan identified by juan123;
create user pedro identified by pedro123;

grant create session to juan;
grant create session to pedro;

PROMPT ==========================================
PROMPT Brindar los permisos minimos.
PROMPT Permisos de crear tabla, conectarse, crear procedimientos
PROMPT crear vista, crear rol, Cuota. rol a conta

--PERMISOS BRINDADOS

--Crear tabla
grant create table to R_CREA_TABLA;
--Conectarse
grant create session to R_CREA_TABLA;
--Crear procedure
grant create procedure to R_CREA_TABLA;
--Crear rol
grant create role to R_CREA_TABLA;
--Crear vista
grant create view TO R_CREA_TABLA;

alter user conta quota unlimited on SYSTEM;

grant R_CREA_TABLA to conta;

PROMPT ==========================================
PROMPT Conexion con ususario CONTA, crea 2 roles
conn conta/conta123

--Roles creados por conta
create role R_CONSULTA;
create role R_ACTUALIZA;

PROMPT ==========================================
PROMPT Crear tabla empleado (codigo, nombre, salario) y la PK 
PROMPT ambos en TABLESPACE SYSTEM

create table empleado(codigo number not null, nombre varchar2(10), salario number(5))
tablespace SYSTEM;

alter table empleado
ADD primary key (codigo);

PROMPT ==========================================
PROMPT Crear funcion fun_cant_emp

create or replace function fun_cant_emp return number is
  VCant number;
begin
  select count(*) into VCant from empleado;
  return(VCant);
end fun_cant_emp;
/

PROMPT ==========================================
PROMPT Crear procedimiento prc_act_salario

create or replace procedure prc_act_salario(PCod in number, PSalario in number) is

begin
  update empleado set salario = PSalario where codigo = PCod;
  commit;
end prc_act_salario;
/

PROMPT ==========================================
PROMPT Crear vista REP_ALTOS (salarios altos)

create or replace view REP_ALTOS as
select nombre, salario from empleado where salario > 1000;

PROMPT ==========================================
PROMPT Insert de los 3 empleados directos

insert into empleado (codigo, nombre, salario) values (1,'Juan', 1000);
insert into empleado (codigo, nombre, salario) values (2,'Ana', 2000);
insert into empleado (codigo, nombre, salario) values (3,'Pedro', 3000);
commit;

PROMPT ==========================================
PROMPT Prueba de la funcion cantidad de empleados (ahora son 3)

select fun_cant_emp() cantidad from dual;

PROMPT ==========================================
PROMPT Permisos 3 a R_CONSULTA // 2 a R_ACTUALIZA

grant select on empleado to R_CONSULTA;
grant execute on fun_cant_emp to R_CONSULTA;
grant select on REP_ALTOS to R_CONSULTA;

grant execute on prc_act_salario to R_ACTUALIZA;
grant select on empleado to R_ACTUALIZA;

PROMPT ==========================================
PROMPT Dar rol a juan y a pedro

grant R_ACTUALIZA to pedro;
grant R_CONSULTA to juan;

PROMPT ==========================================
PROMPT Se conecta con juan hace pruebas

conn juan/juan123

select * from conta.empleado;	
select conta.fun_cant_emp() cantidad from dual;
select * from conta.REP_ALTOS;

PROMPT ==========================================
PROMPT Se conecta con Pedro,

conn pedro/pedro123
PROMPT ==========================================
PROMPT error esperado, no se puede actualizar directamente solo por medio del procedimiento o

update conta.empleado set salario = 1500 where codigo = 1;

commit;
PROMPT ==========================================
PROMPT Si funciona la ejecucion del procedimiento y cambia el salario de Juan a 1500

exec conta.prc_act_salario(1, 1500);
PROMPT ==========================================
PROMPT Select de la tabla funciona y salario actualizado

select * from conta.empleado;
PROMPT ==========================================
PROMPT Fin de la Tarea #1
PROMPT Andrey Arguedas


