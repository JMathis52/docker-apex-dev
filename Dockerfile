FROM oraclelinux:latest

LABEL "Daniel Hochleitner"=<dhochleitner@posteo.de>

# environment variables
ENV INSTALL_APEX=true \
    INSTALL_SQLCL=false \
    INSTALL_SQLDEVWEB=false \
    INSTALL_LOGGER=false \
    INSTALL_OOSUTILS=false \
    INSTALL_AOP=false \
    INSTALL_SWAGGER=false \
    INSTALL_CA_CERTS_WALLET=false \
    DB_INSTALL_VERSION=19 \
    # Oracle Database Variables
    ORACLE_BASE=/u01/app/oracle \
    ORACLE_SID=orcl \
    SERVICE_NAME=orcl \
    ORACLE_HOME12=/u01/app/oracle/product/12.2.0.1/dbhome \
    ORACLE_HOME18=/u01/app/oracle/product/18.0.0/dbhome \
    ORACLE_HOME19=/u01/app/oracle/product/19.0.0/dbhome \
    ORACLE_INVENTORY=/u01/app/oraInventory \
    DBCA_TOTAL_MEMORY=4096 \
    CHARACTER_SET=US7ASCII \
    PASS=oracle \
    ORDS_HOME=/u01/ords \
    JAVA_HOME=/opt/java \
    TOMCAT_HOME=/opt/tomcat \
    APEX_PASS=Oradoc1! \
    APEX_ADDITIONAL_LANG= \
    TIME_ZONE=UTC

# copy all scripts
COPY scripts /scripts/

# copy all files
COPY files /files/

# image setup via shell script to reduce layers and optimize final disk usage
RUN /scripts/install_main.sh

# ssh, database and apex port
EXPOSE 22 1521 8080

# use ${ORACLE_BASE} without product subdirectory as data volume
VOLUME ["${ORACLE_BASE}"]

# entrypoint for database creation, startup and graceful shutdown
ENTRYPOINT ["/scripts/entrypoint.sh"]
