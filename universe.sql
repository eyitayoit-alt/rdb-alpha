--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    number_of_stars integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planet (
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_planet_id integer NOT NULL
);


ALTER TABLE public.galaxy_planet OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planet_galaxy_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planet_galaxy_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planet_galaxy_planet_id_seq OWNED BY public.galaxy_planet.galaxy_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    number_of_moon integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    number_of_moon integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    number_of_planet integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_planet galaxy_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet ALTER COLUMN galaxy_planet_id SET DEFAULT nextval('public.galaxy_planet_galaxy_planet_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', NULL, NULL, true, NULL, 254.00, NULL);
INSERT INTO public.galaxy VALUES (2, 'Antenna', NULL, NULL, false, NULL, 26.00, NULL);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', NULL, NULL, true, NULL, 1.00, NULL);
INSERT INTO public.galaxy VALUES (4, 'Aquarius Dwarf', NULL, NULL, false, NULL, 32.00, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', NULL, NULL, true, NULL, 10.00, NULL);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', NULL, NULL, true, NULL, 5.00, NULL);
INSERT INTO public.galaxy VALUES (7, 'Black Eye Galaxy', NULL, NULL, true, NULL, 15.00, NULL);


--
-- Data for Name: galaxy_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planet VALUES (2, 3, 'uriel-uris', 1);
INSERT INTO public.galaxy_planet VALUES (3, 4, 'Bianca-thalas', 2);
INSERT INTO public.galaxy_planet VALUES (1, 2, 'rigel-cap', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Europa', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.moon VALUES (2, 1, 'lo', NULL, NULL, true, NULL, 26.00, NULL);
INSERT INTO public.moon VALUES (3, 1, 'Ganyemede', NULL, NULL, true, NULL, 15.00, NULL);
INSERT INTO public.moon VALUES (4, 1, 'Callisto', NULL, NULL, true, NULL, 20.00, NULL);
INSERT INTO public.moon VALUES (5, 1, 'Ersa', NULL, NULL, true, NULL, 1.00, NULL);
INSERT INTO public.moon VALUES (6, 2, 'Mimas', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.moon VALUES (7, 2, 'Dione', NULL, NULL, true, NULL, 17.00, NULL);
INSERT INTO public.moon VALUES (8, 2, 'lapetus', NULL, NULL, true, NULL, 5.00, NULL);
INSERT INTO public.moon VALUES (9, 2, 'Hyperion', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.moon VALUES (10, 2, 'Telesto', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.moon VALUES (11, 3, 'Titania', NULL, NULL, true, NULL, 5.00, NULL);
INSERT INTO public.moon VALUES (12, 3, 'Ariel', NULL, NULL, true, NULL, 34.00, NULL);
INSERT INTO public.moon VALUES (13, 3, 'Bianca', NULL, NULL, true, NULL, 45.00, NULL);
INSERT INTO public.moon VALUES (14, 3, 'Puck', NULL, NULL, true, NULL, 16.00, NULL);
INSERT INTO public.moon VALUES (15, 3, 'Setebos', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.moon VALUES (16, 4, 'Triton', NULL, NULL, true, NULL, 5.00, NULL);
INSERT INTO public.moon VALUES (17, 4, 'Neso', NULL, NULL, true, NULL, 6.00, NULL);
INSERT INTO public.moon VALUES (18, 4, 'Galates', NULL, NULL, true, NULL, 8.00, NULL);
INSERT INTO public.moon VALUES (19, 4, 'Despina', NULL, NULL, true, NULL, 12.00, NULL);
INSERT INTO public.moon VALUES (20, 4, 'Thalasa', NULL, NULL, true, NULL, 48.00, NULL);
INSERT INTO public.moon VALUES (21, 5, 'Moon', NULL, NULL, true, NULL, 4.00, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Jupiter', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.planet VALUES (2, 1, 'Saturn', NULL, NULL, true, NULL, 26.00, NULL);
INSERT INTO public.planet VALUES (3, 1, 'Uranus', NULL, NULL, true, NULL, 15.00, NULL);
INSERT INTO public.planet VALUES (4, 1, 'Neptune', NULL, NULL, true, NULL, 20.00, NULL);
INSERT INTO public.planet VALUES (5, 1, 'Earth', NULL, NULL, true, NULL, 1.00, NULL);
INSERT INTO public.planet VALUES (6, 1, 'Venus', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.planet VALUES (7, 1, 'Mars', NULL, NULL, true, NULL, 17.00, NULL);
INSERT INTO public.planet VALUES (8, 1, 'Mercury', NULL, NULL, true, NULL, 5.00, NULL);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.planet VALUES (10, 1, 'Eris', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.planet VALUES (11, 1, 'Haumea', NULL, NULL, true, NULL, 5.00, NULL);
INSERT INTO public.planet VALUES (12, 1, 'isie', NULL, NULL, true, NULL, 34.00, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 3, 'SUN', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.star VALUES (2, 3, 'Sirus', NULL, NULL, false, NULL, 26.00, NULL);
INSERT INTO public.star VALUES (3, 3, 'Canopus', NULL, NULL, true, NULL, 15.00, NULL);
INSERT INTO public.star VALUES (4, 3, 'Alpha Centauri', NULL, NULL, false, NULL, 20.00, NULL);
INSERT INTO public.star VALUES (5, 3, 'Rigel', NULL, NULL, true, NULL, 12.00, NULL);
INSERT INTO public.star VALUES (6, 3, 'Procyon ', NULL, NULL, true, NULL, 7.00, NULL);
INSERT INTO public.star VALUES (7, 3, 'Betelgeuse', NULL, NULL, true, NULL, 15.00, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planet_galaxy_planet_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: galaxy_planet galaxy_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_name_key UNIQUE (name);


--
-- Name: galaxy_planet galaxy_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_pkey PRIMARY KEY (galaxy_planet_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

