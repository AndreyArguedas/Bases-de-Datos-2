
SELECT SYSTIMESTAMP T_INICIO FROM DUAL;

alter table padron add constraint padron_pk primary key (cedula) using index tablespaces padron indices;
SELECT SYSTIMESTAMP T_FINAL FROM DUAL;
