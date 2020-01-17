
set echo on feedback on trimspool on tab off linesize 132 pagesize 58 serveroutput on size 1000000

spool c_usr_cp.@.log

connect sys/oracle as sysdba

create user cp identified by temporary_#3#_password;

alter user cp
    default tablespace USERS_DATA temporary tablespace VETSNET_TMP1
    profile DEFAULT
    quota unlimited on USERS_DATA
/

--
-- System grants
--
grant CREATE TYPE to CP;
grant CREATE SESSION to CP;
grant DEBUG CONNECT SESSION to CP;

--
-- Role grants
--
grant HINES_RESOURCE to CP;

spool off

