
set echo on feedback on trimspool on tab off linesize 132 pagesize 58 serveroutput on size 1000000

spool c_usr_fa.@.log

connect sys/oracle as sysdba

create user fa identified by temporary_#3#_password;

alter user fa
    default tablespace USERS_DATA temporary tablespace VETSNET_TMP1
    profile DEFAULT
    quota unlimited on USERS_DATA
/

--
-- System grants
--
grant CREATE TYPE to FA;
grant CREATE LIBRARY to FA;
grant CREATE SESSION to FA;
grant DEBUG CONNECT SESSION to FA;

--
-- Role grants
--
grant FA_USER to FA;
grant PLUSTRACE to FA;
grant HINES_RESOURCE to FA;
grant LOCK_QUERY_ROLE to FA;

spool off

