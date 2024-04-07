CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK(age >= 12),
    username VARCHAR(100) NOT NULL UNIQUE,
    role VARCHAR(100) NOT NULL CHECK(role in ('admin', 'employee')),
    hash_password VARCHAR(300) NOT NULL
);
INSERT INTO users (
        first_name,
        last_name,
        age,
        username,
        role,
        hash_password
    )
VALUES ('John', 'Doe', 12, 'john', 'admin', '1234');
CREATE TABLE guides(
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL
);
INSERT INTO guides (title, content)
VALUES ('Qoida 1', 'Qoida matni');
CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    guide_id INT NOT NULL REFERENCES guides(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO todos (user_id, guide_id)
VALUES (1, 1);
INSERT INTO todos (user_id, guide_id)
VALUES (1,1);


SELECT * FROM users;
SELECT * FROM guides;
SELECT * FROM todos ORDER BY created_at DESC;