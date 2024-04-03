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

-- add new 2 colums to users taable
ALTER table users ADD full_name VARCHAR(100),ADD birth_date TIMESTAMP;

-- And I use [ALTER TABLE, COALESCE, TIMESTAMP and DATE] in a same code
INSERT INTO users (username, email, password,full_name, birth_date) VALUES
('user6', 'user6@example.com', 'password3', 'User 6', '2000-02-02');
select id, username, email, COALESCE(full_name,INITCAP(username)) full_name, DATE(birth_date) from users;
