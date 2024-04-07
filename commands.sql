CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE playlists(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE artists_playlists(
  artist_id INT NOT NULL REFERENCES artists(id),
  playlist_id INT NOT NULL REFERENCES playlists(id)
);

CREATE TABLE concerts(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  play_date TIMESTAMP NOT NULL
);

CREATE TABLE artists_concerts(
  artist_id INT NOT NULL REFERENCES artists(id),
  concerts_id INT NOT NULL REFERENCES concerts(id)
);

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

CREATE TABLE students_courses(
  student_id INT NOT NULL REFERENCES students(id),
  course_id INT NOT NULL REFERENCES courses(id),
  joined_at TIMESTAMP not null DEFAULT CURRENT_TIMESTAMP
);
