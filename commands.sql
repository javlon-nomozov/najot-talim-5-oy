-- bitta albomni birnechta artist yozgan bo'lishi mumkin
-- bitta artistni birnechta albomlari bo'lishi mumkin
CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);
CREATE TABLE album(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);
CREATE TABLE artists_album(
  artist_id INT NOT NULL REFERENCES artists(id),
  playlist_id INT NOT NULL REFERENCES album(id)
);
-- bitta konsertda bir nechta artist chiqishi mumkin
-- bitta artistni bir nechta konsetlari bo'lishi mumkin
CREATE TABLE concerts(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  play_date TIMESTAMP NOT NULL
);
CREATE TABLE artists_concerts(
  artist_id INT NOT NULL REFERENCES artists(id),
  concerts_id INT NOT NULL REFERENCES concerts(id)
);
-- bitta talaba birnechta sinflarda o'qishi mumkin
-- bitta sinfda birnechta talabalar o'qishi aniq  :)
-- bitta sinf bitta yo'nalishdagi kursni o'qishi mumkin
CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);
CREATE TABLE courses(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);
CREATE TABLE groups(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  course_id INT NOT NULL REFERENCES courses(id),
  start_date TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
  end_date TIMESTAMP NOT NULL
);
CREATE TABLE students_groups(
  student_id INT NOT NULL REFERENCES students(id),
  group_id INT NOT NULL REFERENCES groups(id),
  joined_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP
);
-- bir xil kitobni kutibxonadan bir nechta talabalar olishi mukin (1 dona emas, 1 xil kitoblar nazarda tutilyabdi) 
-- bitta talabada bir nechta kitoblardan bo'lishi mumkin
CREATE TABLE authors(
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  book_count INT NOT NULL DEFAULT 0
);
CREATE TABLE books(
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  author_id INT NOT NULL REFERENCES authors(id),
  pages INT
);
-- bitta talaba 1 xil kitobdan birnechta ola olmaydi
CREATE TABLE library_record(
  id SERIAL PRIMARY KEY,
  student_id INT NOT NULL REFERENCES students(id),
  book_id INT NOT NULL REFERENCES books(id),
  start_time TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP,
  end_time TIMESTAMP not null,
  UNIQUE (student_id, book_id)
);

-- bitta fan bir nechta yo'nalish (course)larda  o'tilishi mumkin
-- bitta yo'nalishda bir nechta fanlar o'tilishi mumkin
CREATE TABLE subjects(
   id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE courses_subjects(
  course_id INT NOT NULL REFERENCES courses(id),
  subject_id INT NOT NULL REFERENCES subjects(id)
);


-- bitta maxsulotda xar xil categoriyalar bo'lishi mumkin
-- bitta categoriyaga xar xil maxsulotlar tegishli bo'lishi mumkin
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE product_categories (
    id serial PRIMARY KEY,
    product_id INT REFERENCES products(id),
    category_id INT REFERENCES categories(id),
    PRIMARY KEY (product_id, category_id)
);


-- bir xil maxsulot xar xil buyurtmalarda bo'lishi mumkin
-- bitta buyurtmada xar xil maxsulotlar bo'lishi mumkin
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL REFERENCES customers(id)
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT NOT NULL,
    quantity INT NOT NULL
);

-- bitta maxsulotni bir nechta yetkazib beruvchilari bo'lishi mumkin
-- bitta yetkazib beruvchilari  bir nechta maxsulotlarni yetkazib berishi mumkin
CREATE TABLE suppliers (
    id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL
);

CREATE TABLE product_suppliers (
    product_id INT REFERENCES products(id),
    supplier_id INT REFERENCES suppliers(id),
    PRIMARY KEY (product_id, supplier_id)
);


-- bitta hodim birnechta loihalarda ishlashi mumkin
-- bitta projectda birnechta hodimlar ishlashi mumkin
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employee_projects (
    employee_id INT REFERENCES employees(id),
    project_id INT REFERENCES projects(id),
    PRIMARY KEY (employee_id, project_id)
);
