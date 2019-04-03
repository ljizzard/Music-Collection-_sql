DROP TABLE album;
DROP TABLE artist;


CREATE TABLE artist(
  id SERIAL PRIMARY KEY,
  artist_name VARCHAR,
);
CREATE TABLE album (
  id SERIAL PRIMARY KEY,
  album_name VARCHAR,
  genre VARCHAR
  link_id INT REFERENCES artist(id)
);
