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
    position_id INT REFERENCES positions(id),
    location_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price>0),
    event_date TIMESTAMP NOT NULL
);