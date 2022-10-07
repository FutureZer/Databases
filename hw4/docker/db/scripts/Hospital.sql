CREATE TABLE "station" (
  "statnr" int PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "room" (
  "roomnr" int PRIMARY KEY NOT NULL,
  "station" int NOT NULL,
  "beds" int
);

CREATE TABLE "caregiver" (
  "pernr" int PRIMARY KEY NOT NULL,
  "station" int,
  "name" varchar NOT NULL,
  "qualification" varchar
);

CREATE TABLE "doctor" (
  "pernr" int PRIMARY KEY NOT NULL,
  "station" int,
  "name" varchar NOT NULL,
  "area" varchar,
  "rank" int
);

CREATE TABLE "admission" (
  "room" int,
  "patient" int,
  "from" date NOT NULL,
  "to" date NOT NULL
);

CREATE TABLE "patient" (
  "patientnr" int PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "disease" varchar,
  "doctor" int
);

ALTER TABLE "room" ADD FOREIGN KEY ("station") REFERENCES "station" ("statnr");

ALTER TABLE "caregiver" ADD FOREIGN KEY ("station") REFERENCES "station" ("statnr");

ALTER TABLE "doctor" ADD FOREIGN KEY ("station") REFERENCES "station" ("statnr");

ALTER TABLE "admission" ADD FOREIGN KEY ("room") REFERENCES "room" ("roomnr");

ALTER TABLE "admission" ADD FOREIGN KEY ("patient") REFERENCES "patient" ("patientnr");

ALTER TABLE "patient" ADD FOREIGN KEY ("doctor") REFERENCES "doctor" ("pernr");
