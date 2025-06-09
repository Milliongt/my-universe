camper: /project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.17 (Ubuntu 12.17-1.pgdg22.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=> CREATE DATABASE universe;
CREATE DATABASE
postgres=> \c universe
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
You are now connected to database "universe" as user "freecodecamp".
universe=> CREATE TABLE galaxy (  galaxy_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  age_in_million_years INT NOT NULL,  diameter_in_light_years NUMERIC(10, 2),  is_spiral BOOLEAN NOT NULL,  description TEXT);
CREATE TABLE
universe=> CREATE TABLE star (  star_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),  mass INT NOT NULL,  is_main_sequence BOOLEAN NOT NULL,  temperature NUMERIC(6, 2));
CREATE TABLE
universe=> CREATE TABLE planet (  planet_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  star_id INT NOT NULL REFERENCES star(star_id),  radius INT NOT NULL,  is_habitable BOOLEAN NOT NULL,  atmosphere TEXT);
CREATE TABLE
universe=> CREATE TABLE moon (  moon_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  planet_id INT NOT NULL REFERENCES planet(planet_id),  size INT NOT NULL,  has_ice BOOLEAN NOT NULL,  composition TEXT);
CREATE TABLE
universe=> CREATE TABLE spacecraft (  spacecraft_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  destination_planet_id INT REFERENCES planet(planet_id),  speed INT NOT NULL,  is_manned BOOLEAN NOT NULL,  notes TEXT);
CREATE TABLE
universe=> INSERT INTO galaxy (name, age_in_million_years, diameter_in_light_years, is_spiral, description) VALUES('Milky Way', 13600, 105700.00, TRUE, 'Home galaxy of Earth'),('Andromeda', 10100, 220000.00, TRUE, 'Nearest spiral galaxy'),('Triangulum', 13000, 60000.00, TRUE, 'Small spiral galaxy'),('Sombrero', 9300, 50000.00, FALSE, 'Has a bright nucleus'),('Whirlpool', 10000, 76000.00, TRUE, 'Interacting galaxy'),('Messier 87', 15000, 120000.00, FALSE, 'Elliptical galaxy');
INSERT 0 6
universe=> INSERT INTO star (name, galaxy_id, mass, is_main_sequence, temperature) VALUES('Sun', 1, 1989000, TRUE, 5778.00),('Alpha Centauri A', 1, 1230000, TRUE, 5790.00),('Sirius', 1, 2020000, TRUE, 9940.00),('Betelgeuse', 1, 12000000, FALSE, 3500.00),('Vega', 1, 2100000, TRUE, 9602.00),('Proxima Centauri', 1, 123000, TRUE, 3042.00);
INSERT 0 6
universe=> INSERT INTO planet (name, star_id, radius, is_habitable, atmosphere) VALUES('Earth', 1, 6371, TRUE, 'Nitrogen-Oxygen'),('Mars', 1, 3390, FALSE, 'Carbon Dioxide'),('Venus', 1, 6052, FALSE, 'Carbon Dioxide'),('Kepler-22b', 2, 24000, TRUE, 'Unknown'),('Proxima b', 6, 7160, TRUE, 'Unknown'),('Jupiter', 1, 69911, FALSE, 'Hydrogen-Helium'),('Saturn', 1, 58232, FALSE, 'Hydrogen-Helium'),('Neptune', 1, 24622, FALSE, 'Hydrogen-Helium'),('Uranus', 1, 25362, FALSE, 'Hydrogen-Helium'),('Mercury', 1, 2439, FALSE, 'Thin'),('Kepler-442b', 2, 12000, TRUE, 'Unknown'),('HD 209458 b', 2, 143000, FALSE, 'Hydrogen');
INSERT 0 12
universe=> INSERT INTO moon (name, planet_id, size, has_ice, composition) VALUES('Moon', 1, 1737, FALSE, 'Rocky'),('Phobos', 2, 11, FALSE, 'Rocky'),('Deimos', 2, 6, FALSE, 'Rocky'),('Europa', 6, 1560, TRUE, 'Ice-Rock'),('Ganymede', 6, 2634, TRUE, 'Ice-Rock'),('Callisto', 6, 2410, TRUE, 'Ice-Rock'),('Io', 6, 1821, FALSE, 'Sulfur'),('Titan', 7, 2575, TRUE, 'Nitrogen-Methane'),('Rhea', 7, 763, TRUE, 'Ice'),('Iapetus', 7, 734, TRUE, 'Ice'),('Mimas', 7, 198, TRUE, 'Ice'),('Triton', 8, 1353, TRUE, 'Nitrogen-Ice'),('Oberon', 9, 761, TRUE, 'Ice'),('Titania', 9, 788, TRUE, 'Ice'),('Umbriel', 9, 584, TRUE, 'Ice'),('Ariel', 9, 578, TRUE, 'Ice'),('Miranda', 9, 235, TRUE, 'Ice'),('Charon', 10, 606, TRUE, 'Ice'),('Kepler Moon A', 4, 800, TRUE, 'Unknown'),('Kepler Moon B', 11, 600, TRUE, 'Unknown');
INSERT 0 20
universe=> INSERT INTO spacecraft (name, destination_planet_id, speed, is_manned, notes) VALUES('Voyager 1', 6, 17000, FALSE, 'First spacecraft in interstellar space'),('Cassini', 7, 15000, FALSE, 'Studied Saturn'),('Apollo 11', 1, 11000, TRUE, 'First manned Moon landing');
INSERT 0 3
universe=> CREATE TABLE galaxy (  galaxy_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  age_in_million_years INT NOT NULL,  diameter_in_light_years NUMERIC(10, 2),  is_spiral BOOLEAN NOT NULL,  description TEXT);
ERROR:  relation "galaxy" already exists
universe=> CREATE TABLE star (  star_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),  mass INT NOT NULL,  is_main_sequence BOOLEAN NOT NULL,  temperature NUMERIC(6, 2));
ERROR:  relation "star" already exists
universe=> CREATE TABLE planet (  planet_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  star_id INT NOT NULL REFERENCES star(star_id),  radius INT NOT NULL,  is_habitable BOOLEAN NOT NULL,  atmosphere TEXT);
ERROR:  relation "planet" already exists
universe=> CREATE TABLE moon (  moon_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  planet_id INT NOT NULL REFERENCES planet(planet_id),  size INT NOT NULL,  has_ice BOOLEAN NOT NULL,  composition TEXT);
ERROR:  relation "moon" already exists
universe=> CREATE TABLE spacecraft (  spacecraft_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  planet_id INT REFERENCES planet(planet_id),  speed INT NOT NULL,  is_manned BOOLEAN NOT NULL,  notes TEXT);
ERROR:  relation "spacecraft" already exists
universe=> DROP TABLE IF EXISTS spacecraft, moon, planet, star, galaxy CASCADE;
DROP TABLE
universe=> CREATE TABLE galaxy (  galaxy_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  age_in_million_years INT NOT NULL,  diameter_in_light_years NUMERIC(10, 2),  is_spiral BOOLEAN NOT NULL,  description TEXT);
CREATE TABLE
universe=> CREATE TABLE star (  star_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),  mass INT NOT NULL,  is_main_sequence BOOLEAN NOT NULL,  temperature NUMERIC(6, 2));
CREATE TABLE
universe=> CREATE TABLE planet (  planet_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  star_id INT NOT NULL REFERENCES star(star_id),  radius INT NOT NULL,  is_habitable BOOLEAN NOT NULL,  atmosphere TEXT);
CREATE TABLE
universe=> CREATE TABLE moon (  moon_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  planet_id INT NOT NULL REFERENCES planet(planet_id),  size INT NOT NULL,  has_ice BOOLEAN NOT NULL,  composition TEXT);
CREATE TABLE
universe=> CREATE TABLE spacecraft (  spacecraft_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  planet_id INT REFERENCES planet(planet_id),  speed INT NOT NULL,  is_manned BOOLEAN NOT NULL,  notes TEXT);
CREATE TABLE
universe=> DROP TABLE IF EXISTS spacecraft, moon, planet, star, galaxy CASCADE;
DROP TABLE
universe=> CREATE TABLE galaxy (  galaxy_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  age_in_million_years INT NOT NULL,  diameter_in_light_years NUMERIC(10,2),  is_spiral BOOLEAN NOT NULL,  description TEXT);
CREATE TABLE
universe=> CREATE TABLE star (  star_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),  mass INT NOT NULL,  is_main_sequence BOOLEAN NOT NULL,  temperature NUMERIC(6,2));
CREATE TABLE
universe=> CREATE TABLE planet (  planet_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  star_id INT NOT NULL REFERENCES star(star_id),  radius INT NOT NULL,  is_habitable BOOLEAN NOT NULL,  atmosphere TEXT);
CREATE TABLE
universe=> 
universe=> CREATE TABLE moon (  moon_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  planet_id INT NOT NULL REFERENCES planet(planet_id),  size INT NOT NULL,  has_ice BOOLEAN NOT NULL,  composition TEXT);
CREATE TABLE
universe=> CREATE TABLE spacecraft (  spacecraft_id SERIAL PRIMARY KEY,  name VARCHAR(100) UNIQUE NOT NULL,  planet_id INT REFERENCES planet(planet_id),  speed INT NOT NULL,  is_manned BOOLEAN NOT NULL,  notes TEXT);
CREATE TABLE
universe=> INSERT INTO galaxy (name, age_in_million_years, diameter_in_light_years, is_spiral, description) VALUES('Milky Way', 13600, 105700.00, TRUE, 'Home galaxy of Earth'),('Andromeda', 10100, 220000.00, TRUE, 'Nearest spiral galaxy'),('Triangulum', 13000, 60000.00, TRUE, 'Small spiral galaxy'),('Whirlpool', 10000, 76000.00, TRUE, 'Interacting galaxy'),('Sombrero', 9300, 50000.00, FALSE, 'Has a bright nucleus'),('Messier 87', 15000, 120000.00, FALSE, 'Large elliptical galaxy');
INSERT 0 6
universe=> INSERT INTO star (name, galaxy_id, mass, is_main_sequence, temperature) VALUES('Sun', 1, 1989000, TRUE, 5778.00),('Sirius', 1, 2020000, TRUE, 9940.00),('Betelgeuse', 1, 12000000, FALSE, 3500.00),('Alpha Centauri A', 1, 1230000, TRUE, 5790.00),('Vega', 1, 2100000, TRUE, 9602.00),('Proxima Centauri', 1, 123000, TRUE, 3042.00);
INSERT 0 6
universe=> INSERT INTO planet (name, star_id, radius, is_habitable, atmosphere) VALUES('Earth', 1, 6371, TRUE, 'Nitrogen-Oxygen'),('Mars', 1, 3390, FALSE, 'Carbon Dioxide'),('Venus', 1, 6052, FALSE, 'Carbon Dioxide'),('Jupiter', 1, 69911, FALSE, 'Hydrogen-Helium'),('Saturn', 1, 58232, FALSE, 'Hydrogen-Helium'),('Uranus', 1, 25362, FALSE, 'Hydrogen-Helium'),('Neptune', 1, 24622, FALSE, 'Hydrogen-Helium'),('Kepler-22b', 2, 24000, TRUE, 'Unknown'),('Proxima b', 6, 7160, TRUE, 'Unknown'),('Kepler-442b', 4, 12000, TRUE, 'Unknown'),('HD 209458 b', 5, 143000, FALSE, 'Hydrogen'),('Gliese 581g', 6, 7000, TRUE, 'Unknown');
INSERT 0 12
universe=> INSERT INTO moon (name, planet_id, size, has_ice, composition) VALUES('Moon', 1, 1737, FALSE, 'Rocky'),('Phobos', 2, 11, FALSE, 'Rocky'),('Deimos', 2, 6, FALSE, 'Rocky'),('Europa', 4, 1560, TRUE, 'Ice-Rock'),('Ganymede', 4, 2634, TRUE, 'Ice-Rock'),('Callisto', 4, 2410, TRUE, 'Ice-Rock'),('Io', 4, 1821, FALSE, 'Sulfur'),('Titan', 5, 2575, TRUE, 'Nitrogen-Methane'),('Rhea', 5, 763, TRUE, 'Ice'),('Iapetus', 5, 734, TRUE, 'Ice'),('Mimas', 5, 198, TRUE, 'Ice'),('Triton', 7, 1353, TRUE, 'Nitrogen-Ice'),('Oberon', 6, 761, TRUE, 'Ice'),('Titania', 6, 788, TRUE, 'Ice'),('Umbriel', 6, 584, TRUE, 'Ice'),('Ariel', 6, 578, TRUE, 'Ice'),('Miranda', 6, 235, TRUE, 'Ice'),('Charon', 8, 606, TRUE, 'Ice'),('Kepler Moon A', 10, 800, TRUE, 'Unknown'),('Kepler Moon B', 11, 600, TRUE, 'Unknown');
INSERT 0 20
universe=> INSERT INTO spacecraft (name, planet_id, speed, is_manned, notes) VALUES('Voyager 1', 4, 17000, FALSE, 'First spacecraft in interstellar space'),('Cassini', 5, 15000, FALSE, 'Studied Saturn and its moons'),('Apollo 11', 1, 11000, TRUE, 'First manned Moon landing');
INSERT 0 3
