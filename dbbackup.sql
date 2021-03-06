toc.dat                                                                                             0000600 0004000 0002000 00000034245 12540454210 014444  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       7    "                s           d2otr5afm9q9hq    9.4.4    9.4.4 2               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                    1262    98807    d2otr5afm9q9hq    DATABASE     �   CREATE DATABASE d2otr5afm9q9hq WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d2otr5afm9q9hq;
             zhoamyqlqhrpnu    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             zhoamyqlqhrpnu    false                    0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  zhoamyqlqhrpnu    false    6                    0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM zhoamyqlqhrpnu;
GRANT ALL ON SCHEMA public TO zhoamyqlqhrpnu;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  zhoamyqlqhrpnu    false    6         �            3079    11861    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                    0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    183         �            1259    99139    articles    TABLE     |  CREATE TABLE articles (
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
    DROP TABLE public.articles;
       public         zhoamyqlqhrpnu    false    6         �            1259    99137    articles_id_seq    SEQUENCE     q   CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.articles_id_seq;
       public       zhoamyqlqhrpnu    false    6    174                    0    0    articles_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE articles_id_seq OWNED BY articles.id;
            public       zhoamyqlqhrpnu    false    173         �            1259    99150    comments    TABLE     �   CREATE TABLE comments (
    id integer NOT NULL,
    commenter character varying,
    body text,
    article_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.comments;
       public         zhoamyqlqhrpnu    false    6         �            1259    99148    comments_id_seq    SEQUENCE     q   CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public       zhoamyqlqhrpnu    false    6    176                    0    0    comments_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE comments_id_seq OWNED BY comments.id;
            public       zhoamyqlqhrpnu    false    175         �            1259    114160    letters    TABLE     �  CREATE TABLE letters (
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
    DROP TABLE public.letters;
       public         zhoamyqlqhrpnu    false    6         �            1259    114158    letters_id_seq    SEQUENCE     p   CREATE SEQUENCE letters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.letters_id_seq;
       public       zhoamyqlqhrpnu    false    182    6                    0    0    letters_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE letters_id_seq OWNED BY letters.id;
            public       zhoamyqlqhrpnu    false    181         �            1259    99130    schema_migrations    TABLE     K   CREATE TABLE schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         zhoamyqlqhrpnu    false    6         �            1259    101490    subscribers    TABLE     �   CREATE TABLE subscribers (
    id integer NOT NULL,
    email character varying,
    zip integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.subscribers;
       public         zhoamyqlqhrpnu    false    6         �            1259    101488    subscribers_id_seq    SEQUENCE     t   CREATE SEQUENCE subscribers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.subscribers_id_seq;
       public       zhoamyqlqhrpnu    false    6    180                    0    0    subscribers_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE subscribers_id_seq OWNED BY subscribers.id;
            public       zhoamyqlqhrpnu    false    179         �            1259    99167    users    TABLE     r  CREATE TABLE users (
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
    DROP TABLE public.users;
       public         zhoamyqlqhrpnu    false    6         �            1259    99165    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       zhoamyqlqhrpnu    false    178    6                    0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       zhoamyqlqhrpnu    false    177                    2604    99142    id    DEFAULT     \   ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);
 :   ALTER TABLE public.articles ALTER COLUMN id DROP DEFAULT;
       public       zhoamyqlqhrpnu    false    173    174    174         �           2604    99153    id    DEFAULT     \   ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public       zhoamyqlqhrpnu    false    175    176    176         �           2604    114163    id    DEFAULT     Z   ALTER TABLE ONLY letters ALTER COLUMN id SET DEFAULT nextval('letters_id_seq'::regclass);
 9   ALTER TABLE public.letters ALTER COLUMN id DROP DEFAULT;
       public       zhoamyqlqhrpnu    false    182    181    182         �           2604    101493    id    DEFAULT     b   ALTER TABLE ONLY subscribers ALTER COLUMN id SET DEFAULT nextval('subscribers_id_seq'::regclass);
 =   ALTER TABLE public.subscribers ALTER COLUMN id DROP DEFAULT;
       public       zhoamyqlqhrpnu    false    179    180    180         �           2604    99170    id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       zhoamyqlqhrpnu    false    178    177    178                   0    99139    articles 
   TABLE DATA               �   COPY articles (id, title, text, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, keywords) FROM stdin;
    public       zhoamyqlqhrpnu    false    174       2054.dat            0    0    articles_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('articles_id_seq', 4, true);
            public       zhoamyqlqhrpnu    false    173                   0    99150    comments 
   TABLE DATA               T   COPY comments (id, commenter, body, article_id, created_at, updated_at) FROM stdin;
    public       zhoamyqlqhrpnu    false    176       2056.dat            0    0    comments_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('comments_id_seq', 1, true);
            public       zhoamyqlqhrpnu    false    175                   0    114160    letters 
   TABLE DATA               �   COPY letters (id, subject, body, name, address, city, zip, email1, email2, name1, name2, ip, created_at, updated_at) FROM stdin;
    public       zhoamyqlqhrpnu    false    182       2062.dat            0    0    letters_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('letters_id_seq', 1, false);
            public       zhoamyqlqhrpnu    false    181                   0    99130    schema_migrations 
   TABLE DATA               -   COPY schema_migrations (version) FROM stdin;
    public       zhoamyqlqhrpnu    false    172       2052.dat           0    101490    subscribers 
   TABLE DATA               F   COPY subscribers (id, email, zip, created_at, updated_at) FROM stdin;
    public       zhoamyqlqhrpnu    false    180       2060.dat            0    0    subscribers_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('subscribers_id_seq', 2, true);
            public       zhoamyqlqhrpnu    false    179         
          0    99167    users 
   TABLE DATA               =  COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at, admin) FROM stdin;
    public       zhoamyqlqhrpnu    false    178       2058.dat             0    0    users_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('users_id_seq', 1, true);
            public       zhoamyqlqhrpnu    false    177         �           2606    99147    articles_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
       public         zhoamyqlqhrpnu    false    174    174         �           2606    99158    comments_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public         zhoamyqlqhrpnu    false    176    176         �           2606    114168    letters_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY letters
    ADD CONSTRAINT letters_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.letters DROP CONSTRAINT letters_pkey;
       public         zhoamyqlqhrpnu    false    182    182         �           2606    101498    subscribers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_pkey;
       public         zhoamyqlqhrpnu    false    180    180         �           2606    99178 
   users_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         zhoamyqlqhrpnu    false    178    178         �           1259    99159    index_comments_on_article_id    INDEX     P   CREATE INDEX index_comments_on_article_id ON comments USING btree (article_id);
 0   DROP INDEX public.index_comments_on_article_id;
       public         zhoamyqlqhrpnu    false    176         �           1259    99179    index_users_on_email    INDEX     G   CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);
 (   DROP INDEX public.index_users_on_email;
       public         zhoamyqlqhrpnu    false    178         �           1259    99180 #   index_users_on_reset_password_token    INDEX     e   CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);
 7   DROP INDEX public.index_users_on_reset_password_token;
       public         zhoamyqlqhrpnu    false    178         �           1259    99136    unique_schema_migrations    INDEX     Y   CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);
 ,   DROP INDEX public.unique_schema_migrations;
       public         zhoamyqlqhrpnu    false    172         �           2606    99160    fk_rails_ffe33eb9b2    FK CONSTRAINT     s   ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_ffe33eb9b2 FOREIGN KEY (article_id) REFERENCES articles(id);
 F   ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_rails_ffe33eb9b2;
       public       zhoamyqlqhrpnu    false    1930    176    174                                                                                                                                                                                                                                                                                                                                                                   2054.dat                                                                                            0000600 0004000 0002000 00000003037 12540454211 014245  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	title one	body text	2015-06-15 01:21:17.830838	2015-06-15 03:25:14.473946	dark-grey_00407949.jpg	image/jpeg	1550195	2015-06-15 03:25:10.411687	title one body text
2	Second test post from cell browser	econd test post from cell econd test post from cell econd test post from cell browser	2015-06-15 05:58:23.901454	2015-06-15 05:58:23.901454	password.jpg	image/jpeg	101435	2015-06-15 05:58:21.504686	second test post from cell browser econd test post from cell econd test post from cell econd test post from cell browser
3	Third post testing 	Third post testing.	2015-06-15 05:59:35.960491	2015-06-15 05:59:35.960491	de6eab688575a8ac374e2dded6d8602f.jpg	image/jpeg	60065	2015-06-15 05:59:34.303209	third post testing  third post testing.
4	Four post testing layouts yadayada	Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts Four post testing layouts yadayada	2015-06-15 06:01:24.77544	2015-06-15 11:55:46.483836	password.jpg	image/jpeg	101435	2015-06-15 11:55:44.66536	four post testing layouts yadayada four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts four post testing layouts yadayada
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 2056.dat                                                                                            0000600 0004000 0002000 00000000106 12540454211 014241  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Al	Wtf	4	2015-06-15 06:01:41.238231	2015-06-15 06:01:41.238231
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                          2062.dat                                                                                            0000600 0004000 0002000 00000000005 12540454211 014234  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2052.dat                                                                                            0000600 0004000 0002000 00000000175 12540454211 014243  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        20150310032844
20150310181944
20150320162828
20150403173041
20150418213704
20150420171546
20150609060536
20150611051020
\.


                                                                                                                                                                                                                                                                                                                                                                                                   2060.dat                                                                                            0000600 0004000 0002000 00000000256 12540454211 014242  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	amsterdamAL@gmail.com	33186	2015-06-15 01:25:25.437097	2015-06-15 01:25:25.437097
2	testuser@somewhere.com	33333	2015-06-18 04:44:43.061864	2015-06-18 04:44:43.061864
\.


                                                                                                                                                                                                                                                                                                                                                  2058.dat                                                                                            0000600 0004000 0002000 00000000374 12540454211 014252  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	amsterdamal@gmail.com	$2a$10$KNUp5EJNIx1DGaknuTnKheWaAjJ7sKOKgLycfZ8IQxaDtR0sD28XK	\N	\N	\N	4	2015-06-15 02:14:35.417594	2015-06-15 01:41:23.31456	108.95.169.155	166.172.189.63	\N	\N	\N	\N	2015-06-15 01:19:28.523276	2015-06-15 05:56:46.127524	t
\.


                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000032217 12540454211 015367  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.comments DROP CONSTRAINT fk_rails_ffe33eb9b2;
DROP INDEX public.unique_schema_migrations;
DROP INDEX public.index_users_on_reset_password_token;
DROP INDEX public.index_users_on_email;
DROP INDEX public.index_comments_on_article_id;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_pkey;
ALTER TABLE ONLY public.letters DROP CONSTRAINT letters_pkey;
ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
ALTER TABLE ONLY public.articles DROP CONSTRAINT articles_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.subscribers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.letters ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.articles ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.subscribers_id_seq;
DROP TABLE public.subscribers;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.letters_id_seq;
DROP TABLE public.letters;
DROP SEQUENCE public.comments_id_seq;
DROP TABLE public.comments;
DROP SEQUENCE public.articles_id_seq;
DROP TABLE public.articles;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: zhoamyqlqhrpnu
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO zhoamyqlqhrpnu;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: zhoamyqlqhrpnu
--

COMMENT ON SCHEMA public IS 'standard public schema';


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
\.
COPY articles (id, title, text, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, keywords) FROM '$$PATH$$/2054.dat';

--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhoamyqlqhrpnu
--

SELECT pg_catalog.setval('articles_id_seq', 4, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY comments (id, commenter, body, article_id, created_at, updated_at) FROM stdin;
\.
COPY comments (id, commenter, body, article_id, created_at, updated_at) FROM '$$PATH$$/2056.dat';

--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhoamyqlqhrpnu
--

SELECT pg_catalog.setval('comments_id_seq', 1, true);


--
-- Data for Name: letters; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY letters (id, subject, body, name, address, city, zip, email1, email2, name1, name2, ip, created_at, updated_at) FROM stdin;
\.
COPY letters (id, subject, body, name, address, city, zip, email1, email2, name1, name2, ip, created_at, updated_at) FROM '$$PATH$$/2062.dat';

--
-- Name: letters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhoamyqlqhrpnu
--

SELECT pg_catalog.setval('letters_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY schema_migrations (version) FROM stdin;
\.
COPY schema_migrations (version) FROM '$$PATH$$/2052.dat';

--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY subscribers (id, email, zip, created_at, updated_at) FROM stdin;
\.
COPY subscribers (id, email, zip, created_at, updated_at) FROM '$$PATH$$/2060.dat';

--
-- Name: subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zhoamyqlqhrpnu
--

SELECT pg_catalog.setval('subscribers_id_seq', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: zhoamyqlqhrpnu
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at, admin) FROM stdin;
\.
COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at, admin) FROM '$$PATH$$/2058.dat';

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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 