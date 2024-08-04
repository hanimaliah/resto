toc.dat                                                                                             0000600 0004000 0002000 00000031467 14653677520 0014471 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           |            resto    9.3.20    9.3.20 1    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           1262    374599    resto    DATABASE     �   CREATE DATABASE resto WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE resto;
             postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6         �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                     3079    11750    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1         �            1259    374602 
   categories    TABLE     p   CREATE TABLE categories (
    category_id integer NOT NULL,
    category_name character varying(50) NOT NULL
);
    DROP TABLE public.categories;
       public         postgres    false    6         �            1259    374600    categories_category_id_seq    SEQUENCE     |   CREATE SEQUENCE categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_category_id_seq;
       public       postgres    false    172    6         �           0    0    categories_category_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE categories_category_id_seq OWNED BY categories.category_id;
            public       postgres    false    171         �            1259    374661    detail_promo    TABLE     e   CREATE TABLE detail_promo (
    promo_id integer,
    product_id integer,
    price numeric(10,2)
);
     DROP TABLE public.detail_promo;
       public         postgres    false    6         �            1259    374623    meja    TABLE     f   CREATE TABLE meja (
    table_id integer NOT NULL,
    table_number character varying(50) NOT NULL
);
    DROP TABLE public.meja;
       public         postgres    false    6         �            1259    374645 
   orderitems    TABLE     �   CREATE TABLE orderitems (
    order_item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL
);
    DROP TABLE public.orderitems;
       public         postgres    false    6         �            1259    374643    orderitems_order_item_id_seq    SEQUENCE     ~   CREATE SEQUENCE orderitems_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.orderitems_order_item_id_seq;
       public       postgres    false    6    180         �           0    0    orderitems_order_item_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE orderitems_order_item_id_seq OWNED BY orderitems.order_item_id;
            public       postgres    false    179         �            1259    374631    orders    TABLE     �   CREATE TABLE orders (
    order_id integer NOT NULL,
    table_id integer,
    order_time timestamp without time zone DEFAULT now(),
    name character varying(20),
    subtotal integer DEFAULT 0,
    dibayar boolean DEFAULT false
);
    DROP TABLE public.orders;
       public         postgres    false    6         �            1259    374629    orders_order_id_seq    SEQUENCE     u   CREATE SEQUENCE orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public       postgres    false    6    178         �           0    0    orders_order_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE orders_order_id_seq OWNED BY orders.order_id;
            public       postgres    false    177         �            1259    374610    products    TABLE     �   CREATE TABLE products (
    product_id integer NOT NULL,
    product_name character varying(50) NOT NULL,
    category_id integer,
    variant character varying(50),
    price numeric(10,2) NOT NULL,
    promo_id integer
);
    DROP TABLE public.products;
       public         postgres    false    6         �            1259    374608    products_product_id_seq    SEQUENCE     y   CREATE SEQUENCE products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public       postgres    false    174    6         �           0    0    products_product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE products_product_id_seq OWNED BY products.product_id;
            public       postgres    false    173         �            1259    374621    tables_table_id_seq    SEQUENCE     u   CREATE SEQUENCE tables_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tables_table_id_seq;
       public       postgres    false    6    176         �           0    0    tables_table_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE tables_table_id_seq OWNED BY meja.table_id;
            public       postgres    false    175         ;           2604    374605    category_id    DEFAULT     r   ALTER TABLE ONLY categories ALTER COLUMN category_id SET DEFAULT nextval('categories_category_id_seq'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
       public       postgres    false    172    171    172         =           2604    374626    table_id    DEFAULT     b   ALTER TABLE ONLY meja ALTER COLUMN table_id SET DEFAULT nextval('tables_table_id_seq'::regclass);
 <   ALTER TABLE public.meja ALTER COLUMN table_id DROP DEFAULT;
       public       postgres    false    176    175    176         B           2604    374648    order_item_id    DEFAULT     v   ALTER TABLE ONLY orderitems ALTER COLUMN order_item_id SET DEFAULT nextval('orderitems_order_item_id_seq'::regclass);
 G   ALTER TABLE public.orderitems ALTER COLUMN order_item_id DROP DEFAULT;
       public       postgres    false    180    179    180         >           2604    374634    order_id    DEFAULT     d   ALTER TABLE ONLY orders ALTER COLUMN order_id SET DEFAULT nextval('orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public       postgres    false    177    178    178         <           2604    374613 
   product_id    DEFAULT     l   ALTER TABLE ONLY products ALTER COLUMN product_id SET DEFAULT nextval('products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public       postgres    false    174    173    174         �          0    374602 
   categories 
   TABLE DATA               9   COPY categories (category_id, category_name) FROM stdin;
    public       postgres    false    172       1981.dat �           0    0    categories_category_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('categories_category_id_seq', 3, true);
            public       postgres    false    171         �          0    374661    detail_promo 
   TABLE DATA               <   COPY detail_promo (promo_id, product_id, price) FROM stdin;
    public       postgres    false    181       1990.dat �          0    374623    meja 
   TABLE DATA               /   COPY meja (table_id, table_number) FROM stdin;
    public       postgres    false    176       1985.dat �          0    374645 
   orderitems 
   TABLE DATA               L   COPY orderitems (order_item_id, order_id, product_id, quantity) FROM stdin;
    public       postgres    false    180       1989.dat �           0    0    orderitems_order_item_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('orderitems_order_item_id_seq', 166, true);
            public       postgres    false    179         �          0    374631    orders 
   TABLE DATA               R   COPY orders (order_id, table_id, order_time, name, subtotal, dibayar) FROM stdin;
    public       postgres    false    178       1987.dat �           0    0    orders_order_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('orders_order_id_seq', 57, true);
            public       postgres    false    177         �          0    374610    products 
   TABLE DATA               \   COPY products (product_id, product_name, category_id, variant, price, promo_id) FROM stdin;
    public       postgres    false    174       1983.dat �           0    0    products_product_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('products_product_id_seq', 11, true);
            public       postgres    false    173         �           0    0    tables_table_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('tables_table_id_seq', 3, true);
            public       postgres    false    175         D           2606    374607    categories_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public         postgres    false    172    172         L           2606    374671    orderitems_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (order_item_id, product_id, order_id);
 D   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_pkey;
       public         postgres    false    180    180    180    180         J           2606    374637    orders_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public         postgres    false    178    178         F           2606    374615    products_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public         postgres    false    174    174         H           2606    374628    tables_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY meja
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);
 :   ALTER TABLE ONLY public.meja DROP CONSTRAINT tables_pkey;
       public         postgres    false    176    176         O           2606    374651    orderitems_order_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY orderitems
    ADD CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(order_id);
 M   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_order_id_fkey;
       public       postgres    false    1866    180    178         P           2606    374656    orderitems_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY orderitems
    ADD CONSTRAINT orderitems_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(product_id);
 O   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_product_id_fkey;
       public       postgres    false    1862    174    180         N           2606    374638    orders_table_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_table_id_fkey FOREIGN KEY (table_id) REFERENCES meja(table_id);
 E   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_table_id_fkey;
       public       postgres    false    1864    176    178         M           2606    374616    products_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(category_id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
       public       postgres    false    174    172    1860                                                                                                                                                                                                                 1981.dat                                                                                            0000600 0004000 0002000 00000000041 14653677520 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Minuman
2	Makanan
3	Promo
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               1990.dat                                                                                            0000600 0004000 0002000 00000000040 14653677520 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	10	12000.00
1	1	11000.00
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1985.dat                                                                                            0000600 0004000 0002000 00000000051 14653677520 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	MEJA NO 1
2	MEJA NO 2
3	MEJA NO 3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       1989.dat                                                                                            0000600 0004000 0002000 00000000075 14653677520 0014305 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        162	57	1	1
163	57	6	1
164	57	11	2
165	57	3	1
166	57	8	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                   1987.dat                                                                                            0000600 0004000 0002000 00000000047 14653677520 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        57	1	2024-08-02 22:02:12	bebe	0	f
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         1983.dat                                                                                            0000600 0004000 0002000 00000000503 14653677520 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Jeruk	1	DINGIN	12000.00	\N
2	Jeruk	1	PANAS	10000.00	\N
3	Teh	1	MANIS	8000.00	\N
4	Teh	1	TAWAR	5000.00	\N
5	Kopi	1	DINGIN	8000.00	\N
6	Kopi	1	PANAS	6000.00	\N
8	Mie	2	GORENG	15000.00	\N
9	Mie	2	KUAH	15000.00	\N
10	Nasi Goreng	2	-	15000.00	\N
11	Nasi Goreng + Jeruk Dingin	3	-	23000.00	1
7	EXTRA ES BATU	1	-	2000.00	0
\.


                                                                                                                                                                                             restore.sql                                                                                         0000600 0004000 0002000 00000026577 14653677520 0015424 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_category_id_fkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_table_id_fkey;
ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_product_id_fkey;
ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_order_id_fkey;
ALTER TABLE ONLY public.meja DROP CONSTRAINT tables_pkey;
ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_pkey;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
ALTER TABLE public.orderitems ALTER COLUMN order_item_id DROP DEFAULT;
ALTER TABLE public.meja ALTER COLUMN table_id DROP DEFAULT;
ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
DROP SEQUENCE public.tables_table_id_seq;
DROP SEQUENCE public.products_product_id_seq;
DROP TABLE public.products;
DROP SEQUENCE public.orders_order_id_seq;
DROP TABLE public.orders;
DROP SEQUENCE public.orderitems_order_item_id_seq;
DROP TABLE public.orderitems;
DROP TABLE public.meja;
DROP TABLE public.detail_promo;
DROP SEQUENCE public.categories_category_id_seq;
DROP TABLE public.categories;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    category_id integer NOT NULL,
    category_name character varying(50) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_category_id_seq OWNED BY categories.category_id;


--
-- Name: detail_promo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detail_promo (
    promo_id integer,
    product_id integer,
    price numeric(10,2)
);


ALTER TABLE public.detail_promo OWNER TO postgres;

--
-- Name: meja; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE meja (
    table_id integer NOT NULL,
    table_number character varying(50) NOT NULL
);


ALTER TABLE public.meja OWNER TO postgres;

--
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orderitems (
    order_item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orderitems_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderitems_order_item_id_seq OWNER TO postgres;

--
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orderitems_order_item_id_seq OWNED BY orderitems.order_item_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orders (
    order_id integer NOT NULL,
    table_id integer,
    order_time timestamp without time zone DEFAULT now(),
    name character varying(20),
    subtotal integer DEFAULT 0,
    dibayar boolean DEFAULT false
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE orders_order_id_seq OWNED BY orders.order_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products (
    product_id integer NOT NULL,
    product_name character varying(50) NOT NULL,
    category_id integer,
    variant character varying(50),
    price numeric(10,2) NOT NULL,
    promo_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE products_product_id_seq OWNED BY products.product_id;


--
-- Name: tables_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tables_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_table_id_seq OWNER TO postgres;

--
-- Name: tables_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tables_table_id_seq OWNED BY meja.table_id;


--
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN category_id SET DEFAULT nextval('categories_category_id_seq'::regclass);


--
-- Name: table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY meja ALTER COLUMN table_id SET DEFAULT nextval('tables_table_id_seq'::regclass);


--
-- Name: order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orderitems ALTER COLUMN order_item_id SET DEFAULT nextval('orderitems_order_item_id_seq'::regclass);


--
-- Name: order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders ALTER COLUMN order_id SET DEFAULT nextval('orders_order_id_seq'::regclass);


--
-- Name: product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products ALTER COLUMN product_id SET DEFAULT nextval('products_product_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (category_id, category_name) FROM stdin;
\.
COPY categories (category_id, category_name) FROM '$$PATH$$/1981.dat';

--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_category_id_seq', 3, true);


--
-- Data for Name: detail_promo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detail_promo (promo_id, product_id, price) FROM stdin;
\.
COPY detail_promo (promo_id, product_id, price) FROM '$$PATH$$/1990.dat';

--
-- Data for Name: meja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY meja (table_id, table_number) FROM stdin;
\.
COPY meja (table_id, table_number) FROM '$$PATH$$/1985.dat';

--
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orderitems (order_item_id, order_id, product_id, quantity) FROM stdin;
\.
COPY orderitems (order_item_id, order_id, product_id, quantity) FROM '$$PATH$$/1989.dat';

--
-- Name: orderitems_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orderitems_order_item_id_seq', 166, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (order_id, table_id, order_time, name, subtotal, dibayar) FROM stdin;
\.
COPY orders (order_id, table_id, order_time, name, subtotal, dibayar) FROM '$$PATH$$/1987.dat';

--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('orders_order_id_seq', 57, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products (product_id, product_name, category_id, variant, price, promo_id) FROM stdin;
\.
COPY products (product_id, product_name, category_id, variant, price, promo_id) FROM '$$PATH$$/1983.dat';

--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('products_product_id_seq', 11, true);


--
-- Name: tables_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tables_table_id_seq', 3, true);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (order_item_id, product_id, order_id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY meja
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);


--
-- Name: orderitems_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orderitems
    ADD CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(order_id);


--
-- Name: orderitems_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orderitems
    ADD CONSTRAINT orderitems_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(product_id);


--
-- Name: orders_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_table_id_fkey FOREIGN KEY (table_id) REFERENCES meja(table_id);


--
-- Name: products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(category_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 