SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: my_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE my_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE my_db OWNER TO postgres;

\connect my_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;



CREATE TYPE "user_type" AS ENUM (
  'user',
  'admin'
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

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "book_requests" ("user_id");

ALTER TABLE "kindles" ADD FOREIGN KEY ("id") REFERENCES "book_requests" ("kindle_id");

CREATE TABLE "users_kindles" (
  "users_id" int NOT NULL,
  "kindles_id" int NOT NULL,
  PRIMARY KEY ("users_id", "kindles_id")
);

ALTER TABLE "users_kindles" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users_kindles" ADD FOREIGN KEY ("kindles_id") REFERENCES "kindles" ("id");
