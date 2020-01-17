
set echo on feedback on trimspool on
spool c_role_fa_user.@.log

CREATE ROLE FA_USER;

grant CREATE VIEW to FA_USER ;

spool off
