--1
set SERVEROUTPUT ON;
DECLARE
    x NUMBER:=0;
BEGIN 
    LOOP
        dbms_output.put_line('Inside Loop: x= '|| TO_CHAR(x));
        x:=x+1;
        CONTINUE WHEN x<3; 
        dbms_output.put_line('Inside Loop after CONTINUE: x= '||TO_CHAR(x));
        EXIT WHEN x=5;
    END LOOP;
    dbms_output.put_line('FINALLY: '||TO_CHAR(x));
END;
--2
set SERVEROUTPUT ON;
DECLARE
    x NUMBER:=0;
BEGIN 
    LOOP
        dbms_output.put_line('Inside Loop: x= '|| TO_CHAR(x));
        x:=x+1;
        IF x<3 THEN CONTINUE; 
        END IF;
        dbms_output.put_line('Inside Loop after CONTINUE: x= '||TO_CHAR(x));
        EXIT WHEN x=5;
    END LOOP;
    dbms_output.put_line('FINALLY: '||TO_CHAR(x));
END;
--3
set SERVEROUTPUT ON;
DECLARE 
    x NUMBER;
BEGIN
    FOR x IN 1..10 LOOP
        dbms_output.put_line(x);
    END LOOP;
END;
--4
set SERVEROUTPUT ON;
DECLARE 
    x NUMBER:=0;
BEGIN 
    WHILE x<11 LOOP
        dbms_output.put_line(x);
        x:=x+1;
    END LOOP;
END;
--