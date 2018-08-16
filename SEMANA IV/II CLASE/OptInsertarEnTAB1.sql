conn test/test

spool C:\controles\OptInsertarEnTAB1.log

insert into TAB1(a) values (sec01.nextval);
commit;
select count(*) from TAB1;

spool off
exit