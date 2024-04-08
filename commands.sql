-- bitta maktabda bir nechta o'qituvchilar bo'ladi
-- bitta o'qituvchi bitta maktabda dars beradi

create table shools(
  id serial PRIMARY KEY,
  name NOT NULL varchar(150),
  organized_at NOT NULL DATE DEFAULT CURRENT_DATE
);

create table teachers(
  id serail PRIMARY KEY,
  first_name NOT NULL varchar(100),
  last_name NOT NULL varchar(100),
  major NOT NULL varchar(100),
  school_id NOT NULL INT REFERENCES shools(id)
);

-- bitta sinf bitta maktabga tegishli bo'ladi
-- bitta maktabda ko'p  sinflar bo'ladi
create table classes(
  id serail PRIMARY KEY,
  name NOT NULL varchar(100),
  school_id NOT NULL INT REFERENCES shools(id)
);

-- bitta o'quvchi bitta maktabda va bitta sinfda o'qiydi
-- bitta maktabda ko'p  o'quvchi o'qiydi
create table students(
  id serail PRIMARY KEY,
  first_name NOT NULL varchar(100),
  last_name NOT NULL varchar(100),
  description text
);

-- bitta o'quvchida bir nechta topshiriqlari bo'lishi mumkin
-- bitta topshiriq bitta o'quvchiniki bo'lishi mumkin
CREATE TABLE subjects(
  id serail PRIMARY KEY,
  name NOT NULL varchar(100)
);

-- bitta topshiriq bitta fandan bo'lishi mumkin bitta
-- bitta fandan bir nechta topshiriq bo'lishi mumkin
CREATE TABLE assignment(
  id serail PRIMARY KEY,
  subject_id INT NOT NULL REFERENCES subjects(id)
);

