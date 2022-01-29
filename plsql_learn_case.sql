set SERVEROUTPUT ON;
DECLARE
v_hours_work NUMBER(3):=&Hours_worked;
v_message VARCHAR(100);
BEGIN
    v_message:=
    CASE
        WHEN v_hours_work>40 THEN 'Overtime worked'
        WHEN v_hours_work=40 THEN 'worked full week'
        WHEN v_hours_work BETWEEN 20 AND 40 THEN 'catchup soon'
        WHEN v_hours_work<20 THEN 'need help'
        ELSE 'No comments'
    END;
    dbms_output.put_line(v_message);
END;
--set SERVEROUTPUT ON;
--DECLARE
--v_hours_work NUMBER(3):=&Hours_worked;
--BEGIN
--    CASE
--        WHEN v_hours_work>40 THEN dbms_output.put_line('Overtime worked');
--        WHEN v_hours_work=40 THEN dbms_output.put_line('worked full week');
--        WHEN v_hours_work BETWEEN 20 AND 40 THEN dbms_output.put_line('catchup soon');
--        WHEN v_hours_work<20 THEN dbms_output.put_line('need help');
--        ELSE dbms_output.put_line('No comments');
--    END CASE;
--END;