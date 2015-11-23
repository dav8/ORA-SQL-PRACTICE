--Nugget #6: Reporting Aggregated Data Using Group Functions

select * from employees;

SELECT AVG(salary) FROM employees;

SELECT MIN(salary) FROM employees;

SELECT MAX(salary) FROM employees;

SELECT SUM(salary) FROM employees;

SELECT COUNT(*) FROM employees;

SELECT AVG(salary), MIN(salary), MAX(salary)
FROM employees
WHERE job_id LIKE '%CLERK%';

SELECT COUNT(department_id) FROM employees;

SELECT COUNT(DISTINCT department_id) FROM employees;

SELECT AVG(commission_pct),
AVG(NVL(commission_pct, 0)) --forces fx to include NULLs
FROM employees;

SELECT department_id, ROUND(AVG(salary), 2) AS AvgSalary
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

SELECT department_id AS DeptID,
job_id AS JobID,
TRUNC(AVG(salary)) AS SalaryAvg
FROM employees
GROUP BY department_id, job_id;

SELECT department_id, AVG(salary) FROM employees
GROUP BY department_id
HAVING AVG(salary) > 9000
ORDER BY department_id;

select * from employees;

SELECT job_id AS JobID, SUM(salary) AS SalarySum
FROM employees
WHERE job_id LIKE '%CLERK%'
GROUP BY job_id
HAVING SUM(salary) > 11000
ORDER BY SUM(salary);

















