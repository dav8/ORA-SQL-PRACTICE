--Nugget #10: Using Set Operators

DESC employees;
DESC job_history;

--UNION
SELECT employee_id, department_id, job_id
FROM employees
UNION
SELECT employee_id, department_id, job_id
FROM job_history
ORDER BY employee_id ASC;

--UNION ALL
SELECT employee_id, department_id, job_id
FROM employees
UNION ALL
SELECT employee_id, department_id, job_id
FROM job_history
ORDER BY employee_id ASC;

--INTERSECT
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id ASC;

--MINUS
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id ASC;

COLUMN ph NOPRINT
SELECT 'ball game' AS "ExampleText", 3 ph FROM dual
UNION
SELECT 'to the', 2 ph FROM dual
UNION
SELECT 'Take me out', 1 ph FROM dual
ORDER BY ph;



