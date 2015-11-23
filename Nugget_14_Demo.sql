--Nugget #14 - INSERT and UPDATE

SELECT * FROm departments;

--The INSERT Statement
INSERT INTO departments
(department_id, department_name, manager_id,
location_id)
VALUES
(280, 'Maintenance', 204, 2700);

INSERT INTO departments
(department_id, department_name, manager_id,
location_id)
VALUES
(290, 'NewDept', 201, 1700);

INSERT INTO departments
VALUES
(300, 'Research', 145, 1700);

INSERT INTO departments
(department_id, location_id, department_name,manager_id)
VALUES
(310, 145, '310Dept', 1700); -- fails

INSERT INTO departments
VALUES
(240, 'Research', 1700);

INSERT INTO dept_new
SELECT department_id, department_name,location_id
FROM departments;



--The UPDATE Statement

DESC employees;

UPDATE employees
SET last_name = 'Stuart'
WHERE last_name = 'Greenberg';
--might try employee_id = 108 too

SELECT * from employees WHERE employee_id =100;

UPDATE employees
SET phone_number = '515.127.0002',
hire_date = '22-MAY-11'
WHERE employee_id = 100;

UPDATE employees
SET email = LOWER(email);  --Oracle functions!

SELECT * FROM employees;

commit;




