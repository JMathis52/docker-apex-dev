
set echo on feedback on trimspool on tab off linesize 132 pagesize 10000 serveroutput on size unlimited
spool c_dbs_devl.@.log

whenever sqlerror exit failure;
connect sys/oracle as sysdba

-- create database DEVL
--     MAXLOGFILES 100
--     MAXLOGMEMBERS 4
--     MAXDATAFILES 400
--     MAXINSTANCES 1
--     MAXLOGHISTORY 32120
--     NOARCHIVELOG
--     CHARACTER SET "US7ASCII"
--     CONTROLFILE REUSE
--     LOGFILE
--         group 1 ('/283data1/oracle/devl/redo_1a.log',
--                 '/283data3/oracle/devl/redo_1b.log')
--             size 4M reuse,
--         group 2 ('/283data2/oracle/devl/redo_2a.log',
--                 '/283data1/oracle/devl/redo_2b.log')
--             size 4M reuse,
--         group 3 ('/283data3/oracle/devl/redo_3a.log',
--                 '/283data2/oracle/devl/redo_3b.log')
--             size 4M reuse,
--         group 4 ('/283data1/oracle/devl/redo_4a.log',
--                 '/283data2/oracle/devl/redo_4b.log')
--             size 4M reuse    DATAFILE
--     DATAFILE
--         '/283data3/oracle/devl/system.dbf' size 2048M reuse autoextend off,
--         '/283data3/oracle/devl/system2.dbf' size 2500M reuse autoextend off
--     SYSAUX
-- 	datafile
-- 	    '/283data3/oracle/devl/sysaux01.dbf' size 2048M reuse autoextend OFF
--     DEFAULT TEMPORARY tablespace TEMP_1
-- 	tempfile
-- 	    '/283data1/oracle/devl/temp_1.dbf' size 300M reuse autoextend OFF,
-- 	    '/283data7/oracle/devl/temp_1b.dbf' size 300M reuse autoextend OFF,
-- 	    '/283data1/oracle/devl/temp_1a.dbf' size 200M reuse autoextend OFF
-- 	extent management local UNIFORM size 64K
--     UNDO tablespace UNDOTBS
-- 	datafile
-- 	    '/283data10/oracle/devl/undotbs_1.dbf' size 1024M reuse autoextend OFF,
-- 	    '/283data1/oracle/devl/undotbs_2.dbf' size 1024M reuse autoextend OFF
-- /

create tablespace CORP_NDX
    datafile
        '/283data7/oracle/devl/vetsnet_tbl2_6.dbf' size 4096M reuse
        autoextend OFF,
        '/283data6/oracle/devl/vetsnet_tbl2_4.dbf' size 2048M reuse
        autoextend OFF,
        '/283data3/oracle/devl/vetsnet_tbl2.dbf' size 2048M reuse
        autoextend OFF,
        '/283data7/oracle/devl/vetsnet_tbl2_5.dbf' size 4096M reuse
        autoextend OFF,
        '/283data7/oracle/devl/vetsnet_tbl2_2.dbf' size 4096M reuse
        autoextend OFF,
        '/283data7/oracle/devl/vetsnet_tbl2_3.dbf' size 4096M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 20K  next 20K
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 1)
/

create tablespace CORP_TAB
    datafile
        '/283data2/oracle/devl/corp_tab_1.dbf' size 2048M reuse
        autoextend OFF
    extent management local
    UNIFORM size 64K
/

create tablespace CRP_LOB_1
    datafile
        '/283data1/oracle/devl/crp_lob_1_1.dbf' size 3200M reuse
        autoextend OFF,
        '/283data2/oracle/devl/crp_lob_1_2.dbf' size 3200M reuse
        autoextend OFF,
        '/283data5/oracle/devl/crp_lob_1_3.dbf' size 3200M reuse
        autoextend OFF,
        '/283data7/oracle/devl/crp_lob_1_4.dbf' size 3200M reuse
        autoextend OFF
    extent management local
    UNIFORM size 21296K
/

create TEMPORARY tablespace CRP_TMP_1S
    tempfile
        '/283data11/oracle/devl/crp_tmp_1s_1.dbf' size 32M reuse
        autoextend OFF
    extent management local
    UNIFORM size 176K
/

