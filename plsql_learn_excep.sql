--1
SET SERVEROUTPUT ON
DECLARE
    emp_rec emp%ROWTYPE;
BEGIN
    SELECT * INTO emp_rec FROM emp;
    DBMS_OUTPUT.PUT_LINE('Employee: '||emp_rec.ename);
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('To many rows found');
END;
--2
SET SERVEROUTPUT ON