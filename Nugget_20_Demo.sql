--Nugget #20: SQL Optimization

--Bind Variables
SELECT first_name, last_name, salary FROM employees
WHERE employee_id = :employee_id; --100

CREATE OR REPLACE PROCEDURE salbump(empid IN NUMBER)
AS BEGIN
  UPDATE employees SET salary = salary * 2
  WHERE employee_id = empid;
  COMMIT;
END;
/

EXEC salbump(110);

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE employee_id = :emplid;

--Execution Plans
EXPLAIN PLAN FOR
SELECT last_name FROM employees;

EXPLAIN PLAN
SET statement_id = 'testplan1' FOR
SELECT phone_number FROM employees
WHERE phone_number LIKE '650%';

EXPLAIN PLAN
SET statement_id = 'testplan2' FOR
SELECT last_name FROM employees
WHERE last_name LIKE 'Pe%';

--Use GUI Explain Plan
SELECT e.last_name, e.hire_date
FROM hr.employees e JOIN hr.job_history h
ON
(e.hire_date BETWEEN h.start_date AND h.end_date)
AND
h.employee_id = 122;

--Query Hints
SELECT /*+ LEADING(e2 e1) USE_NL(e1) INDEX(e1 emp_emp_id_pk) 
           USE_MERGE(j) FULL(j) */
    e1.first_name, e1.last_name, j.job_id, sum(e2.salary) total_sal
  FROM employees e1, employees e2, job_history j
  WHERE e1.employee_id = e2.manager_id
    AND e1.employee_id = j.employee_id
    AND e1.hire_date = j.start_date
  GROUP BY e1.first_name, e1.last_name, j.job_id
  ORDER BY total_sal;

