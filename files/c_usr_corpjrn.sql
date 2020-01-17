
set echo on feedback on trimspool on tab off linesize 132 pagesize 58 serveroutput on size 1000000

spool c_usr_corpjrn.@.log

connect sys/oracle as sysdba

create user corpjrn identified by temporary_#3#_password;

alter user corpjrn
    default tablespace CORP_TAB temporary tablespace TEMP_2
    profile DEFAULT
    quota unlimited on CORP_NDX
    quota unlimited on CORP_TAB
    quota unlimited on CRP_LOB_1
    quota unlimited on VETSNET_NDX1
    quota unlimited on VETSNET_NDX2
    quota unlimited on VETSNET_TBL1
    quota unlimited on VETSNET_TBL3
/

--
-- System grants
--
grant CREATE TABLE to CORPJRN;
grant CREATE SESSION to CORPJRN;
grant SELECT ANY TABLE to CORPJRN;
grant DROP PUBLIC SYNONYM to CORPJRN;
grant CREATE PUBLIC SYNONYM to CORPJRN;

--
-- Role grants
--
grant HINES_RESOURCE to CORPJRN;

spool off

