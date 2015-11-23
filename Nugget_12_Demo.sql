-- Nugget #12: Views and Sequences

CREATE SEQUENCE seqbyone
START WITH 1 NOCACHE;

CREATE SEQUENCE seqbyhundred
INCREMENT BY 100
START WITH 100
NOCACHE;

SELECT seqbyone.NEXTVAL FROM dual; --run multiple times

SELECT seqbyhundred.NEXTVAL FROM dual;

CREATE TABLE t_test(
 ID INTEGER PRIMARY KEY,
 colname VARCHAR(10));
 
INSERT INTO t_test(ID,colname)
 VALUES (seqbyhundred.nextval,'First');
INSERT INTO t_test(ID,colname)
 VALUES (seqbyhundred.nextval,'Second');
SELECT * FROM t_test;

--VIEWS
SELECT * FROM employees
order by department_id;

CREATE VIEW empd50
AS SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE department_id = 50;

DESCRIBE empd50;

SELECT * from empd50 order by hire_date;

CREATE OR REPLACE VIEW empd50
AS SELECT employee_id, first_name, last_name, hire_date, salary*12 ANNUAL_SALARY
FROM employees
WHERE department_id = 50
WITH CHECK OPTION;

SELECT * FROM empd50;

select * from departments;

CREATE OR REPLACE VIEW salary_analysis
(ID, deptname, minsalary, maxsalary)
AS SELECT d.department_id, d.department_name,
MIN(e.salary), MAX(e.salary)
FROM employees e INNER JOIN departments d
ON (e.department_id = d.department_id)
GROUP BY d.department_id, d.department_name;

SELECT * FROM salary_analysis;

CREATE OR REPLACE VIEW empd50
AS SELECT employee_id, department_id, first_name, last_name, hire_date, salary*12 ANNUAL_SALARY
FROM employees
WHERE department_id = 50
WITH CHECK OPTION;

SELECT * FROM empd50;

UPDATE empd50
SET department_id = 90
WHERE employee_id = 120;

UPDATE empd50
SET department_id = 50
WHERE employee_id = 200;

SELECT * FROM empd50
WHERE employee_id = 200;

CREATE OR REPLACE VIEW empd50
AS SELECT employee_id, department_id, first_name, last_name, hire_date, salary*12 ANNUAL_SALARY
FROM employees
WHERE department_id = 50
WITH READ ONLY;

DELETE FROM empd50
WHERE annual_salary > 90000;

DROP VIEW empd50;


*****************************

--Nugget #12: Sequences and Views

CREATE TABLE T6 (
id NUMBER(3) NOT NULL PRIMARY KEY,
col1 VARCHAR2(20) NOT NULL,
col2 NUMBER(3),
CONSTRAINT col2_chk2 CHECK (col2 BETWEEN 1 AND 100));

CREATE TABLE T7 (
id NUMBER(3) NOT NULL PRIMARY KEY,
column01 VARCHAR2(20) NOT NULL);



--Sequences
CREATE SEQUENCE SEQ_INT_BY1
INCREMENT BY 1 START WITH 1 MINVALUE 1;

CREATE SEQUENCE SEQ_TESTSEQUENCE
INCREMENT BY 100 START WITH 1000 
MAXVALUE 100000 MINVALUE 1000 CACHE 20;

RENAME SEQ_TESTSEQUENCE to SEQ_JUNKME;

DROP SEQUENCE SEQ_JUNKME;

INSERT INTO T6 VALUES (SEQ_INT_BY1.NEXTVAL, 'foo', 20);
INSERT INTO T6 VALUES (SEQ_INT_BY1.NEXTVAL, 'bar', 90);
INSERT INTO T6 VALUES (SEQ_INT_BY1.NEXTVAL, 'barfoo', 50);

SELECT * FROM T6;

INSERT INTO T7 VALUES (SEQ_INT_BY1.NEXTVAL, 'spam');

SELECT * FROM T7; --look at the next value!

--Show sequence creator in SQL Developer

--Views

























