Create table artists(
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL
);

Create table playlists(
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL
);

CREATE TABLE artists_playlists(
    artist_id NOT NULL REFERENCES artist(id),
    playlist_id NOT NULL REFERENCES playlists(id)
);

Create table concerts(
    id serial PRIMARY KEY,
    name varchar(100),
    play_date TIMESTAMP NOT NULL
);

CREATE TABLE artists_concerts(
    artist_id NOT NULL REFERENCES artist(id),
    concerts_id NOT NULL REFERENCES concerts(id)
);
