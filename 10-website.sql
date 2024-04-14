-- instagram.com da
-- aslida bitta postda bittadan ortiq fayl bo'lishi mumkin lekin asosan reels da bitta video mavjud
-- va bitta fayl bittagina postga tegishli bo'lishi mumkin
CREATE TABLE files(
    file_unique_id VARCHAR(300) PRIMARY KEY,
    path TEXT UNIQUE
);

CREATE TABLE posts(
    id serial PRIMARY KEY,
    file_id VARCHAR NOT NULL REFERENCES files(file_unique_id),
    caption varchar(3000)
);


-- bitta postda ko'plab like lar bo'ladi
-- lekin bitta like bitta postga va bitta userga tegishli bo'ladi
CREATE TABLE users(
    id serial PRIMARY KEY,
    full_name VARCHAR(100),
    username VARCHAR(100),
    bio VARCHAR(3000),
    photo_path VARCHAR(300) NOT NULL REFERENCES files(file_unique_id),
    hash_password VARCHAR(500)
);

CREATE TABLE likes(
    id serial PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    post_id INT NOT NULL REFERENCES posts(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- bitta postda ko'plab commentlar bo'lishi mumkin
-- bitta comment bitta postga tegishli bo'ladi
CREATE TABLE comments(
    id serial PRIMARY KEY,
    content VARCHAR(3000),
    post_id INT NOT NULL REFERENCES posts(id),
    user_id INT NOT NULL REFERENCES users(id)
);


-- sololearn.com
-- bitta kursda bir nechta sectionlari bor
-- bitta section bitta course ga tegishli
CREATE TABLE courses(
    id serial PRIMARY KEY,
    title VARCHAR(100),
    average_rate decimal(5, 2)
);

-- bitta section bitta kursga tegishli bo'laoladi
-- bitta course da ko'p section lar bo'ladi
CREATE TABLE sections(
    id serial PRIMARY KEY,
    name VARCHAR(100),
    curse_id INT NOT NULL REFERENCES courses(id),
    average_rate decimal(5, 2)
);

-- bitta lesson bitta section tegishli bo'laoladi
-- bitta section da ko'p lesson lar bo'ladi
CREATE TABLE lesson(
    id serial PRIMARY KEY,
    name VARCHAR(100),
    course_id INT NOT NULL REFERENCES courses(id),
    section_id INT NOT NULL REFERENCES sections(id),
    average_rate decimal(5, 2)
);

-- asaxiy.uz
-- bitta productni bitta ishlab chiqaruvchisi bo'lishi mumkin
-- bitta ishlab chiqaruvchida ko'plab maxsulotlar bo'lishi mumkin
CREATE TABLE manufacturers(
    id serial PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE products(
    id serial PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(3000),
    price DECIMAL(10,2) NOT NULL CHECK (price>0),
    manufacturer_id INT NOT NULL REFERENCES manufacturers(id)
);


-- youtube.com
-- bitta video bitta kanalga tegishli bo'lishi mumkin
-- bitta kanada ko'p videolar tegishli bo'lishi mumkin
CREATE TABLE channels(
    id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    channel_name VARCHAR(100), -- channe_name as the same username
    description VARCHAR(3000),
    photo_path VARCHAR(300) NOT NULL
);

CREATE TABLE videos(
    id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(3000),
    channel_id INT NOT NULL REFERENCES channels(id),
    cover_img_path VARCHAR(300)
);

-- pinterest.com da
-- bitta profile ko'plab pin lar joylashtirishi mumkin
-- bitta pin bitta profile ga tegishli bo'ladi
CREATE TABLE profiles(
    id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(100),
    bio VARCHAR(3000),
    photo_path VARCHAR(300) NOT NULL
);

CREATE TABLE pins (
    id serial PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    caption VARCHAR(3000),
    profile_id INT NOT NULL REFERENCES profiles(id),
    content_type VARCHAR(20) CHECK (content_type = 'video' OR content_type = 'photo'),
    photo_path VARCHAR(300) NOT NULL
);

-- iTicket.uz da 
-- bitta chipta malumotlari ichida bitta joy(location) berilgan bo'ladi
-- bitta joyda ko'plab voqea/konsertlar o'tkazilishi mumkin
CREATE TABLE locations(
    id serial PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    lon INT NOT NULL,
    lat INT NOT NULL
);

CREATE TABLE positions(
    id serial PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    rate INT NOT NULL
);

-- bitta konsertga ko'plab yaniy ko'p turdagi[1-qatorga,..,.,.,] biletlar bo'lishi mumkin
-- bitta bitta (trudagi) chipta bittagina konsertga ishlatilinadi
CREATE TABLE events(
    id serial PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    entry_price DECIMAL(10,2) NOT NULL CHECK (entry_price>0),
    location_id INT NOT NULL REFERENCES locations(id),
    event_date TIMESTAMP NOT NULL
);

CREATE TABLE tickets(
    id serial PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    position_id INT NOT NULL REFERENCES positions(id),
    event_id INT NOT NULL REFERENCES events(id),
    location_id INT NOT NULL REFERENCES locations(id),
    price DECIMAL(10,2) NOT NULL CHECK (price>0),
    event_date TIMESTAMP NOT NULL
);


-- insert queries
-- Instagram.com ga
-- Fayllar jadvaliga demodatalarni qo'shish
INSERT INTO files (file_unique_id, path)
VALUES
  ('file_1', '/path/to/file_1'),
  ('file_2', '/path/to/file_2'),
  ('file_3', '/path/to/photo_john'),
  ('file_4', '/path/to/photo_jane');


-- Postlar jadvaliga demodatalarni qo'shish
INSERT INTO posts (file_id, caption)
VALUES
  ('file_1', 'Caption for post 1'),
  ('file_2', 'Caption for post 2');

-- Foydalanuvchilar jadvaliga demodatalarni qo'shish
INSERT INTO users (full_name, username, bio, photo_path, hash_password)
VALUES
  ('John Doe', 'john_doe', 'Bio for John Doe', 'file_3', 'hashed_password_1'),
  ('Jane Smith', 'jane_smith', 'Bio for Jane Smith', 'file_4', 'hashed_password_2');

-- Like lar jadvaliga demodatalarni qo'shish
INSERT INTO likes (user_id,post_id)
VALUES
  (1,2),
  (2,1),
  (2,2);

-- Commentlar jadvaliga demodatalarni qo'shish
INSERT INTO comments (content, post_id, user_id)
VALUES
  ('Comment 1', 1, 1),
  ('Comment 2', 2, 2);


-- Sololearn.com ga
-- Kurslar jadvaliga demodatalarni qo'shish
INSERT INTO courses (title, average_rate)
VALUES
  ('Course A', 4.5),
  ('Course B', 3.8);

-- Bo'limlar jadvaliga demodatalarni qo'shish
INSERT INTO sections (name, curse_id, average_rate)
VALUES
  ('Section 1A', 1, 4.0),
  ('Section 1B', 1, 4.2),
  ('Section 2A', 2, 3.9);

-- Darslar jadvaliga demodatalarni qo'shish
INSERT INTO lesson (name, course_id, section_id, average_rate)
VALUES
  ('Lesson 1A', 1, 1, 4.1),
  ('Lesson 1B', 1, 1, 4.3),
  ('Lesson 2A', 2, 2, 3.8);


-- Asaxiy.uz ga
-- Ishlab chiqaruvchilar jadvaliga demodatalarni qo'shish
INSERT INTO manufacturers (name)
VALUES
  ('Manufacturer A'),
  ('Manufacturer B');

-- Mahsulotlar jadvaliga demodatalarni qo'shish
INSERT INTO products (name, description, price, manufacturer_id)
VALUES
  ('Product 1', 'Description for product 1', 50.00, 1),
  ('Product 2', 'Description for product 2', 75.00, 2);

-- Youtube ga
-- Kanallar jadvaliga demodatalarni qo'shish
INSERT INTO channels (name, channel_name, description, photo_path)
VALUES
  ('Channel A', 'channel_a_username', 'Description for channel A', '/path/to/photo_a'),
  ('Channel B', 'channel_b_username', 'Description for channel B', '/path/to/photo_b');

-- Videolar jadvaliga demodatalarni qo'shish
INSERT INTO videos (name, description, channel_id, cover_img_path)
VALUES
  ('Video 1', 'Description for video 1', 1, '/path/to/cover_img_1'),
  ('Video 2', 'Description for video 2', 2, '/path/to/cover_img_2');

-- Pinterest ga
-- Profillar jadvaliga demodatalarni qo'shish
INSERT INTO profiles (name, username, bio, photo_path)
VALUES
  ('Profile A', 'profile_a_username', 'Bio for profile A', '/path/to/photo_a'),
  ('Profile B', 'profile_b_username', 'Bio for profile B', '/path/to/photo_b');

-- Pinlar jadvaliga demodatalarni qo'shish
INSERT INTO pins (profile_id, title, caption, content_type, photo_path)
VALUES
  (1, 'Pin 1', 'Caption for pin 1', 'photo', '/path/to/photo_1'),
  (2, 'Pin 2', 'Caption for pin 2', 'video', '/path/to/photo_2');

-- iTicket.uz ga 
-- Joylar jadvaliga demodatalarni qo'shish
INSERT INTO locations (name, lon, lat)
VALUES
  ('Location A', 100, 50),
  ('Location B', 120, 45);

-- Position jadvaliga demodatalarni qo'shish
INSERT INTO positions (name, rate)
VALUES
  ('Position A', 100),
  ('Position B', 150);

-- Voqealar jadvaliga demodatalarni qo'shish
INSERT INTO events (title, entry_price, location_id, event_date)
VALUES
  ('Event 1', 20.00, 1, '2024-04-15 18:00:00'),
  ('Event 2', 30.00, 2, '2024-04-20 19:00:00');

-- Chiptalar jadvaliga demodatalarni qo'shish
INSERT INTO tickets (name, event_id, position_id, location_id, price, event_date)
VALUES
  ('Ticket 1', 1, 1, 1, 20.00, '2024-04-25 18:00:00'),
  ('Ticket 2', 1, 2, 2, 30.00, '2024-04-26 19:00:00');

-- 1
SELECT p.id, p.caption, f.path
FROM posts p
JOIN files f ON p.file_id = f.file_unique_id;

-- 2
SELECT u.username
FROM users u
JOIN likes l ON u.id = l.user_id;

-- 3
SELECT p.id, COUNT(l.id) AS likes_count
FROM posts p
LEFT JOIN likes l ON p.id = l.post_id
GROUP BY p.id;

-- 4
SELECT p.caption, u.username
FROM posts p
JOIN comments c ON p.id = c.post_id
JOIN users u ON c.user_id = u.id;

-- 5
SELECT c.title, s.name
FROM courses c
JOIN sections s ON c.id = s.curse_id;

-- 6
SELECT c.title, COUNT(s.id) AS sections_count
FROM courses c
LEFT JOIN sections s ON c.id = s.curse_id
GROUP BY c.title;

-- 7
SELECT m.name, p.name AS product_name
FROM manufacturers m
JOIN products p ON m.id = p.manufacturer_id;

-- 8
SELECT ch.name AS channel_name, v.name AS video_name
FROM channels ch
JOIN videos v ON ch.id = v.channel_id;

-- 9
SELECT pr.name AS profile_name, pi.title AS pin_title
FROM profiles pr
JOIN pins pi ON pr.id = pi.profile_id;

-- 10
SELECT loc.name AS location_name, e.title AS event_title
FROM locations loc
JOIN events e ON loc.id = e.location_id;

-- 11
SELECT t.name AS ticket_name, p.name AS position_name, e.title AS event_title
FROM tickets t
JOIN positions p ON t.position_id = p.id
JOIN events e ON t.event_id = e.id;

-- 12
SELECT p.id, p.caption, f.path, u.username
FROM posts p
JOIN files f ON p.file_id = f.file_unique_id
JOIN likes l ON p.id = l.post_id
JOIN users u ON l.user_id = u.id;

-- 13
SELECT u.username, c.content, p.caption
FROM users u
JOIN comments c ON u.id = c.user_id
JOIN posts p ON c.post_id = p.id;

-- 14
SELECT c.title, s.name, c.average_rate
FROM courses c
JOIN sections s ON c.id = s.curse_id;

-- 15
SELECT m.name, p.name AS product_name, SUM(p.price) AS total_price
FROM manufacturers m
JOIN products p ON m.id = p.manufacturer_id
GROUP BY m.name, p.name;

-- 16
SELECT ch.name AS channel_name, v.name AS video_name, COUNT(v.id) AS video_count
FROM channels ch
JOIN videos v ON ch.id = v.channel_id
GROUP BY ch.name, v.name;

-- 17
SELECT pr.name AS profile_name, pi.title AS pin_title, pi.content_type
FROM profiles pr
JOIN pins pi ON pr.id = pi.profile_id;

-- 18
SELECT loc.name AS location_name, e.title AS event_title, e.event_date
FROM locations loc
JOIN events e ON loc.id = e.location_id;

-- 19
SELECT t.name AS ticket_name, p.name AS position_name, e.title AS event_title, SUM(t.price) AS total_price
FROM tickets t
JOIN positions p ON t.position_id = p.id
JOIN events e ON t.event_id = e.id
GROUP BY t.name, p.name, e.title;

-- 20
SELECT p.id, p.caption, f.path, u.username, c.content
FROM posts p
JOIN files f ON p.file_id = f.file_unique_id
JOIN likes l ON p.id = l.post_id
JOIN users u ON l.user_id = u.id
JOIN comments c ON p.id = c.post_id;
