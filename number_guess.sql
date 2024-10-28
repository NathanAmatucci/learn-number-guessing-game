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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    users_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_users_id_seq OWNER TO freecodecamp;

--
-- Name: users_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_users_id_seq OWNED BY public.users.users_id;


--
-- Name: users users_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN users_id SET DEFAULT nextval('public.users_users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1730144627762', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1730144627762', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1730144627761', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1730144627761', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1730144627762', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1730144627762', 0, NULL);
INSERT INTO public.users VALUES (7, 'user_1730144627762', 0, NULL);
INSERT INTO public.users VALUES (8, 'user_1730144684207', 0, NULL);
INSERT INTO public.users VALUES (9, 'user_1730144684207', 0, NULL);
INSERT INTO public.users VALUES (10, 'user_1730144684206', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1730144684206', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1730144684207', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1730144684207', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1730144684207', 0, NULL);
INSERT INTO public.users VALUES (15, 'user_1730144801015', 0, NULL);
INSERT INTO public.users VALUES (16, 'user_1730144801015', 0, NULL);
INSERT INTO public.users VALUES (17, 'user_1730144801014', 0, NULL);
INSERT INTO public.users VALUES (18, 'user_1730144801014', 0, NULL);
INSERT INTO public.users VALUES (19, 'user_1730144801015', 0, NULL);
INSERT INTO public.users VALUES (20, 'user_1730144801015', 0, NULL);
INSERT INTO public.users VALUES (21, 'user_1730144801015', 0, NULL);
INSERT INTO public.users VALUES (22, 'NATE', 0, NULL);
INSERT INTO public.users VALUES (24, 'Nate', 1, 15);
INSERT INTO public.users VALUES (26, 'user_1730144959716', 2, 309);
INSERT INTO public.users VALUES (25, 'user_1730144959717', 5, 55);
INSERT INTO public.users VALUES (23, 'nate', 1, 13);
INSERT INTO public.users VALUES (28, 'user_1730145045860', 2, 735);
INSERT INTO public.users VALUES (27, 'user_1730145045861', 5, 106);


--
-- Name: users_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_users_id_seq', 28, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (users_id);


--
-- PostgreSQL database dump complete
--

