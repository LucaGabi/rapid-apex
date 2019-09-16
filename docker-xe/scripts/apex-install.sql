-- Must be run as SYS
whenever sqlerror exit sql.sqlcode

-- Unlimit account password expire time
alter profile DEFAULT limit PASSWORD_REUSE_TIME unlimited;
alter profile DEFAULT limit PASSWORD_LIFE_TIME  unlimited;

-- Install APEX
@apexins.sql SYSAUX SYSAUX TEMP /i/

-- APEX REST configuration
-- In APEX 18.2 they're 3 parameters for this file
@apex_rest_config_core.sql @ oracle oracle

-- Required for ORDS install
alter user apex_public_user identified by oracle account unlock;


-- Exit SQL
exit