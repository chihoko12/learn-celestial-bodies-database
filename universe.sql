--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_table_access_method = heap;

--
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(255) NOT NULL,
    nationality character varying(100),
    has_been_to_space boolean NOT NULL,
    missions_count integer NOT NULL,
    height_in_cm integer
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2) NOT NULL,
    galaxy_types character varying(50),
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(255) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric(10,2),
    has_life boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    description text,
    planet_types character varying(50),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_astronaut_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Yuri Gagarin', 'Russian', true, 1, 157);
INSERT INTO public.astronaut VALUES (2, 'Neil Armstrong', 'American', true, 2, 183);
INSERT INTO public.astronaut VALUES (3, 'Valentina Tereshkova', 'Russian', true, 1, 160);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Our galaxy', 10000.00, 'Spiral', true);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Neighboring galaxy', 9000.00, 'Spiral', false);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'Part of the Local Group', 5000.00, 'Spiral', false);
INSERT INTO public.galaxy VALUES ('Messier 81', 4, 'A grand design spiral galaxy', 12000.00, 'Spiral', false);
INSERT INTO public.galaxy VALUES ('Whirlpool Galaxy', 5, 'Classic spiral galaxy', 6000.00, 'Spiral', false);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 6, 'Known for its bright nucleus', 8900.00, 'Spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, 'Earth''s only natural satellite', true, 384400.00, false);
INSERT INTO public.moon VALUES ('Phobos', 2, 2, 'Larger of the two moons of Mars', false, 9376.00, false);
INSERT INTO public.moon VALUES ('Deimos', 3, 2, 'The smaller moon of Mars', false, 23460.00, false);
INSERT INTO public.moon VALUES ('Io', 4, 3, 'One of Jupiter''s Galilean moons', true, 421700.00, false);
INSERT INTO public.moon VALUES ('Europa', 5, 3, 'A moon of Jupiter with potential subsurface ocean', true, 671034.00, false);
INSERT INTO public.moon VALUES ('Ganymede', 6, 3, 'The largest moon in the solar system', true, 1070412.00, false);
INSERT INTO public.moon VALUES ('Callisto', 7, 3, 'A heavily cratered moon of Jupiter', true, 1882700.00, false);
INSERT INTO public.moon VALUES ('Titan', 8, 4, 'The largest moon of Saturn', true, 1221870.00, false);
INSERT INTO public.moon VALUES ('Enceladus', 9, 4, 'A small moon of Saturn with geysers', true, 237948.00, false);
INSERT INTO public.moon VALUES ('Mimas', 10, 4, 'A moon of Saturn known for a large crater', false, 185539.00, false);
INSERT INTO public.moon VALUES ('Rhea', 11, 4, 'The second-largest moon of Saturn', true, 527108.00, false);
INSERT INTO public.moon VALUES ('Tethys', 12, 4, 'A mid-sized moon of Saturn', true, 294619.00, false);
INSERT INTO public.moon VALUES ('Dione', 13, 4, 'A moon of Saturn', true, 377396.00, false);
INSERT INTO public.moon VALUES ('Ariel', 14, 5, 'A moon of Uranus', true, 190900.00, false);
INSERT INTO public.moon VALUES ('Umbriel', 15, 5, 'A moon of Uranus', true, 266000.00, false);
INSERT INTO public.moon VALUES ('Titania', 16, 5, 'The largest moon of Uranus', true, 436300.00, false);
INSERT INTO public.moon VALUES ('Oberon', 17, 5, 'A moon of Uranus', true, 583519.00, false);
INSERT INTO public.moon VALUES ('Triton', 18, 6, 'The largest moon of Neptune', true, 354759.00, false);
INSERT INTO public.moon VALUES ('Nereid', 19, 6, 'A moon of Neptune', false, 5513818.00, false);
INSERT INTO public.moon VALUES ('Charon', 20, 7, 'The largest moon of Pluto', true, 19571.00, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, 'Our home planet', 'Terrestrial', true, true);
INSERT INTO public.planet VALUES ('Mars', 2, 1, 'The Red Planet', 'Terrestrial', false, true);
INSERT INTO public.planet VALUES ('Venus', 3, 1, 'The second planet from the Sun', 'Terrestrial', false, true);
INSERT INTO public.planet VALUES ('Jupiter', 4, 1, 'The largest planet in our solar system', 'Gas Giant', false, true);
INSERT INTO public.planet VALUES ('Saturn', 5, 1, 'Known for its ring system', 'Gas Giant', false, true);
INSERT INTO public.planet VALUES ('Uranus', 6, 1, 'An ice giant with a unique rotation', 'Ice Giant', false, true);
INSERT INTO public.planet VALUES ('Neptune', 7, 1, 'The farthest ice giant', 'Ice Giant', false, true);
INSERT INTO public.planet VALUES ('Kepler-22b', 8, 2, 'An exoplanet in the habitable zone', 'Super-Earth', false, true);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 9, 2, 'An exoplanet orbiting the closest star to the Sun', 'Terrestrial', false, true);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 10, 3, 'One of seven Earth-size planets', 'Terrestrial', false, true);
INSERT INTO public.planet VALUES ('Gliese 667 Cc', 11, 4, 'An exoplanet in the habitable zone of its star', 'Super-Earth', false, true);
INSERT INTO public.planet VALUES ('HD 209458 b', 12, 5, 'A hot Jupiter', 'Gas Giant', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, 'The star at the center of the Solar System', true, 0.00);
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 1, 'Closest star to the Sun', true, 4.24);
INSERT INTO public.star VALUES ('Sirius', 3, 1, 'Brightest star in the night sky', true, 8.60);
INSERT INTO public.star VALUES ('Alpha Centauri A', 4, 1, 'Part of the closest star system to the Solar System', true, 4.37);
INSERT INTO public.star VALUES ('Alpha Centauri B', 5, 1, 'A component of the star system closest to the Sun', true, 4.37);
INSERT INTO public.star VALUES ('Betelgeuse', 6, 1, 'A red supergiant star', true, 642.50);
INSERT INTO public.star VALUES ('Vega', 7, 1, 'One of the brightest stars', true, 25.00);
INSERT INTO public.star VALUES ('Rigel', 8, 1, 'A blue supergiant star', true, 863.00);
INSERT INTO public.star VALUES ('Procyon', 9, 1, 'Part of the Winter Triangle', true, 11.46);
INSERT INTO public.star VALUES ('Altair', 10, 1, 'One of the closest stars visible to the naked eye', true, 16.70);
INSERT INTO public.star VALUES ('Deneb', 11, 1, 'One of the vertices of the Summer Triangle', true, 2616.00);
INSERT INTO public.star VALUES ('Spica', 12, 1, 'The brightest star in the constellation Virgo', true, 250.00);
INSERT INTO public.star VALUES ('Pollux', 13, 1, 'An orange-hued giant star', true, 33.78);
INSERT INTO public.star VALUES ('Antares', 14, 1, 'A red supergiant star', true, 600.00);
INSERT INTO public.star VALUES ('Capella', 15, 1, 'A quadruple star system', true, 42.20);


--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_astronaut_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 15, true);


--
-- Name: astronaut astronaut_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_name_key UNIQUE (name);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

