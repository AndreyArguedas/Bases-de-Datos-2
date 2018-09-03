conn system/root

set pagesize 0
set linesize 100
set feedback off
set verify off


create user &1 identified by &1;

grant dba to &1;


exit