create TEMPORARY tablespace TEMP_2
    tempfile
        '/283data3/oracle/devl/temp_2a.dbf' size 80M reuse
        autoextend OFF,
        '/283data7/oracle/devl/temp_2b.dbf' size 120M reuse
        autoextend OFF
    extent management local
    UNIFORM size 64K
    tablespace group TMPTBSGRP_1
/

create TEMPORARY tablespace TEMP_3
    tempfile
        '/283data7/oracle/devl/temp_3.dbf' size 1024M reuse
        autoextend OFF
    extent management local
    UNIFORM size 128K
    tablespace group TMPTBSGRP_1
/

create tablespace TOOLS
    datafile
        '/283data2/oracle/devl/tools.dbf' size 400M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 100K  next 100K
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 1)
/

create tablespace USERS_DATA
    datafile
        '/283data1/oracle/devl/tier3_users_data_1.dbf' size 1024M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 20K  next 20K
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 50)
/

create tablespace USER_1
    datafile
        '/283data10/oracle/devl/user_2.dbf' size 1024M reuse
        autoextend OFF,
        '/283data2/oracle/devl/user_1a.dbf' size 800M reuse
        autoextend OFF
    extent management local
/

create tablespace USER_1_NDX
    datafile
        '/283data3/oracle/devl/user_1_ndx.dbf' size 200M reuse
        autoextend OFF,
        '/283data3/oracle/devl/user_1_ndx_2.dbf' size 200M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 64K  next 1M
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 0)
/

create tablespace VETSNET_DATA
    datafile
        '/283data2/oracle/devl/tier3_vetsnet_data_1.dbf' size 512M reuse
        autoextend OFF,
        '/283data1/oracle/devl/tier3_vetsnet_data_2.dbf' size 512M reuse
        autoextend OFF,
        '/283data3/oracle/devl/vetsnet_data_2.dbf' size 512M reuse
        autoextend OFF,
        '/283data1/oracle/devl/vetsnet_data_3.dbf' size 512M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 20K  next 20K
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 50)
/

create tablespace VETSNET_IND
    datafile
        '/283data3/oracle/devl/tier3_vetsnet_ind_1.dbf' size 300M reuse
        autoextend OFF,
        '/283data7/oracle/devl/tier3_vetsnet_ind_2.dbf' size 300M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 20K  next 20K
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 50)
/

create tablespace VETSNET_NDX1
    datafile
        '/283data1/oracle/devl/vetsnet_ndx1.dbf' size 588M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 20K  next 20K
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 1)
/

create tablespace VETSNET_NDX2
    datafile
        '/283data2/oracle/devl/vetsnet_ndx2.dbf' size 7168M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 20K  next 20K
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 1)
/

create tablespace VETSNET_TBL1
    datafile
        '/283data2/oracle/devl/vetsnet_tbl1.dbf' size 2048M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 20K  next 20K
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 1)
/

create tablespace VETSNET_TBL3
    datafile
        '/283data1/oracle/devl/vetsnet_tbl3.dbf' size 2048M reuse
        autoextend OFF,
        '/283data2/oracle/devl/vetsnet_tbl3_2.dbf' size 2048M reuse
        autoextend OFF,
        '/283data7/oracle/devl/vetsnet_tbl3_3.dbf' size 3072M reuse
        autoextend OFF,
        '/283data6/oracle/devl/vetsnet_tbl3_4.dbf' size 2048M reuse
        autoextend OFF
    extent management local
    -- default storage (initial 20K  next 20K
    --                  minextents 1  maxextents UNLIMITED
    --                  pctincrease 1)
/

create TEMPORARY tablespace VETSNET_TMP1
    tempfile
        '/283data2/oracle/devl/vetsnet_tmp1.dbf' size 900M reuse
        autoextend OFF
    extent management local
    UNIFORM size 128K
    tablespace group TMPTBSGRP_2
/

-------------------------------

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

set echo off
spool dbmsutil.@.log
@@?/rdbms/admin/dbmsstdx.sql
spool off
set echo on
!sleep 1

set echo on
spool catxdbdv.@.log
@@?/rdbms/admin/catxdbdv.sql
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
connect / as sysdba
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

connect system/M4n4ger$
set echo off
spool catdbsyn-system.log
@@?/rdbms/admin/catdbsyn.sql
spool off

set echo on
spool pupbld.log
@@?/sqlplus/admin/pupbld.sql
spool off

