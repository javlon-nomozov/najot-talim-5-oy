-- instagram.com da
-- aslida bitta postda bittadan ortiq fayl bo'lishi mumkin lekin asosan reels da bitta video mavjud
-- va bitta fayl bittagina postga tegishli bo'lishi mumkin
CREATE TABLE files(
    file_unique_id VARCHAR(300) PRIMARY KEY,
    path TEXT UNIQUE
);

CREATE TABLE posts(
    id serial PRIMARY KEY,
    file_id INT NOT NULL REFERENCES files(file_unique_id),
    caption varchar(3000)
);

-- bitta postda ko'plab commentlar bo'lishi mumkin
-- bitta comment bitta postga tegishli bo'ladi
CREATE TABLE comments(
    id serial PRIMARY KEY,
    content VARCHAR(3000),
    post_id INT NOT NULL REFERENCES posts(id)
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
    created_at TIMESTAMP CURRENT_TIMESTAMP
)

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
    price DECIMAL(10,2),
    manufacturer_id INT NOT NULL REFERENCES manufacturers(id)
);

