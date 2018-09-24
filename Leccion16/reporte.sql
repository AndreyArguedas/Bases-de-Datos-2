spool reporte.log
SELECT SYSTIMESTAMP T_INICIO FROM DUAL;
select count(*) from mineria.padron where nombre = upper('juan');
select count(*) from mineria.padron where nombre = upper('pedro');
select count(*) from mineria.padron where nombre = upper('ana');
select count(*) from mineria.padron where nombre = upper('roberto');
SELECT SYSTIMESTAMP T_INICIO FROM DUAL;
spool off
exit