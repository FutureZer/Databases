CREATE TABLE "city" (
  "name" varchar UNIQUE NOT NULL,
  "region" varchar NOT NULL,
  PRIMARY KEY ("name", "region")
);

CREATE TABLE "station" (
  "name" varchar PRIMARY KEY NOT NULL,
  "city" varchar,
  "tracks" int
);

CREATE TABLE "train" (
  "trainnr" varchar PRIMARY KEY NOT NULL,
  "start" varchar,
  "end" varchar,
  "length" int
);

CREATE TABLE "connection" (
  "train" varchar,
  "station" varchar,
  "departure" timestamp,
  "arrival" timestamp
);

ALTER TABLE "station" ADD FOREIGN KEY ("city") REFERENCES "city" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("start") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("end") REFERENCES "station" ("name");

ALTER TABLE "connection" ADD FOREIGN KEY ("train") REFERENCES "train" ("trainnr");

ALTER TABLE "connection" ADD FOREIGN KEY ("station") REFERENCES "station" ("name");
