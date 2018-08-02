-- start andrey_arguedas_t1.sql

host cls

PROMPT ANDREY ARGUEDAS / BD2
PROMPT Tarea  1 (3pm) 
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