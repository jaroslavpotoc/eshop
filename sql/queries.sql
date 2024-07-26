--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Postgres.app)
-- Dumped by pg_dump version 16.3 (Postgres.app)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: product; Type: TABLE; Schema: public; Owner: jaroslavpotocny
--

CREATE TABLE public.product (
    pid integer NOT NULL,
    purchase_price_usd numeric(10,2) NOT NULL,
    rate_eur_usd numeric(5,4) NOT NULL,
    stock_quantity integer NOT NULL
);


ALTER TABLE public.product OWNER TO jaroslavpotocny;

--
-- Name: product_attribute; Type: TABLE; Schema: public; Owner: jaroslavpotocny
--

CREATE TABLE public.product_attribute (
    pid integer NOT NULL,
    paid boolean NOT NULL,
    purchase_price_usd numeric(10,2) NOT NULL,
    rate_eur_usd numeric(5,4) NOT NULL,
    stock_quantity integer NOT NULL
);


ALTER TABLE public.product_attribute OWNER TO jaroslavpotocny;

--
-- Name: product_pid_seq; Type: SEQUENCE; Schema: public; Owner: jaroslavpotocny
--

CREATE SEQUENCE public.product_pid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_pid_seq OWNER TO jaroslavpotocny;

--
-- Name: product_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jaroslavpotocny
--

ALTER SEQUENCE public.product_pid_seq OWNED BY public.product.pid;


--
-- Name: product pid; Type: DEFAULT; Schema: public; Owner: jaroslavpotocny
--

ALTER TABLE ONLY public.product ALTER COLUMN pid SET DEFAULT nextval('public.product_pid_seq'::regclass);


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: jaroslavpotocny
--

COPY public.product (pid, purchase_price_usd, rate_eur_usd, stock_quantity) FROM stdin;
1	100.00	0.8500	10
2	200.00	0.8500	5
3	150.00	0.8500	20
4	300.00	0.8500	7
5	120.00	0.8500	12
6	180.00	0.8500	8
7	250.00	0.8500	15
8	90.00	0.8500	30
9	210.00	0.8500	25
10	170.00	0.8500	10
\.


--
-- Data for Name: product_attribute; Type: TABLE DATA; Schema: public; Owner: jaroslavpotocny
--

COPY public.product_attribute (pid, paid, purchase_price_usd, rate_eur_usd, stock_quantity) FROM stdin;
1	t	95.00	0.8500	10
3	t	145.00	0.8500	20
5	t	115.00	0.8500	12
7	t	245.00	0.8500	15
9	t	205.00	0.8500	25
\.


--
-- Name: product_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: jaroslavpotocny
--

SELECT pg_catalog.setval('public.product_pid_seq', 10, true);


--
-- Name: product_attribute product_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: jaroslavpotocny
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_pkey PRIMARY KEY (pid);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: jaroslavpotocny
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (pid);


--
-- Name: product_attribute product_attribute_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jaroslavpotocny
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_pid_fkey FOREIGN KEY (pid) REFERENCES public.product(pid);


--
-- PostgreSQL database dump complete
--

