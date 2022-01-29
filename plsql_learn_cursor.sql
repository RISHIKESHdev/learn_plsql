--Implicite cursor
SET SERVEROUTPUT ON;
DECLARE
    v_row_count number:=0;
BEGIN
    UPDATE emp SET sal=sal*1.1 WHERE deptno=10;
    IF SQL%FOUND THEN
        dbms_output.put_line('Updated ROws: '|| SQL%ROWCOUNT);
    END IF;
    IF SQL%NOTFOUND THEN
        dbms_output.put_line('No update Recorded');
    END If;
END;
--Explicit cursor
--Method 1
SET SERVEROUTPUT ON;
DECLARE
    CURSOR emp_cur is SELECT * FROM emp;
    emp_rec emp%ROWTYPE;
BEGIN
    OPEN emp_cur;
    fetch emp_cur into emp_rec;
    WHILE emp_cur%FOUND
        LOOP
            dbms_output.put_line('ename= '||emp_rec.ename);
            fetch emp_cur into emp_rec;
        END LOOP;
    CLOSE emp_cur;
END;
--Method 2
SET SERVEROUTPUT ON;
DECLARE
    CURSOR emp_cur is SELECT * FROM emp;
    emp_rec emp_cur%ROWTYPE;
BEGIN
    OPEN emp_cur;
    fetch emp_cur into emp_rec;
    WHILE emp_cur%FOUND
        LOOP
            dbms_output.put_line('ename= '||emp_rec.ename);
            fetch emp_cur into emp_rec;
        END LOOP;
    CLOSE emp_cur;
END;
--Method 3
SET SERVEROUTPUT ON;
DECLARE
    CURSOR emp_cur is SELECT ename FROM emp;
BEGIN
    FOR emp_rec in emp_cur 
    LOOP
        dbms_output.put_line('ename= '||emp_rec.ename);
    END LOOP;
END;
--