set echo on feedback on trimspool on tab off linesize 132 pagesize 10000 serverouput on size unlimited
spool c_dbs_devl.@.log

whenever sqlerror exit failure;
connect sys/oracle as sysdba

create tablespace CORP_NDX
    datafile 'CORP_NDX.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace CORP_TAB
    datafile 'CORP_TAB.dat' size 200M reuse autoextend on
    extent management local
    UNIFORM size 64K
/

create tablespace CRP_LOB_1
    datafile 'CRP_LOB_1.dat' size 200M reuse autoextend on
    extent management local
    UNIFORM size 21296K
/

create TEMPORARY tablespace CRP_TMP_1S
    tempfile 'CRP_TMP_1S.dat' size 200M reuse autoextend on
    extent management local
    UNIFORM size 176K
/

create TEMPORARY tablespace TEMP_1
    tempfile 'TEMP_1.dat' size 200M reuse autoextend on
    extent management local
    UNIFORM size 64K
    tablespace group TMPTBSGRP_1
/

create TEMPORARY tablespace TEMP_2
    tempfile 'TEMP_2.dat' size 200M reuse autoextend on
    extent management local
    UNIFORM size 64K
    tablespace group TMPTBSGRP_1
/

create TEMPORARY tablespace TEMP_3
    tempfile 'TEMP_3.dat' size 200M reuse autoextend on
    extent management local
    UNIFORM size 128K
    tablespace group TMPTBSGRP_1
/

create tablespace TOOLS
    datafile 'TOOLS.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace USERS_DATA
    datafile 'USERS_DATA.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace USER_1
    datafile 'USER_1.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace USER_1_NDX
    datafile 'USER_1_NDX.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace VETSNET_DATA
    datafile 'VETSNET_DATA.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace VETSNET_IND
    datafile 'VETSNET_IND.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace VETSNET_NDX1
    datafile 'VETSNET_NDX1.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace VETSNET_NDX2
    datafile 'VETSNET_NDX2.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace VETSNET_TBL1
    datafile 'VETSNET_TBL1.dat' size 200M reuse autoextend on
    extent management local
/

create tablespace VETSNET_TBL3
    datafile 'VETSNET_TBL3.dat' size 200M reuse autoextend on
    extent management local
/

create TEMPORARY tablespace VETSNET_TMP1
    tempfile 'VETSNET_TMP1.dat' size 200M reuse autoextend on
    extent management local
    UNIFORM size 128K
    tablespace group TMPTBSGRP_2
/

----------------------------------

alter user sys temporary tablespace TEMP_1
/

alter user system default tablespace TOOLS temporary tablespace TEMP_1
/

whenever sqlerror continue;
spool off

REM * Create data local entries

connect sys/oracle as sysdba

set echo off
spool standard.@.log
@@?/rdbms/admin/standard.sql
spool off
set echo on
!sleep 1

set echo on
spool catxdbdv.@.log
@@?/rdbms/admin/catxdbdb.sql
spool off
!sleep 1

set echo off
spool catalog.@.log
@@?/rdbms/admin/catalog.sql
spool off
set echo on
!sleep 1

set echo off
spool catproc.@.log
@@?/rdbms/admin/catproc.sql
spool off
set echo on
!sleep 1

spool c_dbs_devl_2.log
spool

whenever sqlerror exit failure;

--
-- Invalid SYS objects after database creation and run of catproc.sql
--
connect sys/oracle as sysdba
whenever sqlerror continue;
@@?/rdbms/admin/utlrp.sql
whenever sqlerror exit failure;
shutdown immediate
startup mount
alter database ARCHIVELOG;
alter database OPEN;
whenever sqlerror continue;

alter user system identified by M4n4ger$;

spool off
!sleep 1

connect system/oracle
set echo off
spool catdbsyn-system.log
@@?/rdbms/admin/catdbsyn.sql
spool off

set echo on
spool pupbld.log
@@?/sqlplus/admin/pupbld.sql
spool off