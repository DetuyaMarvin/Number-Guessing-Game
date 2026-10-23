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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('user_1792715747580', 2, 194);
INSERT INTO public.games VALUES ('user_1792715747581', 5, 655);
INSERT INTO public.games VALUES ('user_1792715765085', 2, 160);
INSERT INTO public.games VALUES ('user_1792715765086', 5, 229);
INSERT INTO public.games VALUES ('user_1792715789663', 2, 100);
INSERT INTO public.games VALUES ('user_1792715789664', 5, 28);
INSERT INTO public.games VALUES ('user_1792715800643', 2, 151);
INSERT INTO public.games VALUES ('user_1792715800644', 5, 225);
INSERT INTO public.games VALUES ('user_1792715813226', 2, 49);
INSERT INTO public.games VALUES ('user_1792715813227', 5, 555);
INSERT INTO public.games VALUES ('user_1792715962214', 2, 907);
INSERT INTO public.games VALUES ('user_1792715962215', 5, 324);
INSERT INTO public.games VALUES ('user_1792716143492', 2, 333);
INSERT INTO public.games VALUES ('user_1792716143493', 5, 85);
INSERT INTO public.games VALUES ('user_1792716190471', 2, 70);
INSERT INTO public.games VALUES ('user_1792716190472', 5, 88);
INSERT INTO public.games VALUES ('user_1792716230802', 2, 444);
INSERT INTO public.games VALUES ('user_1792716230803', 5, 186);


--
-- Name: games games_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

