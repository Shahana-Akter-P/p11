-- view the table

select * from department;
select * from instructor;
select * from students;
select * from course;
select * from result;

-- insert a table row
INSERT INTO department (dept_id, dept_name, faculty, no_of_students)
VALUES (6, 'IEM', 'ME', 80);


-- update a table row
UPDATE students 
SET stud_name = 'Shahana Akter'
WHERE stud_id = 101;

-- delete a table row
DELETE FROM department
WHERE dept_id = 6;


-- like, string operation
SELECT * FROM department WHERE dept_name LIKE '%E%';

-- order by
SELECT * FROM department ORDER BY dept_name;

-- aggregation 

-- count
SELECT COUNT(*) FROM department; 
SELECT COUNT(dept_name) AS number_of_dept FROM department;
SELECT COUNT(DISTINCT dept_name) AS number_of_dept FROM department;

-- group by
SELECT dept_name,AVG(no_of_students) FROM department GROUP BY dept_name;

-- having
SELECT dept_name,AVG(no_of_students) FROM department GROUP BY dept_name HAVING AVG(no_of_students)>100;

-- sum
SELECT SUM(no_of_students) FROM department;

-- max
SELECT MAX(no_of_students) 
FROM department ;

-- min
SELECT MIN(no_of_students) 
FROM department ;

-- avg
SELECT AVG(no_of_students) 
FROM department ;


-- sub-query
SELECT * FROM department where dept_name in (select dept_name FROM department WHERE dept_id=7);


-- join

SELECT dept_name,course_name FROM department NATURAL JOIN course WHERE dept_id=3;
SELECT dept_name,course_name FROM department JOIN course USING(dept_id);
SELECT dept_name,course_name FROM department LEFT OUTER JOIN course USING(dept_id);
SELECT dept_name,course_name FROM department RIGHT OUTER JOIN course USING(dept_id);
SELECT dept_name,course_name FROM department FULL OUTER JOIN course USING(dept_id);


--- union intersect except

-- union
(select course_id
from course
where course_name = 'Introduction to Computer Science' and credits = 3.00)
UNION
(select course_id
from course
where course_name = 'Advanced Calculus' and credits = 4.00);

-- intersect
(select course_id
from course
where course_name = 'Introduction to Computer Science' and credits = 3.00)
INTERSECT
(select course_id
from course
where course_name = 'Advanced Calculus' and credits = 4.00);

-- except
(select course_id
from course
where course_name = 'Introduction to Computer Science' and credits = 3.00)
EXCEPT
(select course_id
from course
where course_name = 'Advanced Calculus' and credits = 4.00);



