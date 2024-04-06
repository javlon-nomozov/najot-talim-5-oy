-- customers
-- orders
-- categories
-- products
-- students
-- assignments
-- libraries
-- books

-- orderda bitta customer bo'ladi
-- bitta customer da birnechta orderlar bo'lishi mumkin

-- bitta product bitta category ga tegishli bo'ladi
-- bitta categoryda bir nechta products bo'lishi mumkin

-- bitta assignment bitta studentge tegishli bo'lishi mumkin
-- bitta studentda bir nechta assignmentlar bo'lishi mumkin

-- bitta book bitta libraryga tegishli bo'ladi
-- bitta libraryda ko'plab kitoblar bo'ladi

-- bitta book bitta author tomonidan yoziladi
-- bitta authorni birnechta kitobi bo'lishi mumkin

-- customers (mijozlar)
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Inserting demo data for customers
INSERT INTO customers (name, email) VALUES
    ('John Doe', 'john.doe@example.com'),
    ('Jane Doe', 'jane.doe@example.com');


-- orders (buyurtmalar)
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    order_date DATE NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL
);

-- Inserting demo data for orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
    (1, '2024-04-01', 1500.00),
    (2, '2024-04-02', 7501.98);

-- categories (toifalar)
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Inserting demo data for categories
INSERT INTO categories (name) VALUES
    ('Electronics'),
    ('Clothing'),
    ('Books');


-- products (mahsulotlar)
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    category_id INTEGER REFERENCES categories(id)
);
-- Inserting demo data for products
INSERT INTO products (name, price, category_id) VALUES
    ('Laptop', 1200.00, 1),
    ('T-shirt', 25.99, 2),
    ('Programming Book', 49.99, 3);

-- students (o'quvchilar)
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    grade VARCHAR(10) NOT NULL
);
-- Inserting demo data for students
INSERT INTO students (name, grade) VALUES
    ('Alice Johnson', 'Grade 10'),
    ('Bob Smith', 'Grade 11');


-- assignments (vazifalar)
CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    title VARCHAR(255) NOT NULL,
    deadline DATE NOT NULL
);
-- Inserting demo data for assignments
INSERT INTO assignments (student_id, title, deadline) VALUES
    (1, 'Math Homework', '2024-04-10'),
    (2, 'History Essay', '2024-04-15');

-- libraries (kutubxonalr)
CREATE TABLE libraries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);
-- Inserting demo data for libraries
INSERT INTO libraries (name, location) VALUES
    ('Central Library', 'City Center'),
    ('University Library', 'Campus');

-- books (kitoblar)
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INTEGER REFERENCES authors(id),
    library_id INTEGER REFERENCES libraries(id),
    publication_year INTEGER NOT NULL
);
-- Inserting demo data for books
INSERT INTO books (title, author_id, library_id, publication_year) VALUES
    ('Introduction to Algorithms', 1, 1, 2009),
    ('Python Crash Course', 2, 2, 2015);

-- authors (mualliflar)
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
-- Inserting demo data for authors
INSERT INTO authors (name) VALUES
    ('Thomas H. Cormen'),
    ('Eric Matthes');