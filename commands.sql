-- bitta maktabda bir nechta o'qituvchilar bo'ladi
-- bitta o'qituvchi bitta maktabda dars beradi
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
  major varchar(100) NOT NULL,
  school_id INT NOT NULL REFERENCES schools(id)
);

-- bitta sinf bitta maktabga tegishli bo'ladi
-- bitta maktabda ko'p  sinflar bo'ladi
-- Classes
CREATE TABLE classes (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  school_id INT NOT NULL REFERENCES schools(id)
);

-- bitta o'quvchi bitta maktabda va bitta sinfda o'qiydi
-- bitta maktabda ko'p  o'quvchi o'qiydi
-- Students
CREATE TABLE students (
  id serial PRIMARY KEY,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  description text
);

-- bitta o'quvchida bir nechta topshiriqlari bo'lishi mumkin
-- bitta topshiriq bitta o'quvchiniki bo'lishi mumkin
-- Subjects
CREATE TABLE subjects (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

-- bitta topshiriq bitta fandan bo'lishi mumkin bitta
-- bitta fandan bir nechta topshiriq bo'lishi mumkin
-- Assignments
CREATE TABLE assignments (
  id serial PRIMARY KEY,
  subject_id INT NOT NULL REFERENCES subjects(id)
);


-- Schools
INSERT INTO schools (name, organized_at) VALUES
('School A', '2022-01-01'),
('School B', '2021-12-15');

-- Teachers
INSERT INTO teachers (first_name, last_name, major, school_id) VALUES
('John', 'Doe', 'Mathematics', 1),
('Jane', 'Smith', 'English', 1),
('Michael', 'Johnson', 'Science', 2);

-- Classes
INSERT INTO classes (name, school_id) VALUES
('Class 1A', 1),
('Class 1B', 1),
('Class 2A', 2);

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