--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    title character varying,
    text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    keywords text
);


ALTER TABLE articles OWNER TO zhoamyqlqhrpnu;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: zhoamyqlqhrpnu
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_id_seq OWNER TO zhoamyqlqhrpnu;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    commenter character varying,
    body text,
    article_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE comments OWNER TO zhoamyqlqhrpnu;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: zhoamyqlqhrpnu
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO zhoamyqlqhrpnu;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: letters; Type: TABLE; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE TABLE letters (
    id integer NOT NULL,
    subject character varying,
    body text,
    name character varying,
    address character varying,
    city character varying,
    zip character varying,
    email1 character varying,
    email2 character varying,
    name1 character varying,
    name2 character varying,
    ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE letters OWNER TO zhoamyqlqhrpnu;

--
-- Name: letters_id_seq; Type: SEQUENCE; Schema: public; Owner: zhoamyqlqhrpnu
--

CREATE SEQUENCE letters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE letters_id_seq OWNER TO zhoamyqlqhrpnu;

--
-- Name: letters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER SEQUENCE letters_id_seq OWNED BY letters.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO zhoamyqlqhrpnu;

--
-- Name: subscribers; Type: TABLE; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE TABLE subscribers (
    id integer NOT NULL,
    email character varying,
    zip integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE subscribers OWNER TO zhoamyqlqhrpnu;

--
-- Name: subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: zhoamyqlqhrpnu
--

CREATE SEQUENCE subscribers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subscribers_id_seq OWNER TO zhoamyqlqhrpnu;

--
-- Name: subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER SEQUENCE subscribers_id_seq OWNED BY subscribers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin boolean DEFAULT false
);


ALTER TABLE users OWNER TO zhoamyqlqhrpnu;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: zhoamyqlqhrpnu
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO zhoamyqlqhrpnu;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER TABLE ONLY letters ALTER COLUMN id SET DEFAULT nextval('letters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER TABLE ONLY subscribers ALTER COLUMN id SET DEFAULT nextval('subscribers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY articles (id, title, text, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, keywords) FROM stdin;
1	title one	body text	2015-06-15 01:21:17.830838	2015-06-15 03:25:14.473946	dark-grey_00407949.jpg	image/jpeg	1550195	2015-06-15 03:25:10.411687	title one body text
2	Second test post from cell browser	econd test post from cell econd test post from cell econd test post from cell browser	2015-06-15 05:58:23.901454	2015-06-15 05:58:23.901454	password.jpg	image/jpeg	101435	2015-06-15 05:58:21.504686	second test post from cell browser econd test post from cell econd test post from cell econd test post from cell browser
3	Third post testing 	Third post testing.	2015-06-15 05:59:35.960491	2015-06-15 05:59:35.960491	de6eab688575a8ac374e2dded6d8602f.jpg	image/jpeg	60065	2015-06-15 05:59:34.303209	third post testing  third post testing.
4	Four post testing layouts yadayada	Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts yadayada	2015-06-15 06:01:24.77544	2015-06-15 11:55:46.483836	password.jpg	image/jpeg	101435	2015-06-15 11:55:44.66536	four post testing layouts yadayada four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts yadayada
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhoamyqlqhrpnu
--

SELECT pg_catalog.setval('articles_id_seq', 4, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY comments (id, commenter, body, article_id, created_at, updated_at) FROM stdin;
1	Al	Wtf	4	2015-06-15 06:01:41.238231	2015-06-15 06:01:41.238231
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhoamyqlqhrpnu
--

SELECT pg_catalog.setval('comments_id_seq', 1, true);


--
-- Data for Name: letters; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY letters (id, subject, body, name, address, city, zip, email1, email2, name1, name2, ip, created_at, updated_at) FROM stdin;
\.


--
-- Name: letters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhoamyqlqhrpnu
--

SELECT pg_catalog.setval('letters_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY schema_migrations (version) FROM stdin;
20150310032844
20150310181944
20150320162828
20150403173041
20150418213704
20150420171546
20150609060536
20150611051020
\.


--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY subscribers (id, email, zip, created_at, updated_at) FROM stdin;
1	amsterdamAL@gmail.com	33186	2015-06-15 01:25:25.437097	2015-06-15 01:25:25.437097
\.


--
-- Name: subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhoamyqlqhrpnu
--

SELECT pg_catalog.setval('subscribers_id_seq', 1, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at, admin) FROM stdin;
1	amsterdamal@gmail.com	$2a$10$KNUp5EJNIx1DGaknuTnKheWaAjJ7sKOKgLycfZ8IQxaDtR0sD28XK	\N	\N	\N	4	2015-06-15 02:14:35.417594	2015-06-15 01:41:23.31456	108.95.169.155	166.172.189.63	\N	\N	\N	\N	2015-06-15 01:19:28.523276	2015-06-15 05:56:46.127524	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhoamyqlqhrpnu
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: letters_pkey; Type: CONSTRAINT; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

ALTER TABLE ONLY letters
    ADD CONSTRAINT letters_pkey PRIMARY KEY (id);


--
-- Name: subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

ALTER TABLE ONLY subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_article_id; Type: INDEX; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE INDEX index_comments_on_article_id ON comments USING btree (article_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: zhoamyqlqhrpnu; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_ffe33eb9b2; Type: FK CONSTRAINT; Schema: public; Owner: zhoamyqlqhrpnu
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_ffe33eb9b2 FOREIGN KEY (article_id) REFERENCES articles(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: zhoamyqlqhrpnu
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM zhoamyqlqhrpnu;
GRANT ALL ON SCHEMA public TO zhoamyqlqhrpnu;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

