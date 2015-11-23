--Nugget #16: Oracle 11g Security

--log in as SYS

CREATE USER resuser IDENTIFIED BY Pa$$w0rd 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

CREATE USER seluser IDENTIFIED BY Pa$$w0rd 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

CREATE USER dropme IDENTIFIED BY Pa$$w0rd 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

ALTER USER dropme QUOTA 100M ON USERS;

DROP USER dropme;

SELECT username from dba_users
WHERE username = 'DROPME';

--try to connect as resuser

GRANT CONNECT TO resuser;

--test

GRANT RESOURCE TO resuser;

--create objects as resuser, test access with seluser;

CREATE TABLE resuser.testtable (
id NUMBER(4) NOT NULL PRIMARY KEY,
col2 varchar2(20) NOT NULL);

INSERT INTO resuser.testtable
VALUES (001, 'firstrow');

INSERT INTO resuser.testtable
VALUES (002, 'secondrow');

INSERT INTO resuser.testtable
VALUES (003, 'thirdrow');

GRANT SELECT ON resuser.testtable TO seluser;

GRANT INSERT ON resuser.testtable TO seluser;

REVOKE INSERT ON resuser.testtable FROM seluser;

CREATE ROLE basic_dml;

GRANT CONNECT, SELECT ANY TABLE,
INSERT ANY TABLE, UPDATE ANY TABLE,
DELETE ANY TABLE
to basic_dml;

GRANT basic_dml to seluser;


