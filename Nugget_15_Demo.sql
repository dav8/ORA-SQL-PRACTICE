--Nugget #15: The Delete Statement and TCL

DROP TABLE t1;
DROP TABLE t2;

--Delete

CREATE TABLE t1 (
id number(3) NOT NULL,
data varchar2(10) NOT NULL,
CONSTRAINT t1_pk PRIMARY KEY (id));

CREATE TABLE t2 (
id number(3) NOT NULL PRIMARY KEY,
data varchar2(10) NOT NULL,
rel_id number(3),
CONSTRAINT t2_fk FOREIGN KEY (rel_id) REFERENCES t1(id));

INSERT INTO t1 (id, data)
VALUES (001, 'Blah');

INSERT INTO t1 (id, data)
VALUES (002, 'Foo');

INSERT INTO t1 (id, data)
VALUES (003, 'Bar');

INSERT INTO t2 (id, data, rel_id)
VALUES (101, 'Apple', 001);

INSERT INTO t2 (id, data, rel_id)
VALUES (102, 'Orange', 001);

INSERT INTO t2 (id, data, rel_id)
VALUES (103, 'Banana', 002);

DELETE FROM t1
WHERE id = 001;

SELECT * FROM t1
WHERE id = 001;

DELETE FROM t2
WHERE data ='Banana';

SELECT * FROM t2
WHERE data = 'Banana';

--Transaction Control

TRUNCATE TABLE t1;

INSERT INTO t1 (id, data)
VALUES (001, 'Foo');

INSERT INTO t1 (id, data)
VALUES (002, 'Bar');

--Run SELECT from another user's session

COMMIT;

--Run SELECT from another user's session

SELECT * FROM t1;

INSERT INTO t1 (id, data)
VALUES (003, 'Alpha');

INSERT INTO t1 (id, data)
VALUES (004, 'Omega');

ROLLBACK;

SELECT * FROM t1
ORDER BY id;

INSERT INTO t1 (id, data)
VALUES (005, 'BeforeS01');

SAVEPOINT save01;

INSERT INTO t1 (id, data)
VALUES (006, 'BeforeS02');

SAVEPOINT save02;

INSERT INTO t1 (id, data)
VALUES (007, 'BeforeS03');

SAVEPOINT save03;

ROLLBACK TO save02;

SELECT * FROM t1
ORDER BY id;

COMMIT;

SELECT * FROM t1;



