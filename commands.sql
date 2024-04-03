-- Users
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR NOT NULL UNIQUE,
  email VARCHAR NOT NULL UNIQUE,
  password VARCHAR NOT NULL CHECK(length(password)>6)
);
-- insert commands
INSERT INTO users (username, email, password) VALUES
('user1', 'user1@example.com', 'password'),
-- ('user-error', 'user-error@example.com', 'pas'), -- returns error
('user2', 'user2@example.com', 'password2');
-- insert multiple values //
INSERT INTO users (username, email, password) VALUES
('user3', 'user3@example.com', 'password3'),
('user4', 'user4@example.com', 'password4'),
('user5', 'user5@example.com', 'password5');


-- Products
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL NOT NULL,
  quantity INT NOT NULL
);
-- insert commands
INSERT INTO products (name, description, price, quantity) VALUES
('Mahsulot 1', 'Mahsulot 1 uchun tavsif', 19.99, 100),
('Mahsulot 2', 'Mahsulot 2 uchun tavsif', 29.99, 50),
('Mahsulot 3', 'Mahsulot 3 uchun tavsif', 9.99, 200),
('Mahsulot 4', 'Mahsulot 4 uchun tavsif', 39.99, 75),
('Mahsulot 5', 'Mahsulot 5 uchun tavsif', 49.99, 120);


-- Orders
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  product_id INT NOT NULL REFERENCES products(id),
  product_count INT NOT NULL,
  total_amount DECIMAL NOT NULL
);
-- insert commands
INSERT INTO orders (user_id, product_id, product_count, total_amount) VALUES
(1, 1, 2, 39.98),
(2, 3, 1, 9.99),
(3, 2, 3, 89.97),
(1, 5, 1, 49.98),
(5, 4, 2, 79.98);


-- Categories
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT NOT NULL
);
-- insert commands
INSERT INTO categories (name, description) VALUES
('Kategoriya 1', 'Kategoriya 1 uchun tavsif'),
('Kategoriya 2', 'Kategoriya 2 uchun tavsif'),
('Kategoriya 3', 'Kategoriya 3 uchun tavsif'),
('Kategoriya 4', 'Kategoriya 4 uchun tavsif'),
('Kategoriya 5', 'Kategoriya 5 uchun tavsif');


-- Authors
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  bio TEXT NOT NULL
);
-- insert commands
INSERT INTO authors (name, bio) VALUES
('Muallif 1', 'Muallif 1 hayoti'),
('Muallif 2', 'Muallif 2 hayoti'),
('Muallif 3', 'Muallif 3 hayoti'),
('Muallif 4', 'Muallif 4 hayoti'),
('Muallif 5', 'Muallif 5 hayoti');


-- Comments
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  product_id INT NOT NULL REFERENCES products(id),
  comment_text TEXT NOT NULL
);
-- insert commands
INSERT INTO comments (user_id, product_id, comment_text) VALUES
(1, 1, 'Bu Mahsulot 1 uchun izoh.'),
(2, 3, 'Mahsulot 3 haqida izoh.'),
(3, 2, 'Ajoyib mahsulot!'),
(4, 5, 'Yaxshi buyurtma.'),
(5, 4, 'Mahsulot 4 ham ajoyib!');


-- Books
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  author_id INT NOT NULL REFERENCES authors(id),
  category_id INT NOT NULL REFERENCES categories(id),
  price DECIMAL NOT NULL,
  publication_date DATE,
  description TEXT
);
-- insert commands
INSERT INTO books (title, author_id, category_id, price, publication_date, description) VALUES
('Kitob 1', 1, 1, 29.99, '2023-01-01', 'Kitob 1 uchun tavsif'),
('Kitob 2', 2, 2, 39.99, '2022-06-15', 'Kitob 2 uchun tavsif'),
('Kitob 3', 3, 3, 19.99, '2022-12-20', 'Kitob 3 uchun tavsif'),
('Kitob 4', 4, 4, 49.99, '2023-03-10', 'Kitob 4 uchun tavsif'),
('Kitob 5', 5, 5, 59.99, '2023-08-05', 'Kitob 5 uchun tavsif');


