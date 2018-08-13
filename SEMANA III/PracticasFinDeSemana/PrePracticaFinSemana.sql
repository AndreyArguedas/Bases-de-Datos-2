-- start PrePracticaFinSemana.sql
host cls
PROMPT ======================================
spool PrePracticaFinSemana.log
PROMPT Pre Practica #2
PROMPT Nos conectamos como system
conn system/root

-- DROP TABLESPACE DAT2 INCLUDING CONTENTS AND DATAFILES;
-- DROP TABLESPACE IDX2 INCLUDING CONTENTS AND DATAFILES;

-- CREATE TABLESPACE DAT2 
-- datafile 'C:\oraclexe\app\oracle\oradata\XE\DAT2.DBF'
-- SIZE 20M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

-- CREATE TABLESPACE IDX2 
-- datafile 'C:\oraclexe\app\oracle\oradata\XE\IDX2.DBF'  
-- SIZE 20M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

PROMPT #3.1

drop user proyecto cascade;
drop user boby cascade;
drop user peter cascade;
drop user tina cascade;
drop user grace cascade;

create user proyecto identified by p123;

PROMPT 6.1
create user boby  identified by b123;
create user peter identified by p123;
create user tina  identified by t123;
create user grace identified by g123;

PROMPT 6.2
grant create session to boby;
grant create session to peter;
grant create session to tina;
grant create session to grace;

PROMPT #3.2

DROP ROLE R_PROYECTO;
DROP ROLE R_CON1;
DROP ROLE R_ACT1;
DROP ROLE R_INS1;
DROP ROLE R_BOR1;
DROP ROLE R_ADM1;

CREATE ROLE R_PROYECTO;

PROMPT #3.3

grant create table to R_PROYECTO;
grant create session to R_PROYECTO;
grant create procedure to R_PROYECTO;
grant create role to R_PROYECTO;

PROMPT #3.4

grant R_PROYECTO to proyecto;

PROMPT #3.5

alter user proyecto quota unlimited on DAT2;
alter user proyecto quota unlimited on IDX2;

PROMPT #4

conn proyecto/p123

PROMPT #4.1
CREATE ROLE R_CON1;
CREATE ROLE R_ACT1;
CREATE ROLE R_INS1;
CREATE ROLE R_BOR1;
CREATE ROLE R_ADM1;

PROMPT #4.2

create table BODEGAS(ID number(5), NOMBRE varchar2(10), INVENTARIO  number(5))
tablespace DAT2;

PROMPT #4.3

alter table BODEGAS ADD primary key (ID) USING INDEX TABLESPACE IDX2;

PROMPT #4.4

grant select on BODEGAS to R_CON1;

PROMPT #4.5

create or replace procedure INSERTAR(PID in number, PNombre in varchar2, PInventario  in number) is
begin
  insert into BODEGAS (ID, NOMBRE, INVENTARIO) values (PID, PNombre, PInventario);
  commit;
end INSERTAR;
/

PROMPT #4.6

create or replace procedure Actualizar(PCod in number, PNombre in varchar2, PInventario in number) is
begin
  update BODEGAS set NOMBRE = PNombre, INVENTARIO = PInventario  where ID = PCod;
  commit;
end Actualizar;
/

PROMPT #4.7

create or replace procedure Borrar(PCod in number) is
begin
  delete BODEGAS where ID = PCod;
  commit;
end Borrar;
/

PROMPT 5.1
grant execute on Actualizar to R_ACT1;
grant execute on INSERTAR to R_INS1;
grant execute on Borrar to R_BOR1;

PROMPT 5.2
grant R_CON1 to R_ADM1;
grant R_ACT1 to R_ADM1;
grant R_INS1 to R_ADM1;
grant R_BOR1 to R_ADM1;

PROMPT 7.1
grant R_CON1 to boby;

PROMPT 7.2
grant R_CON1 to peter;
grant R_INS1 to peter;

PROMPT 7.3 
grant R_CON1 to tina;
grant R_INS1 to tina;
grant R_ACT1 to tina;

PROMPT 7.4)
grant R_ADM1 to grace;

PROMPT 8.1
conn peter/p123
execute proyecto.INSERTAR(1,'Tibas',1500);
select * from proyecto.BODEGAS;

PROMPT 8.2
conn boby/b123
execute proyecto.INSERTAR(2,'Uruca',2500);
--Genera un "error esperado"
select * from proyecto.BODEGAS;

PROMPT 8.3
conn tina/t123
execute proyecto.INSERTAR(3,'Llorente',3500);
select * from proyecto.BODEGAS;
execute proyecto.Actualizar(3,'LLORENTE',4500);
select * from proyecto.BODEGAS;
execute proyecto.Borrar(3);
select * from proyecto.BODEGAS;

--Nota: En borrar se presenta un "error esperado", pues tina no tiene ese permiso!

PROMPT 8.4
conn grace/g123
execute proyecto.INSERTAR(4,'Liberia',8500);
select * from proyecto.BODEGAS;
execute proyecto.Actualizar(3,'LIBERIA',9000);
select * from proyecto.BODEGAS;
execute proyecto.Borrar(3);
select * from proyecto.BODEGAS;

spool off
PROMPT ======================================