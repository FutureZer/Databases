CREATE TABLE "isbn" (
  "isbn_id" SERIAL PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "age" int NOT NULL,
  "author" varchar NOT NULL,
  "pages" int
);

CREATE TABLE "library" (
  "address" varchar PRIMARY KEY NOT NULL
);

CREATE TABLE "reader" (
  "reader_id" SERIAL PRIMARY KEY NOT NULL,
  "surname" varchar NOT NULL,
  "name" varchar NOT NULL,
  "address" varchar,
  "birth" date
);

CREATE TABLE "category" (
  "name" varchar UNIQUE PRIMARY KEY NOT NULL,
  "parent" varchar
);

CREATE TABLE "publisher" (
  "name" varchar PRIMARY KEY NOT NULL,
  "address" varchar
);

CREATE TABLE "book_instance" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "shelf_number" int,
  "isbn" int NOT NULL,
  "library" varchar,
  "publisher" varchar
);

CREATE TABLE "borrow" (
  "reader" int,
  "book" int,
  "return" date
);

ALTER TABLE "category" ADD FOREIGN KEY ("parent") REFERENCES "category" ("name");

ALTER TABLE "book_instance" ADD FOREIGN KEY ("isbn") REFERENCES "isbn" ("isbn_id");

ALTER TABLE "book_instance" ADD FOREIGN KEY ("library") REFERENCES "library" ("address");

CREATE TABLE "category_book_instance" (
  "category_name" varchar UNIQUE NOT NULL,
  "book_instance" int NOT NULL,
  PRIMARY KEY ("category_name", "book_instance")
);

ALTER TABLE "category_book_instance" ADD FOREIGN KEY ("category_name") REFERENCES "category" ("name");

ALTER TABLE "category_book_instance" ADD FOREIGN KEY ("book_instance") REFERENCES "book_instance" ("id");


ALTER TABLE "book_instance" ADD FOREIGN KEY ("publisher") REFERENCES "publisher" ("name");

ALTER TABLE "borrow" ADD FOREIGN KEY ("reader") REFERENCES "reader" ("reader_id");

ALTER TABLE "borrow" ADD FOREIGN KEY ("book") REFERENCES "book_instance" ("id");
