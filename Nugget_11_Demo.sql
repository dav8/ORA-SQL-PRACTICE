--Nugget #11: DDL for Tables

CREATE TABLE widgets
(widget_id NUMBER(5),
description VARCHAR(25) NOT NULL,
quantity NUMBER(5));

INSERT INTO widgets
VALUES(1, NULL, 245);

INSERT INTO widgets
VALUES(1, 'description for item 1', 245);

SELECT * FROM widgets;

--practice accessing from another schema

INSERT INTO widgets
VALUES(1, 'duplicate description', 524);

DELETE FROM widgets
WHERE quantity = 524;

ALTER TABLE widgets
ADD CONSTRAINT pkw PRIMARY KEY (widget_id);

INSERT INTO widgets
VALUES(2, 'new description', 700);

--look at SQL Developer table tools

RENAME widgets TO widgets2;

SELECT * FROM widgets;
SELECT * FROM widgets2;

DROP TABLE widgets2;

SELECT object_name, original_name, TYPE
FROM user_recyclebin; --see bin in SQL Developer

FLASHBACK TABLE widgets2 TO BEFORE DROP;

SELECT * FROM widgets2;

CREATE TABLE stuff AS SELECT * FROM all_users;

SELECT * FROM stuff;
SELECT COUNT(*) FROM stuff;

ALTER TABLE stuff
ADD (newcol VARCHAR2(10));

TRUNCATE TABLE stuff REUSE STORAGE;

DESC stuff;

CREATE GLOBAL TEMPORARY TABLE temptable
(ID NUMBER PRIMARY KEY,
DATA VARCHAR2(20))
ON COMMIT PRESERVE ROWS;

INSERT INTO temptable
VALUES(01, 'Data from HR'); --try under SYS account









