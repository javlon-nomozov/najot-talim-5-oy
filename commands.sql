-- Users
CREATE TABLE users (
  user_id INT PRIMARY KEY,
  username VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  password VARCHAR NOT NULL
);

-- Products
CREATE TABLE products (
  id INT PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL NOT NULL,
  quantity INT NOT NULL
);

-- Orders
CREATE TABLE orders (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  product_count INT NOT NULL,
  total_amount DECIMAL NOT NULL
);

-- Categories
CREATE TABLE categories (
  id INT PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT NOT NULL
);

-- Authors
CREATE TABLE authors (
  id INT PRIMARY KEY,
  name VARCHAR NOT NULL,
  bio TEXT NOT NULL
);

-- Comments
CREATE TABLE comments (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  comment_text TEXT NOT NULL
);

-- Books
CREATE TABLE books (
  id INT PRIMARY KEY,
  title VARCHAR NOT NULL,
  author_id INT NOT NULL,
  category_id INT NOT NULL,
  price DECIMAL NOT NULL,
  publication_date DATE,
  description TEXT
);

-- Permissions
CREATE TABLE permissions (
  id INT PRIMARY KEY,
  role_id INT NOT NULL,
  resource_id INT NOT NULL,
  resource_type VARCHAR NOT NULL,
  permission_type VARCHAR NOT NULL
);

-- Roles
CREATE TABLE roles (
  id INT PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT
);

-- Addresses
CREATE TABLE addresses (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  street_address VARCHAR NOT NULL,
  city VARCHAR NOT NULL,
  state VARCHAR NOT NULL,
  country VARCHAR NOT NULL,
  postal_code VARCHAR NOT NULL
);

-- Payments
CREATE TABLE payments (
  id INT PRIMARY KEY,
  order_id INT NOT NULL,
  payment_date DATE,
  amount DECIMAL NOT NULL,
  payment_method VARCHAR NOT NULL,
  transaction_id VARCHAR,
  status VARCHAR DEFAULT 'pending'
);

-- Reviews
CREATE TABLE reviews (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  rating DECIMAL NOT NULL,
  review_text TEXT
);

-- Tags
CREATE TABLE tags (
  id INT PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT
);

-- Images
CREATE TABLE images (
  id INT PRIMARY KEY,
  product_id INT NOT NULL,
  image_url VARCHAR NOT NULL,
  alt_text VARCHAR
);

-- Messages
CREATE TABLE messages (
  id INT PRIMARY KEY,
  sender_id INT NOT NULL,
  receiver_id INT NOT NULL,
  message_text TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Events
CREATE TABLE events (
  id INT PRIMARY KEY,
  name VARCHAR NOT NULL,
  event_date DATE NOT NULL,
  location VARCHAR NOT NULL,
  description TEXT
);

-- Tasks
CREATE TABLE tasks (
  id INT PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT,
  due_date DATE,
  assigned_to INT,
  status VARCHAR DEFAULT 'pending'
);

-- Invoices
CREATE TABLE invoices (
  id INT PRIMARY KEY,
  order_id INT NOT NULL,
  invoice_date DATE,
  total_amount DECIMAL NOT NULL,
  tax_amount DECIMAL,
  payment_status VARCHAR DEFAULT 'pending'
);

-- Subscriptions
CREATE TABLE subscriptions (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  plan_id INT NOT NULL,
  start_date DATE,
  end_date DATE,
  status VARCHAR DEFAULT 'active'
);

-- Plans
CREATE TABLE plans (
  id INT PRIMARY KEY,
  name VARCHAR NOT NULL,
  price DECIMAL NOT NULL,
  description TEXT
);
