--Nugget #19: Flashback

--Flashback Query: perform actions as HR user

CREATE TABLE testtable (
col1 number(3),
col2 varchar2(20));

INSERT INTO testtable
VALUES (001, 'watermelon');

INSERT INTO testtable
VALUES (002, 'mango');

INSERT INTO testtable
VALUES (003, 'blackberry');

INSERT INTO testtable
VALUES (004, 'banana');

INSERT INTO testtable
VALUES (005, 'orange');

INSERT INTO testtable
VALUES (006, 'apple');

SELECT * FROM testtable;

COMMIT;

SELECT COUNT(*) FROM testtable;

DELETE FROM testtable --deletes all rows

COMMIT;

SELECT COUNT(*) FROM testtable;

--query as of

CREATE TABLE ttrestore
AS SELECT * FROM testtable
AS OF TIMESTAMP (SysDate - 5/1440);

--alternative formulation with timestamp

CREATE TABLE ttrestore
AS SELECT * FROM testtable
AS OF TIMESTAMP TO_TIMESTAMP('08-Aug-2011 5:00:00 PM',
                             'DD-MON-YYYY HH:MI:SS AM');

SELECT COUNT(*) FROM ttrestore;

SELECT * FROM ttrestore;

DELETE FROM ttrestore
WHERE col2 = 'apple';

COMMIT;

SELECT * FROM ttrestore
AS OF TIMESTAMP TO_TIMESTAMP('08-Aug-2011 8:40:00 PM',
                             'DD-MON-YYYY HH:MI:SS AM')
WHERE col2 = 'apple';

--Flashback Table

DROP TABLE ttrestore CASCADE CONSTRAINTS;

SELECT * FROM ttrestore;

SELECT * FROM recyclebin; --syn is recyclebin

FLASHBACK TABLE ttrestore --check GUI as well
TO BEFORE DROP;

SELECT * FROM ttrestore; --referential constraints not restored!






