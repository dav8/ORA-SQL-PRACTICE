-- NUGGET #3: THE SELECT STATEMENT

SELECT * FROM departments;

DESCRIBE departments;

SELECT department_id, department_name FROM departments;

DESCRIBE employees;

SELECT employee_id, first_name, last_name, salary, salary * 2 AS adjsal
FROM employees;

--from SQLPLUS COLUMN salary FORMAT $99,999.99;

SELECT employee_id, first_name || last_name from employees;

SELECT employee_id, first_name || ' ' || last_name
from employees;

SELECT * FROM departments;

SELECT DISTINCT location_id
FROM departments;

--create and run script file
CREATE TABLE testtable (
col1 number(2),
col2 varchar2(20));
