--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11
-- Dumped by pg_dump version 12.11

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
-- Name: albums; Type: TABLE; Schema: public; Owner: michaelwright
--

CREATE TABLE public.albums (
    id bigint NOT NULL,
    name character varying,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    genre character varying
);


ALTER TABLE public.albums OWNER TO michaelwright;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: michaelwright
--

CREATE SEQUENCE public.albums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO michaelwright;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaelwright
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: michaelwright
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO michaelwright;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: michaelwright
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO michaelwright;

--
-- Name: songs; Type: TABLE; Schema: public; Owner: michaelwright
--

CREATE TABLE public.songs (
    id bigint NOT NULL,
    name character varying,
    lyrics character varying,
    album_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.songs OWNER TO michaelwright;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: michaelwright
--

CREATE SEQUENCE public.songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO michaelwright;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaelwright
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: michaelwright
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: michaelwright
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: michaelwright
--

COPY public.albums (id, name, year, created_at, updated_at, genre) FROM stdin;
2	Giant Steps	\N	2022-05-23 16:20:25.862582	2022-05-23 16:20:25.862582	\N
3	Toxicity	\N	2022-05-23 21:49:56.202425	2022-05-23 21:49:56.202425	
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: michaelwright
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-05-23 15:20:32.099854	2022-05-23 15:20:32.099854
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: michaelwright
--

COPY public.schema_migrations (version) FROM stdin;
20220523151232
20220523152645
20220523160431
20220523160557
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: michaelwright
--

COPY public.songs (id, name, lyrics, album_id, created_at, updated_at) FROM stdin;
2	asbd	aklsdfjla;ksj	2	2022-05-23 21:12:35.665094	2022-05-23 21:12:35.665094
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaelwright
--

SELECT pg_catalog.setval('public.albums_id_seq', 3, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaelwright
--

SELECT pg_catalog.setval('public.songs_id_seq', 2, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: michaelwright
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: michaelwright
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: michaelwright
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: michaelwright
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: songs fk_rails_f4e40cd655; Type: FK CONSTRAINT; Schema: public; Owner: michaelwright
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT fk_rails_f4e40cd655 FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- PostgreSQL database dump complete
--

