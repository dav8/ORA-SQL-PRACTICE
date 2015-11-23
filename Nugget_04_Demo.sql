--NUGGET #4: RESTRICTING AND SORTING DATA

SELECT table_name FROM user_tables;

SELECT employee_id, first_name, last_name, department_id FROM employees
WHERE department_id = 100;

SELECT * FROM departments
WHERE location_id = 1700;

SELECT employee_id, first_name, last_name FROM employees
WHERE last_name = 'King';

SELECT employee_id, first_name, last_name FROM employees
WHERE last_name = 'King'
AND first_name = 'Janette';

SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary > 14000;

SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary <= 14000;

SELECT employee_id, first_name, last_name, hire_date FROM employees
WHERE hire_date > '01-JAN-07'
ORDER BY hire_date ASC;

SELECT employee_id, first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '01-JAN-07' AND '01-JAN-08';

select * from employees
order by last_name;

SELECT first_name, last_name FROM employees
WHERE last_name BETWEEN 'Chung' AND 'Ozer';

SELECT first_name, last_name FROM employees
WHERE last_name IN ('Chung' , 'Ozer');

SELECT first_name, last_name, manager_id FROM employees
WHERE manager_id IN (101, 103, 123);

SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'S%';

SELECT first_name, last_name FROM employees
WHERE last_name LIKE '%mit%';

select * from employees;

SELECT employee_id, last_name, hire_date FROM employees
WHERE hire_date LIKE '%06'
ORDER BY hire_date;

SELECT employee_id, last_name, commission_pct FROM employees
WHERE commission_pct IS NULL;

SELECT employee_id, last_name, salary FROM employees
WHERE salary > 10000
AND last_name LIKE '%i%';

SELECT employee_id, last_name, salary FROM employees
WHERE salary > 10000
OR last_name LIKE 'S%'
ORDER BY salary ASC;

select * from employees;

--order of precedence
SELECT first_name, last_name, job_id, salary FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'SA_MAN'
AND salary > 10000;

SELECT first_name, last_name, job_id, salary FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'SA_MAN')
AND salary > 10000;

select * from employees;

--Substitution variables
SELECT employee_id, first_name, last_name, salary FROM employees
WHERE employee_id = &eid;

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE job_id = '&jtitle';

select * from employees;

SELECT employee_id, last_name, &&prompt_col FROM employees
ORDER BY &prompt_col; --use department_id

DEFINE eid = 117
SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE employee_id = &eid;

select * from employees;

--from SQL*Plus
SET VERIFY ON
SELECT employee_id, first_name, last_name
FROM employees
WHERE employee_id = &empno;



























