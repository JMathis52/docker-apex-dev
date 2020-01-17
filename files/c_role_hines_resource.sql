
set echo on feedback on trimspool on
spool c_role_hines_resource.@.log

CREATE ROLE HINES_RESOURCE;

grant CREATE CLUSTER   to HINES_RESOURCE ;
grant CREATE INDEXTYPE to HINES_RESOURCE ;
grant CREATE OPERATOR  to HINES_RESOURCE ;
grant CREATE PROCEDURE to HINES_RESOURCE ;
grant CREATE SEQUENCE  to HINES_RESOURCE ;
grant CREATE SESSION   to HINES_RESOURCE;
grant CREATE SNAPSHOT  to HINES_RESOURCE;
grant CREATE SYNONYM   to HINES_RESOURCE;
grant CREATE TABLE     to HINES_RESOURCE ;
grant CREATE TRIGGER   to HINES_RESOURCE ;
grant CREATE TYPE      to HINES_RESOURCE ;
grant CREATE VIEW      to HINES_RESOURCE ;


spool off