-- Permissions
CREATE TABLE permissions (
  id SERIAL PRIMARY KEY,
  role_id INT NOT NULL,
  resource_id INT NOT NULL,
  resource_type VARCHAR NOT NULL,
  permission_type VARCHAR NOT NULL
);
-- insert commands
INSERT INTO permissions (role_id, resource_id, resource_type, permission_type) VALUES
(1, 1, 'user', 'read'),
(2, 2, 'product', 'write'),
(3, 3, 'order', 'read'),
(4, 4, 'category', 'write'),
(5, 5, 'author', 'read');


-- Roles
CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  description TEXT
);
-- insert commands
INSERT INTO roles (name, description) VALUES
('Admin', 'Toliq kirish huquqi bilan administrator roli'),
('Menejer', 'Cheklanmagan kirish huquqi bilan menejer roli'),
('Foydalanuvchi', 'Standart foydalanuvchi roli'),
('Muhrim', 'Kontentni tahrirlash uchun roli'),
('Ko`rishuvchi', 'Faqat ko`rish huquqiga ega roli');


-- Addresses
CREATE TABLE addresses (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  street_address VARCHAR NOT NULL,
  city VARCHAR NOT NULL,
  state VARCHAR NOT NULL,
  country VARCHAR NOT NULL,
  postal_code VARCHAR NOT NULL
);
-- insert commands
INSERT INTO addresses (user_id, street_address, city, state, country, postal_code) VALUES
(1, '123 Taxtapul tor ko`cha', 'Shayxontohur', 'Toshkent', 'Uzbekistan', '100011'),
(2, '456 Labzak', 'Shayxontohur', 'Toshkent', 'Uzbekistan', '67890'),
(3, '789 YYY ko`cha', 'Shahar3', 'Viloyat3', 'Uzbekistan', '54321'),
(4, '321 XXX ko`cha', 'Shahar4', 'Viloyat4', 'Uzbekistan', '09876'),
(5, '654 ZZZ ko`cha', 'Shahar5', 'Viloyat5', 'Uzbekistan', '13579');


-- Payments
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  order_id INT NOT NULL REFERENCES orders(id),
  payment_date DATE,
  amount DECIMAL NOT NULL,
  payment_method VARCHAR NOT NULL,
  transaction_id VARCHAR UNIQUE,
  status VARCHAR DEFAULT 'pending'
);
-- insert commands
INSERT INTO payments (order_id, payment_date, amount, payment_method, transaction_id, status) VALUES
(1, '2024-03-01', 39.98, 'Credit Card', '1234567890', 'completed'),
(2, '2024-03-02', 9.99, 'PayMe', '0987654321', 'completed'),
(3, '2024-03-03', 89.97, 'Credit Card', '2345678901', 'completed'),
(4, '2024-03-04', 49.99, 'Click', '3456789012', 'pending'),
(5, '2024-03-05', 79.98, 'PayMe', '4567890123', 'completed');


-- Reviews
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  product_id INT NOT NULL REFERENCES products(id),
  rating DECIMAL NOT NULL,
  review_text TEXT
);
-- insert commands
INSERT INTO reviews (user_id, product_id, rating, review_text) VALUES
(1, 1, 4.5, 'Ajoyib mahsulot, tavsiya etiladi!'),
(2, 3, 3.8, 'Yaxshi sifatli, lekin yaxshilab yaxshilab qilish mumkin.'),
(3, 2, 5.0, 'Ajoyib mahsulot, umuman kutilganlar!'),
(4, 5, 4.0, 'Yaxshi mahsulot, xaridni bajarilgan.'),
(5, 4, 4.2, 'Mahsulot 4 juda ajoyib, yana xarid qilaman!');


-- Tags
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  description TEXT
);
-- insert commands
INSERT INTO tags (name, description) VALUES
('Teg1', 'Teg1 uchun tavsif'),
('Teg2', 'Teg2 uchun tavsif'),
('Teg3', 'Teg3 uchun tavsif'),
('Teg4', 'Teg4 uchun tavsif'),
('Teg5', 'Teg5 uchun tavsif');


-- Images
CREATE TABLE images (
  id SERIAL PRIMARY KEY,
  product_id INT NOT NULL REFERENCES products(id),
  image_url VARCHAR NOT NULL,
  alt_text VARCHAR
);
-- insert commands
INSERT INTO images (product_id, image_url, alt_text) VALUES
(1, 'image1.jpg', 'Image for Product 1'),
(2, 'image2.jpg', 'Image for Product 2'),
(3, 'image3.jpg', 'Image for Product 3'),
(4, 'image4.jpg', 'Image for Product 4'),
(5, 'image5.jpg', 'Image for Product 5');


