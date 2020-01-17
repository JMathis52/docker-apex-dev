
set echo on feedback on trimspool on tab off linesize 132 pagesize 58 serveroutput on size 1000000

spool c_usr_vetsnet.@.log

connect sys/oracle as sysdba

create user vetsnet identified by temporary_#3#_password;

alter user vetsnet
    default tablespace VETSNET_DATA temporary tablespace VETSNET_TMP1
    profile DEFAULT
    quota unlimited on VETSNET_DATA
    quota unlimited on VETSNET_IND
/

--
-- System grants
--
grant CREATE TYPE to VETSNET;
grant CREATE SESSION to VETSNET;
grant DEBUG CONNECT SESSION to VETSNET;

--
-- Role grants
--
grant HINES_RESOURCE to VETSNET;

spool off

