--spool
--notar el EXIT, sale del SQLPLUS
conn test/test

spool C:\controles\ListObjTest.log


-- set pagesize 0
-- set linesize 100
-- set feedback off
-- set verify off


column   object_type format A30
column   object_name format A30
select object_id, object_type, object_name
from   user_objects;

spool off
exit
