--Nugget #9: Subqueries

SELECT employee_id, first_name, last_name
FROM employees
WHERE salary > 
     (SELECT salary FROM employees WHERE last_name = 'Russell')
ORDER BY employee_id ASC;

SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE job_id =
     (SELECT job_id FROM employees WHERE employee_id = 121);
     
select * from employees;

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE job_id =
     (SELECT job_id FROM employees WHERE employee_id = 188)
AND salary >
     (SELECT salary FROM employees WHERE employee_id = 180);
     
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary =
     (SELECT MAX(salary) FROM employees);
     
--to locate jobs with the highest avg salary
SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) =
     (SELECT MAX(AVG(salary)) FROM employees  GROUP  BY job_id);
     
--multiple-row subqueries
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
WHERE salary IN(7000, 8300,8600);
     

     
     
     
     
     
     
