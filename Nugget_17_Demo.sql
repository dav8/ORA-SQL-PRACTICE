--Nugget 17: Data Dictionary
DESC dict;

SELECT * FROM dictionary
ORDER BY table_name;

SELECT table_name, comments
FROM dict
WHERE table_name LIKE '%SEQ%';

DESC all_sequences;

SELECT column_name, comments
FROM dict_columns
WHERE table_name = 'ALL_SEQUENCES';




--Log in as HR user
SELECT object_name, created,
last_ddl_time, status
FROM user_objects;

SELECT constraint_name, constraint_type,
status, table_name
FROM user_constraints;

--Dynamic Performance Views

--view currently connected users
SELECT sid, serial#, username, osuser, machine
FROM V$SESSION
WHERE username IS NOT NULL;

SELECT * FROM v$controlfile;

SELECT * FROM v$instance;

SELECT * FROM v$database;

SELECT * FROM V$process;

SELECT * FROM V$parameter;





