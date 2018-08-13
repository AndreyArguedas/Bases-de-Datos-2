-- start PracticaLunes.sql
host cls
PROMPT ======================================
spool PracticaLunes.log
PROMPT Pre Practica #3
PROMPT Nos conectamos como system
conn system/root

drop role R_USUARIO;
drop role R_JEFE;

drop user planilla cascade;
drop user RMORA cascade;
drop user FGARCIA cascade;

create user planilla identified by p123;

grant create table to planilla;
grant create session to planilla;
grant create procedure to planilla;
grant create role to planilla;
grant create view to planilla;

alter user planilla quota unlimited on USERS;

PROMPT 3
create user RMORA identified by r123;
create user FGARCIA identified by f123;

grant create session to RMORA;
grant create session to FGARCIA;

conn planilla/p123

PROMPT 2.1

create table DEPARTAMENTOS(ID number(3) not null, NOMBRE  varchar2(10) not null, FEC_INICIO   date  not null, SAL_MAX  number(5)  not null)
tablespace USERS;

PROMPT 2.2

alter table DEPARTAMENTOS ADD primary key (ID) USING INDEX TABLESPACE USERS;

PROMPT 2.3

create or replace procedure PRC_INS_DEPTO(PID in number, PNombre in varchar2, PFEC_INICIO  in date, PSAL_MAX in number) is
begin
  insert into DEPARTAMENTOS (ID, NOMBRE, FEC_INICIO, SAL_MAX) values (PID, PNombre, PFEC_INICIO, PSAL_MAX);
  commit;
end PRC_INS_DEPTO;
/

PROMPT 2.4
create or replace procedure PRC_ACT_DEPTO(PNombre in varchar2, PFEC_INICIO  in date, PSAL_MAX in number, PCod in number) is
begin
  update DEPARTAMENTOS set NOMBRE = PNombre, FEC_INICIO = PFEC_INICIO, SAL_MAX = PSAL_MAX  where ID = PCod;
  commit;
end PRC_ACT_DEPTO;
/

PROMPT 2.5

create or replace procedure PRC_BORR_DEPTO(PCod in number) is
begin
  delete DEPARTAMENTOS where ID = PCod;
  commit;
end PRC_BORR_DEPTO;
/

PROMPT 2.6
create or replace view REP_DEPTO as
select NOMBRE, SAL_MAX from DEPARTAMENTOS WHERE SAL_MAX=(SELECT MAX(SAL_MAX) FROM DEPARTAMENTOS);

PROMPT 2.7

CREATE ROLE R_USUARIO;
CREATE ROLE R_JEFE;

PROMPT 2.8
grant select on REP_DEPTO to R_USUARIO;
grant execute on PRC_INS_DEPTO to R_USUARIO;

PROMPT 2.8
grant execute on PRC_ACT_DEPTO to R_JEFE;
grant execute on PRC_BORR_DEPTO to R_JEFE;

GRANT R_USUARIO TO R_JEFE;

PROMPT 3.1

grant R_JEFE to RMORA;
grant R_USUARIO to FGARCIA;

conn RMORA/r123

PROMPT 3.2

execute planilla.PRC_INS_DEPTO(1, 'Ventas', sysdate, 4000);
execute planilla.PRC_INS_DEPTO(2, 'Compras', sysdate, 5000);

PROMPT 3.3
execute planilla.PRC_ACT_DEPTO('VTAS', sysdate, 4100, 1);

PROMPT 3.4
execute planilla.PRC_BORR_DEPTO(2);

PROMPT 3.5
SELECT * from planilla.REP_DEPTO;

PROMPT 3.6

conn FGARCIA/f123

execute planilla.PRC_INS_DEPTO(3, 'Conta', sysdate, 1300);
execute planilla.PRC_INS_DEPTO(4, 'Cajas', sysdate, 1200);

PROMPT 3.7  EROR ESPERADO FGARCIA NO TIENE PERMISO DE ACTUALIZAR
execute planilla.PRC_ACT_DEPTO('CONTA', sysdate, 2300, 1);

PROMPT 3.8 EROR ESPERADO FGARCIA NO TIENE PERMISO DE BORRAR
execute planilla.PRC_BORR_DEPTO(2);

PROMPT 3.9
SELECT * from planilla.REP_DEPTO;