CREATE DATABASE production

CREATE TABLE people
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  title VARCHAR(255)
);

CREATE TABLE movies
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  rating VARCHAR(5),
  release_date VARCHAR(255)
);

CREATE TABLE todo
(
  id SERIAL PRIMARY KEY,
  task VARCHAR(255),
  location VARCHAR(255),
  description VARCHAR(255)
);

INSERT INTO people (name, age, title) VALUES ('Tyler McIntosh', 24, 'Production Assistant');

INSERT INTO movies (name, rating, release_date) VALUES ('First Movie', 'PG-13', '21 July 2013');

INSERT INTO todo (task, location, description) VALUES ('get coffee', 'on set', 'decaf is not real coffee');