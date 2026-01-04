-- ============================
-- Universe Project SQL
-- ============================

-- 1) Galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    type VARCHAR,
    diameter NUMERIC,
    visible BOOLEAN,
    num_stars INT
);

INSERT INTO galaxy (name, type, diameter, visible, num_stars) VALUES
('Milky Way', 'Spiral', 105700, TRUE, 1000000000),
('Andromeda', 'Spiral', 220000, TRUE, 1000000000),
('Triangulum', 'Spiral', 60000, TRUE, 400000000),
('Messier 81', 'Spiral', 90000, TRUE, 200000000),
('Sombrero', 'Elliptical', 49000, FALSE, 80000000),
('Whirlpool', 'Spiral', 61000, TRUE, 100000000);

-- 2) Star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    mass NUMERIC,
    age NUMERIC,
    is_main_sequence BOOLEAN
);

INSERT INTO star (name, galaxy_id, mass, age, is_main_sequence) VALUES
('Sun', 1, 1.0, 4600, TRUE),
('Proxima Centauri', 1, 0.123, 4500, TRUE),
('Sirius', 1, 2.02, 242, TRUE),
('Rigel', 1, 21, 8, FALSE),
('Alpha Centauri A', 1, 1.1, 5000, TRUE),
('Betelgeuse', 1, 20, 10, FALSE);

-- 3) Planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    diameter NUMERIC,
    has_life BOOLEAN,
    orbital_period INT
);

INSERT INTO planet (name, star_id, diameter, has_life, orbital_period) VALUES
('Mercury', 1, 4879, FALSE, 88),
('Venus', 1, 12104, FALSE, 225),
('Earth', 1, 12742, TRUE, 365),
('Mars', 1, 6779, FALSE, 687),
('Jupiter', 1, 139820, FALSE, 4333),
('Saturn', 1, 116460, FALSE, 10759),
('Uranus', 1, 50724, FALSE, 30687),
('Neptune', 1, 49244, FALSE, 60190),
('Proxima b', 2, 11400, FALSE, 11),
('Sirius b Planet', 3, 13000, FALSE, 300),
('Rigel b', 4, 140000, FALSE, 5000),
('Betelgeuse b', 6, 150000, FALSE, 6000);

-- 4) Moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    diameter NUMERIC,
    is_artificial BOOLEAN,
    orbital_period INT
);

INSERT INTO moon (name, planet_id, diameter, is_artificial, orbital_period) VALUES
('Moon', 3, 3474, FALSE, 27),
('Phobos', 4, 22, FALSE, 0),
('Deimos', 4, 12, FALSE, 1),
('Io', 5, 3643, FALSE, 2),
('Europa', 5, 3122, FALSE, 3),
('Ganymede', 5, 5268, FALSE, 7),
('Callisto', 5, 4821, FALSE, 16),
('Titan', 6, 5150, FALSE, 16),
('Rhea', 6, 1528, FALSE, 4),
('Oberon', 7, 1523, FALSE, 13),
('Titania', 7, 1578, FALSE, 8),
('Triton', 8, 2707, FALSE, 6),
('Charon', 9, 1212, FALSE, 6),
('Proxima Moon 1', 9, 500, FALSE, 1),
('Proxima Moon 2', 9, 600, FALSE, 2),
('Sirius b I', 10, 1000, FALSE, 3),
('Sirius b II', 10, 1200, FALSE, 4),
('Rigel b I', 11, 5000, FALSE, 10),
('Rigel b II', 11, 6000, FALSE, 15),
('Betelgeuse b I', 12, 8000, FALSE, 20),
('Betelgeuse b II', 12, 9000, FALSE, 25);

-- 5) Comet table
CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR UNIQUE NOT NULL,
    diameter NUMERIC,
    orbit_period INT,
    has_tail BOOLEAN
);

INSERT INTO comet (name, diameter, orbit_period, has_tail) VALUES
('Halley', 11, 76, TRUE),
('Encke', 4, 3, TRUE),
('Hale-Bopp', 40, 2533, TRUE),
('Swift-Tuttle', 26, 133, TRUE),
('Shoemaker-Levy 9', 2, 0, FALSE);
