-- Table structure for music_albums
CREATE TABLE music_albums (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  publish_date DATE,
  genre_id INT,
  on_spotify BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

-- Table structure for genres
CREATE TABLE genres (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);
