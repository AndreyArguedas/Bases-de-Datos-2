-- Andrey Arguedas Espinoza - Horario 3pm
-- start p1_andrey_arguedas_espinoza.sql

host cls
PROMPT ======================================
PROMPT Practica #1
PROMPT Nos conectamos como system
conn system/root

drop user sistema cascade;
drop user fperez cascade;
drop user ksolano cascade;

PROMPT 2.a

create user sistema identified by s123;
create user fperez identified by f123;
create user ksolano identified by k123;

PROMPT 2.b

grant create session to sistema;
grant create session to fperez;
grant create session to ksolano;

PROMPT 2.c

grant create table to sistema;
grant create procedure to sistema;

PROMPT 2.d

alter user sistema quota unlimited on USERS;
alter user sistema quota unlimited on SYSTEM;

PROMPT 3

conn sistema/s123

PROMPT 3.a

create table empleados(cod_emp number, nom_emp varchar2(10))
tablespace USERS;

PROMPT 3.b

create table departamentos(cod_dep number, nom_dep varchar2(10))
tablespace SYSTEM;

PROMPT 3.d

create or replace procedure  prc_ins_em(pcod_emp in number, pnom_emp in varchar2) is
begin
  insert into empleados (cod_emp, nom_emp) values (pcod_emp, pnom_emp);
  commit;
end prc_ins_em;
/

PROMPT 3.e

create or replace procedure  prc_ins_dep (pcod_dep in number, pnom_dep in varchar2) is
begin
  insert into departamentos (cod_dep, nom_dep) values (pcod_dep, pnom_dep);
  commit;
end prc_ins_dep;
/


PROMPT 3.f

execute prc_ins_em(1, 'Mario');

PROMPT 3.g

execute prc_ins_dep(1, 'Soporte');

PROMPT 3.h

grant execute on prc_ins_em to fperez;

PROMPT 3.i

grant execute on prc_ins_dep to ksolano;

PROMPT 3.j

grant select on empleados to fperez;
grant select on empleados to ksolano;
grant select on departamentos to fperez;
grant select on departamentos to ksolano;

PROMPT 4

conn fperez/f123

PROMPT 4.a

execute sistema.prc_ins_em(2, 'Julia');

PROMPT 4.b
PROMPT *********************************************************************************************
PROMPT Error esperado, el permiso para utilizar el procedimiento prc_ins_dep no se le ha dado a fperez
PROMPT *********************************************************************************************

execute sistema.prc_ins_dep(2, 'Comercial');

PROMPT 4.c

select * from sistema.empleados;

PROMPT 4.d

select * from sistema.departamentos;

PROMPT 5

conn ksolano/k123

PROMPT 5.a
PROMPT *********************************************************************************************
PROMPT Error esperado, el permiso para utilizar el procedimiento prc_ins_em no se le ha dado a ksolano
PROMPT *********************************************************************************************

execute sistema.prc_ins_em(3, 'Hugo');

PROMPT 5.b

execute sistema.prc_ins_dep(3, 'Bodega');

PROMPT 5.c

select * from sistema.empleados;

PROMPT 5.d

select * from sistema.departamentos;
