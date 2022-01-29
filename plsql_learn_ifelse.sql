SET SERVEROUTPUt ON;
DECLARE
v_hours_work NUMBER(3):=&Hours_worked;
BEGIN
IF v_hours_work>40
THEN
    dbms_output.put_line('You worked overtime');
ELSIF v_hours_work=40
THEN
    dbms_output.put_line('You worked full week');
ELSIF v_hours_work BETWEEN 20 AND 40
THEN
    dbms_output.put_line('catchup fast');    
--ELSIF v_hours_work<40 AND v_hours_work>20
--THEN
--    dbms_output.put_line('catchup fast');
ELSIF v_hours_work<20
THEN
    dbms_output.put_line('Part time work');
ELSE
    dbms_output.put_line('No comments');
END IF;
END;