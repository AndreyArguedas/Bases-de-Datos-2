spool reporte_fecha.log

SELECT SYSTIMESTAMP T_INICIO FROM DUAL;
select count(*) from mineria.padron where fecha >= to_date('01-12-2009', 'dd-mm-yyyy') and fecha <= to_date('31-12-2009', 'dd-mm-yyyy');
SELECT SYSTIMESTAMP T_INICIO FROM DUAL;

SELECT SYSTIMESTAMP T_INICIO FROM DUAL;
select count(*) from mineria.padron where fecha >= to_date('01-01-2010', 'dd-mm-yyyy') and fecha <= to_date('31-12-2010', 'dd-mm-yyyy');
SELECT SYSTIMESTAMP T_INICIO FROM DUAL;

SELECT SYSTIMESTAMP T_INICIO FROM DUAL;
select count(*) from mineria.padron where to_char(fecha, 'yyyy') = '2009';
SELECT SYSTIMESTAMP T_INICIO FROM DUAL;

SELECT SYSTIMESTAMP T_INICIO FROM DUAL;
select count(*) from mineria.padron where to_char(fecha, 'yyyy') = '2010';
SELECT SYSTIMESTAMP T_INICIO FROM DUAL;

spool off
exit