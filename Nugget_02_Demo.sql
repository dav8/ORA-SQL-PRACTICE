-- NUGGET #2: SQL*Plus

sqlplus /nolog

connect hr

SHOW USER;

exit

sqlplus / as sysdba

SHOW USER;

exit

sqlplus hr@orcl

exit

sqlplus hr/password@orcl

define

select department_id, department_name
from departments;

edit

/ (list)

select employee_id,
first_name,
last_name,
email,
phone_number
FROM employees;

column last_name format a12;

/

column email format a10;

/

set pagesize 0

clear columns

/

help index

help connect







