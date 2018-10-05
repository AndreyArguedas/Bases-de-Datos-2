spool reporte.log
SELECT SYSTIMESTAMP T_INICIO FROM DUAL;
select count(*) from mineria.padron where nombre like '%JUAN%';
select count(*) from mineria.padron where nombre like '%PEDRO%';
select count(*) from mineria.padron where nombre like '%ANA%';
select count(*) from mineria.padron where nombre like '%ROBERTO%';
SELECT SYSTIMESTAMP T_FINAL FROM DUAL;
spool off
exit