-- Messages
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  sender_id INT NOT NULL REFERENCES users(id),
  receiver_id INT NOT NULL REFERENCES users(id),
  message_text TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- insert commands
INSERT INTO messages (sender_id, receiver_id, message_text) VALUES
(1, 2, 'Salom, qalaysiz?'),
(2, 1, 'Yaxshi, rahmat.'),
(1, 4, 'Paketni qabul qildingizmi?'),
(4, 1, 'Ha, hamma narsa yaxshi holatda.'),
(5, 2, 'Yetkazib berishni qachon kutayapsiz?');


-- Events
CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  event_date DATE NOT NULL,
  location VARCHAR NOT NULL,
  description TEXT
);
-- insert commands
INSERT INTO events (name, event_date, location, description) VALUES
('Tadbir1', '2024-04-01', 'Joy1', 'Tadbir1 uchun tavsif'),
('Tadbir2', '2024-04-15', 'Joy2', 'Tadbir2 uchun tavsif'),
('Tadbir3', '2024-05-05', 'Joy3', 'Tadbir3 uchun tavsif'),
('Tadbir4', '2024-06-10', 'Joy4', 'Tadbir4 uchun tavsif'),
('Tadbir5', '2024-07-20', 'Joy5', 'Tadbir5 uchun tavsif');


-- Tasks
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT,
  due_date DATE,
  assigned_to INT REFERENCES users(id),
  status VARCHAR DEFAULT 'pending'
);
-- insert commands
INSERT INTO tasks (name, description, due_date, assigned_to, status) VALUES
('Vazifa1', 'Vazifa1 uchun tavsif', '2024-04-10', 1, 'kutilmoqda'),
('Vazifa2', 'Vazifa2 uchun tavsif', '2024-04-20', 2, 'bajarildi'),
('Vazifa3', 'Vazifa3 uchun tavsif', '2024-05-01', 3, 'kutilmoqda'),
('Vazifa4', 'Vazifa4 uchun tavsif', '2024-05-15', 4, 'bajarildi'),
('Vazifa5', 'Vazifa5 uchun tavsif', '2024-06-01', 5, 'kutilmoqda');


-- Invoices
CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  order_id INT NOT NULL REFERENCES orders(id),
  invoice_date DATE,
  total_amount DECIMAL NOT NULL,
  tax_amount DECIMAL,
  payment_status VARCHAR DEFAULT 'pending'
);
-- insert commands
INSERT INTO invoices (order_id, invoice_date, total_amount, tax_amount, payment_status) VALUES
(1, '2024-03-01', 39.98, 3.99, 'paid'),
(2, '2024-03-02', 9.99, 1.00, 'paid'),
(3, '2024-03-03', 89.97, 8.99, 'paid'),
(4, '2024-03-04', 49.99, 5.00, 'pending'),
(5, '2024-03-05', 79.98, 8.00, 'paid');


-- Subscriptions
CREATE TABLE subscriptions (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  plan_id INT NOT NULL,
  start_date DATE,
  end_date DATE,
  status VARCHAR DEFAULT 'active'
);
-- insert commands
INSERT INTO subscriptions (user_id, plan_id, start_date, end_date, status) VALUES
(1, 1, '2024-03-01', '2025-03-01', 'active'),
(2, 2, '2024-03-02', '2025-03-02', 'active'),
(3, 3, '2024-03-03', '2025-03-03', 'active'),
(4, 4, '2024-03-04', '2025-03-04', 'active'),
(5, 5, '2024-03-05', '2025-03-05', 'active');


-- plants
CREATE TABLE plants (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  price DECIMAL NOT NULL,
  description TEXT
);
-- insert commands
INSERT INTO plants (name, price, description) VALUES
('O`simlik1', 19.99, 'O`simlik1 uchun tavsif'),
('O`simlik2', 29.99, 'O`simlik2 uchun tavsif'),
('O`simlik3', 39.99, 'O`simlik3 uchun tavsif'),
('O`simlik4', 49.99, 'O`simlik4 uchun tavsif'),
('O`simlik5', 59.99, 'O`simlik5 uchun tavsif');

