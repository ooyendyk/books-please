CREATE TYPE "user_type" AS ENUM (
  'user',
  'admin'
);

CREATE TYPE "book_status" AS ENUM (
  'pending',
  'fulfilled'
);

CREATE TABLE "books" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "title" varchar,
  "author" varchar,
  "status" book_status NOT NULL DEFAULT 'pending',
  "user_id" int NOT NULL,
  "kindle_id" int NOT NULL
);

CREATE TABLE "users" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "email" varchar,
  "password" varchar NOT NULL,
  "name" varchar,
  "type" user_type NOT NULL DEFAULT 'user'
);

CREATE TABLE "kindles" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "email" varchar NOT NULL,
  "device_name" varchar,
  "user_id" int NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "books" ("user_id");

ALTER TABLE "kindles" ADD FOREIGN KEY ("id") REFERENCES "books" ("kindle_id");

CREATE TABLE "users_kindles" (
  "users_id" int NOT NULL,
  "kindles_id" int NOT NULL,
  PRIMARY KEY ("users_id", "kindles_id")
);

ALTER TABLE "users_kindles" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users_kindles" ADD FOREIGN KEY ("kindles_id") REFERENCES "kindles" ("id");
