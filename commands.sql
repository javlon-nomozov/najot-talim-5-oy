-- Schools
CREATE TABLE schools (
  id serial PRIMARY KEY,
  name varchar(150) NOT NULL,
  organized_at DATE DEFAULT CURRENT_DATE NOT NULL
);

-- Teachers
CREATE TABLE teachers (
  id serial PRIMARY KEY,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  major varchar(100) NOT NULL
);

-- Classes
CREATE TABLE classes (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  teacher_id INT REFERENCES teachers(id)
);

-- Students
CREATE TABLE students (
  id serial PRIMARY KEY,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  description text
);

-- Subjects
CREATE TABLE subjects (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

-- Assignments
CREATE TABLE assignments (
  id serial PRIMARY KEY,
  subject_id INT REFERENCES subjects(id)
);


-- Schools
INSERT INTO schools (name, organized_at) VALUES
('School A', '2022-01-01'),
('School B', '2021-12-15');

-- Teachers
INSERT INTO teachers (first_name, last_name, major) VALUES
('John', 'Doe', 'Mathematics'),
('Jane', 'Smith', 'English'),
('Michael', 'Johnson', 'Science');

-- Classes
INSERT INTO classes (name, teacher_id) VALUES
('Class 1A', 1),
('Class 1B', 1),
('Class 2A', 3);

-- Students
INSERT INTO students (first_name, last_name, description) VALUES
('Alice', 'Doe', 'Lorem ipsum dolor sit amet.'),
('Bob', 'Smith', 'Consectetur adipiscing elit.'),
('Charlie', 'Johnson', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');

-- Subjects
INSERT INTO subjects (name) VALUES
('Math'),
('English'),
('Science');

-- Assignments
INSERT INTO assignments (subject_id) VALUES
(1),
(2),
(3);


-- 1 Barcha o'qituvchilarni sinflari bilan olish
SELECT t.*, c.name AS class_name
FROM teachers t
LEFT JOIN classes c ON t.id = c.teacher_id;

-- 2 Barcha o'qituvchilarni INNER JOIN bilan mos keladigan sinflari bilan olish
SELECT t.*, c.name AS class_name
FROM teachers t
INNER JOIN classes c ON t.id = c.teacher_id;

-- 3 Tayinlangan barcha sinflarni va ularning muallimlarini RIGHT JOIN bilan olish
SELECT c.*, t.first_name, t.last_name
FROM classes c
RIGHT JOIN teachers t ON c.teacher_id = t.id;


-- 4 Tayinlangan barcha talabalarini, ularning muayyan sinflarini va muallimlarini INNER JOIN va bir nechta JOINlar bilan olish:
SELECT st.*, c.name AS class_name, t.first_name AS teacher_first_name, t.last_name AS teacher_last_name
FROM students st
INNER JOIN classes c ON st.id = c.teacher_id
INNER JOIN teachers t ON c.teacher_id = t.id;

-- 5 Manba joylashgan barcha vazifalarni INNER JOIN bilan olish:
SELECT a.*, s.name AS subject_name
FROM assignments a
INNER JOIN subjects s ON a.subject_id = s.id;
