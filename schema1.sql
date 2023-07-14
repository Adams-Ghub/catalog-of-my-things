--label schema
CREATE TABLE labels (
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50),
    color VARCHAR(50),
    PRIMARY KEY (id)
);

--books schema
CREATE TABLE books (
    id INT GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(50),
    cover_state VARCHAR(50),
    publish_date DATE,
    archived BOOLEAN,
    label_id INT,
    genre_id INT,
    author_id INT,
    source_id INT,
    FOREIGN KEY (label_id) REFERENCES labels(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES Author(id),
    FOREIGN KEY (source_id) REFERENCES source(id),
    PRIMARY KEY (id)
);
