spool reporte_fecha.log

SELECT SYSTIMESTAMP T_INICIO FROM DUAL;
select count(*) 
from  padron where fecha >= to_date('01-01-2009','dd-mm-yyyy')
and fecha <= to_date('31-12-2009','dd-mm-yyyy');

SELECT SYSTIMESTAMP T_MEDIO FROM DUAL;
select count(*) 
from padron where to_char(fecha,'yyyy') = '2009';

SELECT SYSTIMESTAMP T_FINAL FROM DUAL;
spool off
exit