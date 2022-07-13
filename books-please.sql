create schema books_please;

set search_path to books_please;

ALTER DATABASE postgres SET search_path = books_please;

CREATE TYPE "user_type" AS ENUM (
  'user',
  'admin',
  'test'
);

CREATE TYPE "book_status" AS ENUM (
  'pending',
  'fulfilled'
);

CREATE TABLE "book_requests" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "title" varchar,
  "author" varchar,
  "isbn" varchar,
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

ALTER TABLE "book_requests" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "book_requests" ADD FOREIGN KEY ("kindle_id") REFERENCES "kindles" ("id");

CREATE TABLE "users_kindles" (
  "users_id" int NOT NULL,
  "kindles_id" int NOT NULL,
  PRIMARY KEY ("users_id", "kindles_id")
);

ALTER TABLE "users_kindles" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users_kindles" ADD FOREIGN KEY ("kindles_id") REFERENCES "kindles" ("id");
