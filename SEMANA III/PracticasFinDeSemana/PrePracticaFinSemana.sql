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

create user proyecto identified by p123;

PROMPT #3.2

DROP ROLE R_PROYECTO;
DROP ROLE R_CON1;
DROP ROLE R_ACT1;
DROP ROLE R_INS1;
DROP ROLE R_BOR1;

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

spool off
PROMPT ======================================