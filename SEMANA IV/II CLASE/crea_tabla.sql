--
conn test/test

spool C:\controles\crea_tabla.log

--crear table
create table tab1(a number);

--crear table
create table tab2(a number);

create sequence sec01;

spool off

exit
