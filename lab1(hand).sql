CREATE TABLE IF NOT EXISTS "books"(
    "id" BIGINT NOT NULL,
    "BOOK_NAME" VARCHAR(255) NOT NULL ,
    "EDITION" INT ,
    "EDITION_YEAR" INT,
    "place_id" BIGINT NOT NULL
);

ALTER TABLE IF EXISTS books
    ADD PRIMARY KEY (id);



CREATE TABLE IF NOT EXISTS "publishers"(
    "id" BIGINT NOT NULL ,
    "publisher_name" VARCHAR(255) NOT NULL
);

ALTER TABLE IF EXISTS publishers
    ADD PRIMARY KEY (id);


CREATE TABLE IF NOT EXISTS "authors"(
    "id" BIGINT NOT NULL ,
    "name" VARCHAR(255) NOT NULL ,
    "surname" VARCHAR(255) NOT NULL
);

ALTER TABLE IF EXISTS authors
    ADD PRIMARY KEY (id);


CREATE TABLE IF NOT EXISTS "readers"(
    "id" BIGINT NOT NULL ,
    "name" VARCHAR(255) NOT NULL ,
    "surname" VARCHAR(255) NOT NULL ,
    "birth_date" DATE NOT NULL ,
    "sex" BOOLEAN NOT NULL ,
    "education" VARCHAR     --читателей без образования можно искать по ISNULL
);

ALTER TABLE IF EXISTS readers
    ADD PRIMARY KEY (id);


CREATE TABLE IF NOT EXISTS "biblio_place"(
    "id" BIGINT NOT NULL ,
    "row" BIGINT NOT NULL ,
    "sequence_number" BIGINT NOT NULL
);

ALTER TABLE IF EXISTS biblio_place
    ADD PRIMARY KEY (id);

ALTER TABLE IF EXISTS books
    ADD FOREIGN KEY (place_id) REFERENCES biblio_place(id);


CREATE TABLE IF NOT EXISTS "books_by_publisher"(
    "publisher_id" BIGINT NOT NULL ,
    "book_id" BIGINT NOT NULL
);

ALTER TABLE IF EXISTS books_by_publisher
    ADD FOREIGN KEY (publisher_id) REFERENCES publishers(id),
    ADD FOREIGN KEY (book_id) REFERENCES books(id);


CREATE TABLE IF NOT EXISTS "books_by_author"(
    "author_id" BIGINT NOT NULL ,
    "book_id" BIGINT NOT NULL
);

ALTER TABLE IF EXISTS books_by_author
    ADD FOREIGN KEY (author_id) REFERENCES authors(id),
    ADD FOREIGN KEY (book_id) REFERENCES books(id);


CREATE TABLE IF NOT EXISTS "book_issuance"(
    "book_id" BIGINT NOT NULL ,
    "reader_id" BIGINT NOT NULL ,
    "issuance_date" DATE NOT NULL ,
    "expected_return_date" DATE NOT NULL ,
    "return_date" DATE
);

ALTER TABLE IF EXISTS book_issuance
    ADD FOREIGN KEY (book_id) REFERENCES books(id),
    ADD FOREIGN KEY (reader_id) REFERENCES readers(id);


