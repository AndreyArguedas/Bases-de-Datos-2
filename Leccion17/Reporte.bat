REM Reporte.bat Cuenta registros por nombre
sqlplus mineria/mineria @reporte.sql
type reporte.log >> reporte_final.log
pause