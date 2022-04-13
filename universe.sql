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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    name character varying(30) NOT NULL,
    type character varying(30),
    solar_mass character varying(30),
    distance_mlight_years integer NOT NULL,
    super_massive boolean,
    constellation character varying(30),
    black_hole_id integer NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    distance_in_light_years integer NOT NULL,
    diameter_in_light_years numeric(10,2),
    constellation character varying(30)
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
    name character varying(30) NOT NULL,
    moon_type character varying(30),
    diameter integer,
    radius numeric(10,2),
    distance_in_millns integer NOT NULL,
    planet_id integer
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
    name character varying(30) NOT NULL,
    type character varying(30),
    mass character varying(30),
    distance_in_millions_km integer NOT NULL,
    diameter integer,
    suitable_of_life boolean,
    description text,
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_m_years integer,
    star character varying(30),
    diameter_in_mlls integer,
    surface_temp_k integer,
    mass character varying(30),
    distance integer NOT NULL,
    brightness character varying(30),
    galaxy_id integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES ('Cygnus X-1', 'Microquasar', '21 Sm', 6197, false, 'Cisne', 1);
INSERT INTO public.black_hole VALUES ('Messier 87', 'Quasar', '6600 Sm', 53, true, 'Virgo', 2);
INSERT INTO public.black_hole VALUES ('TON 618', 'Hyperluminous quasar', '66000 Sm', 10370, true, 'Canes Venatici', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky way', 'Spiral', 200000, 0.00, '');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', 29000000, 100000.00, 'Virgo');
INSERT INTO public.galaxy VALUES (5, 'NGC 7479', 'Irregular spiral', 105000000, 0.00, 'Pegasus');
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 'Irregular', 12000000, 0.00, 'Osa Mayor');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Spiral', 220000, 2500000.00, 'Andromeda');
INSERT INTO public.galaxy VALUES (1, 'Messier 33', 'Spiral', 2800000, 50000.00, 'Triangulum');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Spherical', 3476, 1738.00, 384400, 10);
INSERT INTO public.moon VALUES (2, 'Titan', 'Spherical', 5158, 2574.00, 1272, 6);
INSERT INTO public.moon VALUES (3, 'Europa', 'Spherical', 3120, 1560.00, 628, 7);
INSERT INTO public.moon VALUES (4, 'Ganimedes', 'Spherical', 5268, 2634.00, 628, 7);
INSERT INTO public.moon VALUES (5, 'Encelado', 'Spherical', 500, 150.00, 1272, 6);
INSERT INTO public.moon VALUES (6, 'Mimas', 'Irregular spherical', 397, 198.00, 1272, 6);
INSERT INTO public.moon VALUES (7, 'Hyperion', 'Spherical', 270, 135.00, 1272, 6);
INSERT INTO public.moon VALUES (8, 'Calisto', 'Spherical', 4836, 2410.00, 628, 7);
INSERT INTO public.moon VALUES (9, 'Tritón', 'Spherical', 2706, 1353.00, 4338, 12);
INSERT INTO public.moon VALUES (10, 'IO', 'Irregular spherical', 3642, 1821.00, 628, 7);
INSERT INTO public.moon VALUES (11, 'Fobos', 'Irregular', 22534, 11267.00, 100, 8);
INSERT INTO public.moon VALUES (12, 'Deimos', 'Irregular', 12, 6.00, 100, 8);
INSERT INTO public.moon VALUES (17, 'Proteo', 'Irregular', 105, 210.00, 4300, 12);
INSERT INTO public.moon VALUES (18, 'Neso', 'Irregular', 60, 30.00, 4300, 12);
INSERT INTO public.moon VALUES (19, 'Rea', 'Spherical', 1528, 764.30, 4300, 6);
INSERT INTO public.moon VALUES (20, 'Dione', 'Irregular spherical', 1022, 561.00, 1272, 6);
INSERT INTO public.moon VALUES (21, 'Dafne', 'Irregular', 8, 4.00, 1272, 6);
INSERT INTO public.moon VALUES (22, 'Febe', 'Irregular', 220, 110.00, 1272, 6);
INSERT INTO public.moon VALUES (23, 'Metone', 'Irregular', 3, 1.50, 1272, 6);
INSERT INTO public.moon VALUES (24, 'Atlas', 'Irregular', 31, 15.50, 1272, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Kepler-186c', 'rocky planet', '', 492, 0, false, 'edit', 16);
INSERT INTO public.planet VALUES (2, 'Kepler-186e', 'rocky planet', '', 492, 0, false, 'edit', 16);
INSERT INTO public.planet VALUES (3, 'Kepler-186d', 'Super-earth', '', 492, 0, false, 'edit', 16);
INSERT INTO public.planet VALUES (4, 'Proxima b', 'rocky planet', '1,27 Em', 4, 0, true, 'edit', 14);
INSERT INTO public.planet VALUES (5, 'Kepler-186f', 'rocky planet', '', 492, 0, true, 'edit', 16);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gaseous planet', '5,688 x 10^26 kg', 1195, 120536, false, 'edit', 2);
INSERT INTO public.planet VALUES (7, 'Jupiter', 'gaseous planet', '1,899 x 10^27 kg', 588, 142984, false, 'edit', 2);
INSERT INTO public.planet VALUES (8, 'Marte', 'rocky planet', '6,4185 x 10^23 kg', 55, 6794, false, 'edit', 2);
INSERT INTO public.planet VALUES (9, 'Mercury', 'rocky planet', '3302 x 10^23 kg', 82, 4879, false, 'edit', 2);
INSERT INTO public.planet VALUES (10, 'Earth', 'rocky planet', '5,9736 x 10^24 kg', 0, 12756, true, 'edit', 2);
INSERT INTO public.planet VALUES (11, 'Venus', 'rocky planet', '4,869 x 10^24 kg', 40, 12103, false, 'edit', 2);
INSERT INTO public.planet VALUES (12, 'Neptune', 'gaseous planet', '1,024 x 10^26 kg', 4338, 49572, false, 'edit', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4603, 'dwarf star', 1392000, 5505, '1,9891 x 10^30 kg', 15000000, 'yellow', 2);
INSERT INTO public.star VALUES (2, 'UY Scuti', 0, 'hypergiant star', 2376, 3365, '', 9500, 'red', 2);
INSERT INTO public.star VALUES (3, 'VY Canis Majoris', 0, 'Hypergiant star', 1975, 3490, '17 Sm', 4892, 'red', 2);
INSERT INTO public.star VALUES (4, 'STEPHENSON 2-18', 0, 'Hypergiant star', 2910, 3200, '', 19570, 'red', 2);
INSERT INTO public.star VALUES (5, 'Betelguese', 10000, 'Supergiant star', 1642, 3500, '18 Sm', 643, 'red', 2);
INSERT INTO public.star VALUES (6, 'R136a1', 0, 'Hypergiant star', 42000000, 50000, '5,271 X 10^32 kg', 163000, 'blue', 2);
INSERT INTO public.star VALUES (7, 'Altair', 630, 'Dwarf star', 2532400, 7700, '', 17, 'white', 2);
INSERT INTO public.star VALUES (8, 'Eta Carinae', 3002, 'Hypergiant star', 236755600, 40000, '100-200 Sm', 502, 'blue', 2);
INSERT INTO public.star VALUES (9, 'Antares', 11000, 'Supergiant star', 946160000, 3600, '16 Sm', 555, 'red', 2);
INSERT INTO public.star VALUES (10, 'Aldebaran', 6605, 'Giant star', 0, 4010, '1,7 Sm', 65, 'orange', 2);
INSERT INTO public.star VALUES (11, 'Canopus', 0, 'Supergiant star', 98789000, 7280, '7 Sm', 309, 'white-yellow', 2);
INSERT INTO public.star VALUES (12, 'Rigel', 8005, 'Supergiant star', 51529160, 11500, '18 Sm', 860, 'blue', 2);
INSERT INTO public.star VALUES (13, 'Sirio A', 200000, 'Dwarf star', 2400000, 10000, '2,02 Sm', 8611, 'white', 2);
INSERT INTO public.star VALUES (14, 'Alpha Centauri A', 1000, 'Dwarf star', 1671216, 5790, '2,167 x 10^30 kg', 4, 'yellow', 2);
INSERT INTO public.star VALUES (15, 'Vega', 383583333, 'Giant star', 3286400, 9602, '', 25, 'white', 2);
INSERT INTO public.star VALUES (16, 'Kepler 186', 0, 'Dwarf star', 727700, 3788, '1,082 x 10^30 kg', 493, 'red', 2);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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

