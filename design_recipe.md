1. 
As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' titles.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' genres.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' release year.

Nouns: movies, title, genre, release_year

2. 
Records    |     Properties
- - - - - - - - - - - - - - 
movies     |     title, genre, release_year


3. 
id: SERIAL
title: text
genre: text
release_year: int

4. 
-- file: movies_table.sql

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title text,
  genre text,
  release_year int
);

INSERT INTO "public"."movies" ("id", "title", "genre", "release_year") VALUES
(1, 'Matrix', 'Sci-Fi', '2002'),
(2, 'Social Network', 'Drama', '2012'),
(3, 'The Internship', 'Comedy', '2016');

5. 
psql -h 127.0.0.1 movies < movies_table.sql