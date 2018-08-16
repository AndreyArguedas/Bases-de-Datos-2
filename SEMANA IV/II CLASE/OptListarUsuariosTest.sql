--
conn test/test

spool C:\controles\OptListarUsuariosTest.log

column   object_type format A30

column   object_name format A30

select object_id, object_type, object_name from   user_objects;

spool off
exit