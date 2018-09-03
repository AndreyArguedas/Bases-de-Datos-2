@ECHO off
cls

set Owner=
set /p Owner=Indique el usuario:

echo touser=%Owner% > IMP-HR.par 
echo userid=system/root >> IMP-HR.par
echo fromuser=hr >> IMP-HR.par
echo file=hr.dmp >> IMP-HR.par
echo log=imp-hr.log >>IMP-HR.par
imp parfile=IMP-HR.par
exit












