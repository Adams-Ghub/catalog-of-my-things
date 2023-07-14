-- Table: music_albums
CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  on_spotify BOOLEAN NOT NULL
  
  author_id INTEGER REFERENCES authors (id),
  genre_id INTEGER REFERENCES genres (id),
  source_id INTEGER REFERENCES sources(id),
  label_id INTEGER REFERENCES labels (id),
);

-- Table: genres
CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
);
