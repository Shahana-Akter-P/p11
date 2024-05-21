SET SERVEROUTPUT ON

-- procedure

CREATE OR REPLACE PROCEDURE proc(var1 IN NUMBER,var2  OUT VARCHAR) AS
t_show CHAR(30);
BEGIN
t_show:='From procedure: ';
SELECT  course_name INTO var2 FROM course WHERE course_id=var1 ;  
DBMS_OUTPUT.PUT_LINE(t_show || var2 ||' is '|| var1);
END;
/

-- function

CREATE OR REPLACE FUNCTION fun(var1 IN VARCHAR) RETURN VARCHAR AS
value department.dept_name%TYPE;
BEGIN
SELECT dept_name INTO value FROM department WHERE dept_id=var1; 
RETURN VALUE;
END;
/


DECLARE
new_course_name course.course_name%TYPE;
DEPT_name department.dept_name%TYPE;
stud_num students.stud_name%TYPE;
value department.dept_name%TYPE;
counter2 NUMBER;
TYPE NAMEARRAY IS VARRAY(5) OF course.course_name%TYPE;  
A_NAME NAMEARRAY:=NAMEARRAY();
counter NUMBER;

BEGIN
DBMS_OUTPUT.PUT_LINE('DEPT_name: ');
SELECT dept_name INTO DEPT_name FROM department WHERE dept_name='CSE';
DBMS_OUTPUT.PUT_LINE(DEPT_name);
counter:=101;
counter2:=1;
DBMS_OUTPUT.PUT_LINE('Student_name: ');

FOR counter IN 101..105  
LOOP
SELECT stud_name INTO stud_num FROM students WHERE stud_id=counter;
A_NAME.EXTEND();
A_NAME(counter2):=stud_num;
counter2:=counter2+1;

IF stud_num='Shahana Akter'  
THEN
DBMS_OUTPUT.PUT_LINE(stud_num||'101');
ELSIF stud_num='Jane Smith'  
THEN
DBMS_OUTPUT.PUT_LINE(stud_num||'102');
ELSE 
DBMS_OUTPUT.PUT_LINE(stud_num||'others');
END IF;

DBMS_OUTPUT.PUT_LINE(stud_num);
END LOOP;

counter2:=1;
DBMS_OUTPUT.PUT_LINE('Loop: ');
WHILE counter2<=A_NAME.COUNT  
LOOP 
DBMS_OUTPUT.PUT_LINE(A_NAME(counter2)); 
counter2:=counter2+1;
END LOOP;
  
proc(2202,new_course_name); 
value:=fun(5);
DBMS_OUTPUT.PUT_LINE('function value: ' || value);
END;
/


-- cursor

DECLARE
d_name department.dept_name%Type;
cursor c is
SELECT dept_name INTO d_name FROM department WHERE no_of_students=200;
BEGIN
DBMS_OUTPUT.PUT_LINE('dept Name where no of students is 200: '); 
IF NOT c%ISOPEN
THEN
OPEN c;
END IF;
LOOP
FETCH c into d_name;
EXIT WHEN c%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('dept Name=' || c%ROWCOUNT||':'||d_name);
END LOOP;
CLOSE c;
END;
/


DECLARE
CURSOR cur IS SELECT * FROM department;
dept_row department%ROWTYPE;
BEGIN
OPEN cur;
FETCH cur INTO dept_row.dept_id,dept_row.dept_name,dept_row.faculty,dept_row.no_of_students;
WHILE cur%FOUND LOOP
DBMS_OUTPUT.PUT_LINE('DEPT_id: '||dept_row.dept_id|| ' DEPT_name: '||dept_row.dept_name || ' faculty: ' ||dept_row.faculty|| ' no_of_students: '||dept_row.no_of_students);
DBMS_OUTPUT.PUT_LINE('Row count: '|| cur%rowcount);
FETCH cur INTO dept_row.dept_id,dept_row.dept_name,dept_row.faculty,dept_row.no_of_students;
END LOOP;
CLOSE cur;
END;
/


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
