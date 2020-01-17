
set echo on feedback on trimspool on tab off linesize 132 pagesize 58 serveroutput on size 1000000

spool c_usr_corpprod.@.log

connect sys/oracle as sysdba

create user corpprod identified by temporary_#3#_password;

alter user corpprod
    default tablespace CORP_TAB temporary tablespace TEMP_3
    profile DEFAULT
    quota unlimited on CORP_NDX
    quota unlimited on CORP_TAB
    quota unlimited on CRP_LOB_1
    quota unlimited on USER_1
    quota unlimited on USER_1_NDX
    quota unlimited on VETSNET_NDX1
    quota unlimited on VETSNET_NDX2
    quota unlimited on VETSNET_TBL1
    quota unlimited on VETSNET_TBL3
/

--
-- System grants
--
grant CREATE JOB to CORPPROD;
grant CREATE TYPE to CORPPROD;
grant CREATE VIEW to CORPPROD;
grant CREATE TABLE to CORPPROD;
grant QUERY REWRITE to CORPPROD;
grant CREATE CLUSTER to CORPPROD;
grant CREATE SESSION to CORPPROD;
grant CREATE SYNONYM to CORPPROD;
grant CREATE TRIGGER to CORPPROD;
grant ALTER ANY TABLE to CORPPROD;
grant CREATE OPERATOR to CORPPROD;
grant CREATE SEQUENCE to CORPPROD;
grant CREATE DIMENSION to CORPPROD;
grant CREATE INDEXTYPE to CORPPROD;
grant CREATE PROCEDURE to CORPPROD;
grant DROP ANY SYNONYM to CORPPROD;
grant SELECT ANY TABLE to CORPPROD;
grant CREATE MATERIALIZED VIEW to CORPPROD;

--
-- Role grants
--
grant FA_USER to CORPPROD;
grant HINES_RESOURCE to CORPPROD;

spool off

