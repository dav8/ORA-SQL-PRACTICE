--Nugget #5: Single-row functions

select table_name from user_tables;

select * from regions;
select * from locations;
select * from departments;
select * from jobs;

SELECT
job_id, LOWER(job_id), INITCAP(job_id),
job_title, UPPER(job_title)
FROM jobs;

DESCRIBE dual;

SELECT user from dual;

SELECT sysdate from dual;

SELECT LENGTH('Hello world!!!') AS length FROM dual;

select * from jobs;

SELECT job_title,
SUBSTR(job_title, 1, 10),
SUBSTR(job_title, 11)
FROM jobs;

SELECT job_title,
INSTR(job_title, 'Sales') AS Sales_Occur
FROM jobs
ORDER by Sales_Occur DESC;

select table_name from user_tables;
select * from employees;

SELECT CONCAT(first_name, last_name)
FROM employees;

SELECT last_name || ', ' || first_name
FROM employees;

-- View > Snippets

SELECT 314.43235,
ROUND(314.43235, 2),
ROUND(314.43235, 0),
TRUNC(314.43235)
FROM dual;

select * from employees;

SELECT employee_id, first_name, last_name, salary AS Yearly,
ROUND((salary / 12), 2) AS Monthly
FROM employees;

SELECT employee_id, commission_pct,
NVL(NULL,0.2)
FROM employees
WHERE commission_pct IS NULL;

SELECT first_name, last_name, job_id, hire_date,
ROUND(((SYSDATE - hire_date) / 365), 2) AS YearsTenure
FROM employees
ORDER BY YearsTenure DESC;

SELECT MONTHS_BETWEEN('16-MAR-90' , '22-MAY-70')
FROM dual;

SELECT TO_CHAR(1210.73, '$9,999.00')
FROM dual;

SELECT TO_DATE('2010/04/30', 'yyyy/mm/dd')
FROM dual;






