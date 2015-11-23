--Nugget #7: PL/SQL Basics

--area.sql
DECLARE
     v_rad NUMBER := &s_rad;
     v_area NUMBER;
BEGIN
     v_area := POWER(v_rad, 2) * 3.14;
     DBMS_OUTPUT.PUT_LINE
          ('The area of the circle is: '|| v_area);
END;

--create following function as SYS
CREATE OR REPLACE FUNCTION get_bal(acc_no IN NUMBER) 
   RETURN NUMBER 
   IS acc_bal NUMBER(11,2);
   BEGIN 
      SELECT oe.orders.order_total 
      INTO acc_bal 
      FROM oe.orders 
      WHERE oe.orders.customer_id = acc_no; 
      RETURN(acc_bal); 
    END;
/

SELECT get_bal(170) AS Balance from dual;

SELECT object_name, object_type, status FROM user_objects
WHERE object_type = 'FUNCTION'
AND object_name = 'GET_BAL';

COLUMN text FORMAT a70
SELECT TO_CHAR(line, 99) || '>', text
FROM user_source
WHERE name = 'GET_BAL';
