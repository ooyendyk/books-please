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

CREATE TABLE "kindle" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "email" varchar NOT NULL,
  "device_name" varchar,
  "user_id" int NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "books" ("user_id");

ALTER TABLE "kindle" ADD FOREIGN KEY ("id") REFERENCES "books" ("kindle_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "kindle" ("user_id");
