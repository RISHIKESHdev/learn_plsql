--1
DECLARE
    v_name emp.ename %TYPE;
    emp_rec emp %ROWTYPE;
    v_number NUMBER:=7369;
    v_date DATE:=SYSDATE;
    v_char VARCHAR(20);
BEGIN
    SELECT * INTO emp_rec FROM emp WHERE empno=v_number;
    dbms_output.put_line('1 Date is:'||v_date||' Employee:'||emp_rec.ename);
END;
--2
DECLARE
    v_sal emp.sal%TYPE;
    v_ename emp.ename%TYPE;
BEGIN
    SELECT ename,sal INTO v_ename,v_sal FROM emp WHERE empno=7369;
    DBMS_OUTPUT.PUT_LINE('2 Employee: '||v_ename||' Salary: '||v_sal);
END;
--3
DECLARE 
    TYPE emp_info IS RECORD(v_ename emp.ename%TYPE,v_sal emp.sal%TYPE);
    emp_rec emp_info;
BEGIN
    SELECT ename,sal INTO emp_rec FROM emp WHERE empno=7369;
--    SELECT * INTO emp_rec FROM emp WHERE sal>1000;
--    dbms_output.put(emp);
    DBMS_OUTPUT.PUT_LINE('3 Employee: '||emp_rec.v_ename||' salary: '||emp_rec.v_sal);
END;
--
