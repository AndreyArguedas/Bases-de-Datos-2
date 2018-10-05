REM Reporte_fecha.bat Vencimiento de Cedulas
sqlplus mineria/mineria @reporte_fecha.sql
type reporte_fecha.log >> reporte_fecha_final.log