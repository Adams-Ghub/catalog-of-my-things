--label schema
CREATE TABLE labels (
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50),
    color VARCHAR(50),
    items ARRAY,
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
    FOREIGN KEY (label_id) REFERENCES labels(id),
    PRIMARY KEY (id)
);
