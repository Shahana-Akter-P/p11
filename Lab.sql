CREATE OR REPLACE PROCEDURE ins(var_cgpa IN NUMBER, var_ins OUT VARCHAR) AS
BEGIN
SELECT ins_name INTO var_ins
FROM instructor
WHERE dept_id IN (
        SELECT dept_id
        FROM students
        WHERE stud_id IN (
            SELECT stud_id
            FROM result
            WHERE cgpa = var_cgpa
        )
);

DBMS_OUTPUT.PUT_LINE('Instructor Name: ' || var_ins);
END;
/

DECLARE
    v_ins_name VARCHAR(100);
BEGIN
   ins(3.75, v_ins_name);
END;
/
