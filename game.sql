
-- Game Table
CREATE TABLE Game (
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    multiplayer BOOLEAN,
    last_played_at DATE,
    genre_id INTEGER,
    author_id INTEGER,
    label_id INTEGER,
    sources_id INTEGER
    archived BOOLEAN,

    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    FOREIGN KEY (author_id) REFERENCES Author(id),
    FOREIGN KEY (label_id) REFERENCES Label(id),
    FOREIGN KEY (sources_id) REFERENCES Sources(id)
)

-- Author Table
CREATE TABLE Author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
)