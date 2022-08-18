--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_billions_of_years numeric,
    diameter_in_light_years integer,
    distance_from_earth_in_million_light_years integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_billions_of_years numeric,
    diameter_in_kilometers integer,
    distance_from_earth_in_light_years integer
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
    planet_type_id integer,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_billions_of_years numeric,
    diameter_in_kilometers integer,
    distance_from_earth_in_light_years integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_billions_of_years numeric,
    diameter_in_kilometers integer,
    distance_from_earth_in_light_years integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, ' GalaxyName 1 ', ' Please place your description!', true, false, 548, 656897, 64);
INSERT INTO public.galaxy VALUES (3, ' GalaxyName 2 ', ' Please place your description!', true, false, 855, 416858, 77);
INSERT INTO public.galaxy VALUES (4, ' GalaxyName 3 ', ' Please place your description!', true, false, 202, 459385, 15);
INSERT INTO public.galaxy VALUES (5, ' GalaxyName 4 ', ' Please place your description!', true, false, 596, 988957, 13);
INSERT INTO public.galaxy VALUES (6, ' GalaxyName 5 ', ' Please place your description!', true, false, 177, 961796, 0);
INSERT INTO public.galaxy VALUES (7, ' GalaxyName 6 ', ' Please place your description!', true, false, 729, 234027, 71);
INSERT INTO public.galaxy VALUES (8, ' GalaxyName 7 ', ' Please place your description!', true, false, 96, 582106, 11);
INSERT INTO public.galaxy VALUES (9, ' GalaxyName 8 ', ' Please place your description!', true, false, 466, 910514, 6);
INSERT INTO public.galaxy VALUES (10, ' GalaxyName 9 ', ' Please place your description!', true, false, 625, 834062, 40);
INSERT INTO public.galaxy VALUES (11, ' GalaxyName 10 ', ' Please place your description!', true, false, 375, 538428, 73);
INSERT INTO public.galaxy VALUES (12, ' GalaxyName 11 ', ' Please place your description!', true, false, 379, 613740, 70);
INSERT INTO public.galaxy VALUES (13, ' GalaxyName 12 ', ' Please place your description!', true, false, 660, 528091, 9);
INSERT INTO public.galaxy VALUES (14, ' GalaxyName 13 ', ' Please place your description!', true, false, 756, 517599, 40);
INSERT INTO public.galaxy VALUES (15, ' GalaxyName 14 ', ' Please place your description!', true, false, 253, 371688, 74);
INSERT INTO public.galaxy VALUES (16, ' GalaxyName 15 ', ' Please place your description!', true, false, 926, 398967, 91);
INSERT INTO public.galaxy VALUES (17, ' GalaxyName 16 ', ' Please place your description!', true, false, 662, 535038, 99);
INSERT INTO public.galaxy VALUES (18, ' GalaxyName 17 ', ' Please place your description!', true, false, 663, 454259, 52);
INSERT INTO public.galaxy VALUES (19, ' GalaxyName 18 ', ' Please place your description!', true, false, 502, 96034, 51);
INSERT INTO public.galaxy VALUES (20, ' GalaxyName 19 ', ' Please place your description!', true, false, 358, 753456, 44);
INSERT INTO public.galaxy VALUES (21, ' GalaxyName 20 ', ' Please place your description!', true, false, 905, 150298, 85);
INSERT INTO public.galaxy VALUES (22, ' GalaxyName 21 ', ' Please place your description!', true, false, 307, 389293, 55);
INSERT INTO public.galaxy VALUES (23, ' GalaxyName 22 ', ' Please place your description!', true, false, 205, 158152, 72);
INSERT INTO public.galaxy VALUES (24, ' GalaxyName 23 ', ' Please place your description!', true, false, 813, 22910, 46);
INSERT INTO public.galaxy VALUES (25, ' GalaxyName 24 ', ' Please place your description!', true, false, 401, 649808, 40);
INSERT INTO public.galaxy VALUES (26, ' GalaxyName 25 ', ' Please place your description!', true, false, 114, 292210, 83);
INSERT INTO public.galaxy VALUES (27, ' GalaxyName 26 ', ' Please place your description!', true, false, 59, 907198, 81);
INSERT INTO public.galaxy VALUES (28, ' GalaxyName 27 ', ' Please place your description!', true, false, 949, 227089, 80);
INSERT INTO public.galaxy VALUES (29, ' GalaxyName 28 ', ' Please place your description!', true, false, 553, 262314, 87);
INSERT INTO public.galaxy VALUES (30, ' GalaxyName 29 ', ' Please place your description!', true, false, 644, 767502, 15);
INSERT INTO public.galaxy VALUES (31, ' GalaxyName 30 ', ' Please place your description!', true, false, 884, 95714, 19);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (30, 92, ' MoonName 1 ', ' Please place your description!  ', false, true, 590, 41361729, 50);
INSERT INTO public.moon VALUES (31, 93, ' MoonName 2 ', ' Please place your description!  ', false, true, 702, 2696581, 8);
INSERT INTO public.moon VALUES (32, 94, ' MoonName 3 ', ' Please place your description!  ', false, true, 524, 580733, 8);
INSERT INTO public.moon VALUES (33, 95, ' MoonName 4 ', ' Please place your description!  ', false, true, 638, 86942909, 41);
INSERT INTO public.moon VALUES (34, 96, ' MoonName 5 ', ' Please place your description!  ', false, true, 836, 93955038, 30);
INSERT INTO public.moon VALUES (35, 97, ' MoonName 6 ', ' Please place your description!  ', false, true, 860, 55222645, 90);
INSERT INTO public.moon VALUES (36, 98, ' MoonName 7 ', ' Please place your description!  ', false, true, 295, 35671248, 16);
INSERT INTO public.moon VALUES (37, 99, ' MoonName 8 ', ' Please place your description!  ', false, true, 713, 56866692, 97);
INSERT INTO public.moon VALUES (38, 100, ' MoonName 9 ', ' Please place your description!  ', false, true, 17, 29971743, 43);
INSERT INTO public.moon VALUES (39, 101, ' MoonName 10 ', ' Please place your description!  ', false, true, 547, 23206487, 21);
INSERT INTO public.moon VALUES (40, 102, ' MoonName 11 ', ' Please place your description!  ', false, true, 309, 13154108, 6);
INSERT INTO public.moon VALUES (41, 103, ' MoonName 12 ', ' Please place your description!  ', false, true, 409, 11118115, 49);
INSERT INTO public.moon VALUES (42, 104, ' MoonName 13 ', ' Please place your description!  ', false, true, 293, 11151709, 20);
INSERT INTO public.moon VALUES (43, 105, ' MoonName 14 ', ' Please place your description!  ', false, true, 49, 70106454, 63);
INSERT INTO public.moon VALUES (44, 106, ' MoonName 15 ', ' Please place your description!  ', false, true, 292, 94735164, 71);
INSERT INTO public.moon VALUES (45, 107, ' MoonName 16 ', ' Please place your description!  ', false, true, 418, 66885026, 69);
INSERT INTO public.moon VALUES (46, 108, ' MoonName 17 ', ' Please place your description!  ', false, true, 483, 96625242, 38);
INSERT INTO public.moon VALUES (47, 109, ' MoonName 18 ', ' Please place your description!  ', false, true, 398, 95627343, 97);
INSERT INTO public.moon VALUES (48, 110, ' MoonName 19 ', ' Please place your description!  ', false, true, 260, 39625630, 79);
INSERT INTO public.moon VALUES (49, 111, ' MoonName 20 ', ' Please place your description!  ', false, true, 716, 2385140, 63);
INSERT INTO public.moon VALUES (50, 112, ' MoonName 21 ', ' Please place your description!  ', false, true, 485, 50452612, 91);
INSERT INTO public.moon VALUES (51, 113, ' MoonName 22 ', ' Please place your description!  ', false, true, 731, 47997827, 79);
INSERT INTO public.moon VALUES (52, 114, ' MoonName 23 ', ' Please place your description!  ', false, true, 391, 9404652, 41);
INSERT INTO public.moon VALUES (53, 115, ' MoonName 24 ', ' Please place your description!  ', false, true, 663, 30276129, 45);
INSERT INTO public.moon VALUES (54, 116, ' MoonName 25 ', ' Please place your description!  ', false, true, 988, 72505612, 57);
INSERT INTO public.moon VALUES (55, 117, ' MoonName 26 ', ' Please place your description!  ', false, true, 220, 85481049, 95);
INSERT INTO public.moon VALUES (56, 118, ' MoonName 27 ', ' Please place your description!  ', false, true, 325, 40639325, 3);
INSERT INTO public.moon VALUES (57, 119, ' MoonName 28 ', ' Please place your description!  ', false, true, 3, 58161469, 76);
INSERT INTO public.moon VALUES (58, 120, ' MoonName 29 ', ' Please place your description!  ', false, true, 976, 32317564, 85);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (92, 30, 1, ' PlanetName 1 ', ' Please place your description!  ', false, true, 300, 63640844, 4);
INSERT INTO public.planet VALUES (93, 31, 3, ' PlanetName 2 ', ' Please place your description!  ', false, true, 520, 10610776, 71);
INSERT INTO public.planet VALUES (94, 32, 1, ' PlanetName 3 ', ' Please place your description!  ', false, true, 707, 60576265, 84);
INSERT INTO public.planet VALUES (95, 33, 4, ' PlanetName 4 ', ' Please place your description!  ', false, true, 701, 32972476, 38);
INSERT INTO public.planet VALUES (96, 34, 3, ' PlanetName 5 ', ' Please place your description!  ', false, true, 219, 98297213, 35);
INSERT INTO public.planet VALUES (97, 35, 1, ' PlanetName 6 ', ' Please place your description!  ', false, true, 718, 66846149, 71);
INSERT INTO public.planet VALUES (98, 36, 2, ' PlanetName 7 ', ' Please place your description!  ', false, true, 360, 78435885, 59);
INSERT INTO public.planet VALUES (99, 37, 1, ' PlanetName 8 ', ' Please place your description!  ', false, true, 348, 58244444, 18);
INSERT INTO public.planet VALUES (100, 38, 3, ' PlanetName 9 ', ' Please place your description!  ', false, true, 695, 47625194, 1);
INSERT INTO public.planet VALUES (101, 39, 4, ' PlanetName 10 ', ' Please place your description!  ', false, true, 835, 83768614, 1);
INSERT INTO public.planet VALUES (102, 40, 4, ' PlanetName 11 ', ' Please place your description!  ', false, true, 105, 20530524, 39);
INSERT INTO public.planet VALUES (103, 41, 3, ' PlanetName 12 ', ' Please place your description!  ', false, true, 197, 20364381, 2);
INSERT INTO public.planet VALUES (104, 42, 2, ' PlanetName 13 ', ' Please place your description!  ', false, true, 608, 86591732, 52);
INSERT INTO public.planet VALUES (105, 43, 1, ' PlanetName 14 ', ' Please place your description!  ', false, true, 722, 45633975, 15);
INSERT INTO public.planet VALUES (106, 44, 4, ' PlanetName 15 ', ' Please place your description!  ', false, true, 740, 64293937, 40);
INSERT INTO public.planet VALUES (107, 45, 3, ' PlanetName 16 ', ' Please place your description!  ', false, true, 590, 81059734, 96);
INSERT INTO public.planet VALUES (108, 46, 3, ' PlanetName 17 ', ' Please place your description!  ', false, true, 756, 63990894, 69);
INSERT INTO public.planet VALUES (109, 47, 4, ' PlanetName 18 ', ' Please place your description!  ', false, true, 42, 56188597, 93);
INSERT INTO public.planet VALUES (110, 48, 2, ' PlanetName 19 ', ' Please place your description!  ', false, true, 349, 65521062, 21);
INSERT INTO public.planet VALUES (111, 49, 3, ' PlanetName 20 ', ' Please place your description!  ', false, true, 919, 89086437, 32);
INSERT INTO public.planet VALUES (112, 50, 1, ' PlanetName 21 ', ' Please place your description!  ', false, true, 392, 37902103, 13);
INSERT INTO public.planet VALUES (113, 51, 1, ' PlanetName 22 ', ' Please place your description!  ', false, true, 345, 63018207, 92);
INSERT INTO public.planet VALUES (114, 52, 2, ' PlanetName 23 ', ' Please place your description!  ', false, true, 119, 47275550, 2);
INSERT INTO public.planet VALUES (115, 53, 3, ' PlanetName 24 ', ' Please place your description!  ', false, true, 763, 73157111, 2);
INSERT INTO public.planet VALUES (116, 54, 5, ' PlanetName 25 ', ' Please place your description!  ', false, true, 855, 41771808, 11);
INSERT INTO public.planet VALUES (117, 55, 4, ' PlanetName 26 ', ' Please place your description!  ', false, true, 520, 38303108, 62);
INSERT INTO public.planet VALUES (118, 56, 1, ' PlanetName 27 ', ' Please place your description!  ', false, true, 245, 10015030, 49);
INSERT INTO public.planet VALUES (119, 57, 4, ' PlanetName 28 ', ' Please place your description!  ', false, true, 451, 7011211, 69);
INSERT INTO public.planet VALUES (120, 58, 5, ' PlanetName 29 ', ' Please place your description!  ', false, true, 765, 55147140, 38);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, ' TypeName 1 ', ' Please place your description!  ');
INSERT INTO public.planet_type VALUES (2, ' TypeName 2 ', ' Please place your description!  ');
INSERT INTO public.planet_type VALUES (3, ' TypeName 3 ', ' Please place your description!  ');
INSERT INTO public.planet_type VALUES (4, ' TypeName 4 ', ' Please place your description!  ');
INSERT INTO public.planet_type VALUES (5, ' TypeName 5 ', ' Please place your description!  ');
INSERT INTO public.planet_type VALUES (6, ' TypeName 6 ', ' Please place your description!  ');
INSERT INTO public.planet_type VALUES (7, ' TypeName 7 ', ' Please place your description!  ');
INSERT INTO public.planet_type VALUES (8, ' TypeName 8 ', ' Please place your description!  ');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (30, 26, ' StarName 1 ', ' Please place your description!  ', false, true, 585, 94989370, 23);
INSERT INTO public.star VALUES (31, 25, ' StarName 2 ', ' Please place your description!  ', false, true, 227, 52649781, 91);
INSERT INTO public.star VALUES (32, 18, ' StarName 3 ', ' Please place your description!  ', false, true, 931, 52928090, 51);
INSERT INTO public.star VALUES (33, 24, ' StarName 4 ', ' Please place your description!  ', false, true, 992, 10943502, 21);
INSERT INTO public.star VALUES (34, 26, ' StarName 5 ', ' Please place your description!  ', false, true, 756, 29250007, 50);
INSERT INTO public.star VALUES (35, 7, ' StarName 6 ', ' Please place your description!  ', false, true, 516, 48582289, 1);
INSERT INTO public.star VALUES (36, 17, ' StarName 7 ', ' Please place your description!  ', false, true, 59, 93428499, 65);
INSERT INTO public.star VALUES (37, 27, ' StarName 8 ', ' Please place your description!  ', false, true, 135, 74806849, 1);
INSERT INTO public.star VALUES (38, 13, ' StarName 9 ', ' Please place your description!  ', false, true, 619, 89168318, 1);
INSERT INTO public.star VALUES (39, 11, ' StarName 10 ', ' Please place your description!  ', false, true, 183, 96633810, 58);
INSERT INTO public.star VALUES (40, 19, ' StarName 11 ', ' Please place your description!  ', false, true, 41, 94906323, 41);
INSERT INTO public.star VALUES (41, 12, ' StarName 12 ', ' Please place your description!  ', false, true, 56, 81171948, 14);
INSERT INTO public.star VALUES (42, 15, ' StarName 13 ', ' Please place your description!  ', false, true, 852, 50887843, 34);
INSERT INTO public.star VALUES (43, 22, ' StarName 14 ', ' Please place your description!  ', false, true, 774, 35089589, 97);
INSERT INTO public.star VALUES (44, 8, ' StarName 15 ', ' Please place your description!  ', false, true, 136, 65312588, 73);
INSERT INTO public.star VALUES (45, 5, ' StarName 16 ', ' Please place your description!  ', false, true, 188, 43376191, 35);
INSERT INTO public.star VALUES (46, 19, ' StarName 17 ', ' Please place your description!  ', false, true, 408, 86123737, 71);
INSERT INTO public.star VALUES (47, 1, ' StarName 18 ', ' Please place your description!  ', false, true, 170, 18517754, 92);
INSERT INTO public.star VALUES (48, 30, ' StarName 19 ', ' Please place your description!  ', false, true, 538, 85964913, 0);
INSERT INTO public.star VALUES (49, 12, ' StarName 20 ', ' Please place your description!  ', false, true, 737, 86790448, 37);
INSERT INTO public.star VALUES (50, 7, ' StarName 21 ', ' Please place your description!  ', false, true, 729, 59407104, 29);
INSERT INTO public.star VALUES (51, 30, ' StarName 22 ', ' Please place your description!  ', false, true, 681, 58560062, 70);
INSERT INTO public.star VALUES (52, 13, ' StarName 23 ', ' Please place your description!  ', false, true, 766, 14438155, 43);
INSERT INTO public.star VALUES (53, 22, ' StarName 24 ', ' Please place your description!  ', false, true, 794, 9053833, 90);
INSERT INTO public.star VALUES (54, 21, ' StarName 25 ', ' Please place your description!  ', false, true, 409, 41615288, 77);
INSERT INTO public.star VALUES (55, 9, ' StarName 26 ', ' Please place your description!  ', false, true, 740, 73229324, 23);
INSERT INTO public.star VALUES (56, 15, ' StarName 27 ', ' Please place your description!  ', false, true, 308, 9006879, 21);
INSERT INTO public.star VALUES (57, 8, ' StarName 28 ', ' Please place your description!  ', false, true, 543, 91461304, 96);
INSERT INTO public.star VALUES (58, 15, ' StarName 29 ', ' Please place your description!  ', false, true, 643, 78779102, 73);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 31, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 58, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 120, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 59, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

