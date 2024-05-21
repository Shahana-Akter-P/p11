-- droping tables

DROP TABLE result;
DROP TABLE course;
DROP TABLE instructor;
DROP TABLE students;
DROP TABLE department;

-- Creating tables

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    faculty VARCHAR(100),
    no_of_students INT
);

CREATE TABLE students (
    stud_id INT PRIMARY KEY,
    stud_name VARCHAR(50),
    stud_email VARCHAR(100),
    stud_address VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department (dept_id)
);

CREATE TABLE instructor (
    ins_id INT PRIMARY KEY,
    ins_name VARCHAR(50),
    ins_email VARCHAR(100),
    ins_address VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department (dept_id)
);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits NUMBER(3,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department (dept_id)
);

CREATE TABLE result (
    serial_no INT PRIMARY KEY,
    cgpa NUMBER(3,2),
    stud_id INT,
    FOREIGN KEY (stud_id) REFERENCES students (stud_id)
);


-- ddl -> column add,modify,rename,drop

-- column add
ALTER TABLE instructor ADD salary INT;

-- column modify
ALTER TABLE instructor MODIFY salary VARCHAR(10);

-- column rename
ALTER TABLE instructor RENAME COLUMN salary TO ins_salary;

-- column drop
ALTER TABLE instructor DROP COLUMN ins_salary;


-- data insertion 


-- for department table

INSERT INTO department (dept_id, dept_name, faculty, no_of_students)
VALUES (1, 'CSE', 'EEE', 150);

INSERT INTO department (dept_id, dept_name, faculty, no_of_students)
VALUES (2, 'MSE', 'EEE', 200);

INSERT INTO department (dept_id, dept_name, faculty, no_of_students)
VALUES (3, 'ECE', 'EEE', 100);

INSERT INTO department (dept_id, dept_name, faculty, no_of_students)
VALUES (4, 'MTE', 'ME', 120);

INSERT INTO department (dept_id, dept_name, faculty, no_of_students)
VALUES (5, 'IEM', 'ME', 80);


-- for students table

INSERT INTO students (stud_id, stud_name, stud_email, stud_address, dept_id)
VALUES (101, 'John Doe', 'johndoe@example.com', '123 Main St', 1);

INSERT INTO students (stud_id, stud_name, stud_email, stud_address, dept_id)
VALUES (102, 'Jane Smith', 'janesmith@example.com', '456 Elm St', 2);

INSERT INTO students (stud_id, stud_name, stud_email, stud_address, dept_id)
VALUES (103, 'Alice Johnson', 'alicejohnson@example.com', '789 Oak St', 3);

INSERT INTO students (stud_id, stud_name, stud_email, stud_address, dept_id)
VALUES (104, 'Bob Williams', 'bobwilliams@example.com', '321 Pine St', 4);

INSERT INTO students (stud_id, stud_name, stud_email, stud_address, dept_id)
VALUES (105, 'Sarah Davis', 'sarahdavis@example.com', '654 Maple St', 5);


-- for instructor table

INSERT INTO instructor (ins_id, ins_name, ins_email, ins_address, dept_id)
VALUES (201, 'Michael Johnson', 'michaeljohnson@example.com', '123 Main St', 1);

INSERT INTO instructor (ins_id, ins_name, ins_email, ins_address, dept_id)
VALUES (202, 'Emily Smith', 'emilysmith@example.com', '456 Elm St', 2);

INSERT INTO instructor (ins_id, ins_name, ins_email, ins_address, dept_id)
VALUES (203, 'David Johnson', 'davidjohnson@example.com', '789 Oak St', 3);

INSERT INTO instructor (ins_id, ins_name, ins_email, ins_address, dept_id)
VALUES (204, 'Jessica Williams', 'jessicawilliams@example.com', '321 Pine St', 4);

INSERT INTO instructor (ins_id, ins_name, ins_email, ins_address, dept_id)
VALUES (205, 'Christopher Davis', 'christopherdavis@example.com', '654 Maple St', 5);


-- for course table

INSERT INTO course (course_id, course_name, credits, dept_id)
VALUES (2201, 'Introduction to Computer Science', 3.00, 1);

INSERT INTO course (course_id, course_name, credits, dept_id)
VALUES (2202, 'Business Ethics', 2.50, 2);

INSERT INTO course (course_id, course_name, credits, dept_id)
VALUES (2203, 'Psychology 101', 3.00, 3);

INSERT INTO course (course_id, course_name, credits, dept_id)
VALUES (2204, 'Advanced Calculus', 4.00, 4);

INSERT INTO course (course_id, course_name, credits, dept_id)
VALUES (2205, 'Database Management Systems', 3.50, 5);


-- for result table

INSERT INTO result (serial_no, cgpa, stud_id)
VALUES (1, 3.75, 101);

INSERT INTO result (serial_no, cgpa, stud_id)
VALUES (2, 3.90, 102);

INSERT INTO result (serial_no, cgpa, stud_id)
VALUES (3, 3.60, 103);

INSERT INTO result (serial_no, cgpa, stud_id)
VALUES (4, 3.80, 104);

INSERT INTO result (serial_no, cgpa, stud_id)
VALUES (5, 3.95, 105);
