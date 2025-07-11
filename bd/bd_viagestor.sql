PGDMP                      }         	   viagestor    16.8    16.8 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397 	   viagestor    DATABASE     o   CREATE DATABASE viagestor WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
    DROP DATABASE viagestor;
                postgres    false            �            1259    24623    cache    TABLE     �   CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache;
       public         heap    postgres    false            �            1259    24630    cache_locks    TABLE     �   CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache_locks;
       public         heap    postgres    false            �            1259    16404    ciudades    TABLE     �   CREATE TABLE public.ciudades (
    id bigint NOT NULL,
    nombre text NOT NULL,
    id_provincia integer NOT NULL,
    lat double precision,
    lon double precision
);
    DROP TABLE public.ciudades;
       public         heap    postgres    false            �            1259    24666    ciudades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ciudades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.ciudades_id_seq;
       public          postgres    false    215            �           0    0    ciudades_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.ciudades_id_seq OWNED BY public.ciudades.id;
          public          postgres    false    234            �            1259    24702 
   colectivos    TABLE     �   CREATE TABLE public.colectivos (
    id integer NOT NULL,
    nro_colectivo character varying,
    cant_butacas integer,
    estado integer,
    servicios jsonb
);
    DROP TABLE public.colectivos;
       public         heap    postgres    false            �            1259    24701    colectivos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.colectivos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.colectivos_id_seq;
       public          postgres    false    238            �           0    0    colectivos_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.colectivos_id_seq OWNED BY public.colectivos.id;
          public          postgres    false    237            �            1259    16411 
   descuentos    TABLE     ~   CREATE TABLE public.descuentos (
    id integer NOT NULL,
    descuento character varying,
    porcentaje double precision
);
    DROP TABLE public.descuentos;
       public         heap    postgres    false            �            1259    16416    descuento_id_descuento_seq    SEQUENCE     �   CREATE SEQUENCE public.descuento_id_descuento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.descuento_id_descuento_seq;
       public          postgres    false    216            �           0    0    descuento_id_descuento_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.descuento_id_descuento_seq OWNED BY public.descuentos.id;
          public          postgres    false    217            �            1259    16417    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying,
    apellido character varying,
    email character varying,
    tipo_usuario integer,
    contrasenia character varying,
    estado integer
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    24749    empleados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.empleados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.empleados_id_seq;
       public          postgres    false    218            �           0    0    empleados_id_seq    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.empleados_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    248            �            1259    24718    estados    TABLE     s   CREATE TABLE public.estados (
    id integer NOT NULL,
    estado character varying,
    tipo character varying
);
    DROP TABLE public.estados;
       public         heap    postgres    false            �            1259    24717    estados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.estados_id_seq;
       public          postgres    false    242            �           0    0    estados_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.estados_id_seq OWNED BY public.estados.id;
          public          postgres    false    241            �            1259    24655    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false            �            1259    24654    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    233            �           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    232            �            1259    24647    job_batches    TABLE     d  CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);
    DROP TABLE public.job_batches;
       public         heap    postgres    false            �            1259    24638    jobs    TABLE     �   CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    24637    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          postgres    false    230            �           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          postgres    false    229            �            1259    24590 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    24589    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    222            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    221            �            1259    24711    paradas    TABLE     �   CREATE TABLE public.paradas (
    id integer NOT NULL,
    id_recorrido integer,
    id_ciudad_origen bigint,
    orden integer,
    hs_tramo interval,
    id_ciudad_destino bigint
);
    DROP TABLE public.paradas;
       public         heap    postgres    false            �            1259    24710    paradas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paradas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.paradas_id_seq;
       public          postgres    false    240            �           0    0    paradas_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.paradas_id_seq OWNED BY public.paradas.id;
          public          postgres    false    239            �            1259    32806 	   pasajeros    TABLE     �   CREATE TABLE public.pasajeros (
    id integer NOT NULL,
    nombre character varying,
    apellido character varying,
    dni bigint
);
    DROP TABLE public.pasajeros;
       public         heap    postgres    false            �            1259    32805    pasajeros_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pasajeros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pasajeros_id_seq;
       public          postgres    false    252            �           0    0    pasajeros_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pasajeros_id_seq OWNED BY public.pasajeros.id;
          public          postgres    false    251            �            1259    24741    pasajes    TABLE     M  CREATE TABLE public.pasajes (
    id integer NOT NULL,
    id_parada_destino integer,
    fecha_salida timestamp without time zone,
    estado integer,
    id_pasajero integer,
    precio_final double precision,
    nro_butaca integer,
    id_viaje integer,
    id_descuento integer,
    fecha_llegada timestamp without time zone
);
    DROP TABLE public.pasajes;
       public         heap    postgres    false            �            1259    24740    pasajes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pasajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.pasajes_id_seq;
       public          postgres    false    247            �           0    0    pasajes_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.pasajes_id_seq OWNED BY public.pasajes.id;
          public          postgres    false    246            �            1259    24607    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    postgres    false            �            1259    24727    precios_paradas    TABLE     {   CREATE TABLE public.precios_paradas (
    id_parada integer NOT NULL,
    precio double precision,
    id_viaje integer
);
 #   DROP TABLE public.precios_paradas;
       public         heap    postgres    false            �            1259    16441 
   provincias    TABLE     V   CREATE TABLE public.provincias (
    id integer NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.provincias;
       public         heap    postgres    false            �            1259    16446    provincia_id_provincia_seq    SEQUENCE     �   CREATE SEQUENCE public.provincia_id_provincia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.provincia_id_provincia_seq;
       public          postgres    false    219            �           0    0    provincia_id_provincia_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.provincia_id_provincia_seq OWNED BY public.provincias.id;
          public          postgres    false    220            �            1259    24683 
   recorridos    TABLE     �   CREATE TABLE public.recorridos (
    id integer NOT NULL,
    id_ciudad_destino bigint NOT NULL,
    estado integer,
    km double precision,
    hs_total interval,
    id_ciudad_origen bigint,
    ida_vuelta character varying
);
    DROP TABLE public.recorridos;
       public         heap    postgres    false            �            1259    24682    recorridos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recorridos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.recorridos_id_seq;
       public          postgres    false    236            �           0    0    recorridos_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.recorridos_id_seq OWNED BY public.recorridos.id;
          public          postgres    false    235            �            1259    24614    sessions    TABLE     �   CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            �            1259    24759    tipos_usuarios    TABLE     \   CREATE TABLE public.tipos_usuarios (
    id integer NOT NULL,
    tipo character varying
);
 "   DROP TABLE public.tipos_usuarios;
       public         heap    postgres    false            �            1259    24758    tipos_usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipos_usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tipos_usuarios_id_seq;
       public          postgres    false    250            �           0    0    tipos_usuarios_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tipos_usuarios_id_seq OWNED BY public.tipos_usuarios.id;
          public          postgres    false    249            �            1259    24597    users    TABLE     x  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24596    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    224            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    223            �            1259    24734    viajes    TABLE     E  CREATE TABLE public.viajes (
    id integer NOT NULL,
    id_recorrido integer,
    id_colectivo integer,
    fecha_salida timestamp without time zone,
    hora_salida time with time zone,
    estado integer,
    fecha_llegada timestamp without time zone,
    pasajes_disponibles integer,
    disponibilidad_total integer
);
    DROP TABLE public.viajes;
       public         heap    postgres    false            �            1259    24733    viajes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.viajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.viajes_id_seq;
       public          postgres    false    245            �           0    0    viajes_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.viajes_id_seq OWNED BY public.viajes.id;
          public          postgres    false    244            �           2604    24705    colectivos id    DEFAULT     n   ALTER TABLE ONLY public.colectivos ALTER COLUMN id SET DEFAULT nextval('public.colectivos_id_seq'::regclass);
 <   ALTER TABLE public.colectivos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237    238            �           2604    16457    descuentos id    DEFAULT     w   ALTER TABLE ONLY public.descuentos ALTER COLUMN id SET DEFAULT nextval('public.descuento_id_descuento_seq'::regclass);
 <   ALTER TABLE public.descuentos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            �           2604    24721 
   estados id    DEFAULT     h   ALTER TABLE ONLY public.estados ALTER COLUMN id SET DEFAULT nextval('public.estados_id_seq'::regclass);
 9   ALTER TABLE public.estados ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    24658    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    24641    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    24593    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    24714 
   paradas id    DEFAULT     h   ALTER TABLE ONLY public.paradas ALTER COLUMN id SET DEFAULT nextval('public.paradas_id_seq'::regclass);
 9   ALTER TABLE public.paradas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240            �           2604    32809    pasajeros id    DEFAULT     l   ALTER TABLE ONLY public.pasajeros ALTER COLUMN id SET DEFAULT nextval('public.pasajeros_id_seq'::regclass);
 ;   ALTER TABLE public.pasajeros ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252            �           2604    24744 
   pasajes id    DEFAULT     h   ALTER TABLE ONLY public.pasajes ALTER COLUMN id SET DEFAULT nextval('public.pasajes_id_seq'::regclass);
 9   ALTER TABLE public.pasajes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247            �           2604    24686    recorridos id    DEFAULT     n   ALTER TABLE ONLY public.recorridos ALTER COLUMN id SET DEFAULT nextval('public.recorridos_id_seq'::regclass);
 <   ALTER TABLE public.recorridos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    24762    tipos_usuarios id    DEFAULT     v   ALTER TABLE ONLY public.tipos_usuarios ALTER COLUMN id SET DEFAULT nextval('public.tipos_usuarios_id_seq'::regclass);
 @   ALTER TABLE public.tipos_usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            �           2604    24600    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    24750    usuarios id    DEFAULT     k   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.empleados_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    218            �           2604    24737 	   viajes id    DEFAULT     f   ALTER TABLE ONLY public.viajes ALTER COLUMN id SET DEFAULT nextval('public.viajes_id_seq'::regclass);
 8   ALTER TABLE public.viajes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244    245            �          0    24623    cache 
   TABLE DATA           7   COPY public.cache (key, value, expiration) FROM stdin;
    public          postgres    false    227   o�       �          0    24630    cache_locks 
   TABLE DATA           =   COPY public.cache_locks (key, owner, expiration) FROM stdin;
    public          postgres    false    228   ��       �          0    16404    ciudades 
   TABLE DATA           F   COPY public.ciudades (id, nombre, id_provincia, lat, lon) FROM stdin;
    public          postgres    false    215   ��       �          0    24702 
   colectivos 
   TABLE DATA           X   COPY public.colectivos (id, nro_colectivo, cant_butacas, estado, servicios) FROM stdin;
    public          postgres    false    238   �B      �          0    16411 
   descuentos 
   TABLE DATA           ?   COPY public.descuentos (id, descuento, porcentaje) FROM stdin;
    public          postgres    false    216   �B      �          0    24718    estados 
   TABLE DATA           3   COPY public.estados (id, estado, tipo) FROM stdin;
    public          postgres    false    242   8C      �          0    24655    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    233   �C      �          0    24647    job_batches 
   TABLE DATA           �   COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          postgres    false    231   �C      �          0    24638    jobs 
   TABLE DATA           c   COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          postgres    false    230   �C      �          0    24590 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    222   D      �          0    24711    paradas 
   TABLE DATA           i   COPY public.paradas (id, id_recorrido, id_ciudad_origen, orden, hs_tramo, id_ciudad_destino) FROM stdin;
    public          postgres    false    240   lD      �          0    32806 	   pasajeros 
   TABLE DATA           >   COPY public.pasajeros (id, nombre, apellido, dni) FROM stdin;
    public          postgres    false    252   �D      �          0    24741    pasajes 
   TABLE DATA           �   COPY public.pasajes (id, id_parada_destino, fecha_salida, estado, id_pasajero, precio_final, nro_butaca, id_viaje, id_descuento, fecha_llegada) FROM stdin;
    public          postgres    false    247   �D      �          0    24607    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          postgres    false    225   �D      �          0    24727    precios_paradas 
   TABLE DATA           F   COPY public.precios_paradas (id_parada, precio, id_viaje) FROM stdin;
    public          postgres    false    243   E      �          0    16441 
   provincias 
   TABLE DATA           0   COPY public.provincias (id, nombre) FROM stdin;
    public          postgres    false    219   -E      �          0    24683 
   recorridos 
   TABLE DATA           o   COPY public.recorridos (id, id_ciudad_destino, estado, km, hs_total, id_ciudad_origen, ida_vuelta) FROM stdin;
    public          postgres    false    236   ^F      �          0    24614    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          postgres    false    226   �F      �          0    24759    tipos_usuarios 
   TABLE DATA           2   COPY public.tipos_usuarios (id, tipo) FROM stdin;
    public          postgres    false    250   I      �          0    24597    users 
   TABLE DATA           u   COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
    public          postgres    false    224   3I      �          0    16417    usuarios 
   TABLE DATA           b   COPY public.usuarios (id, nombre, apellido, email, tipo_usuario, contrasenia, estado) FROM stdin;
    public          postgres    false    218   J      �          0    24734    viajes 
   TABLE DATA           �   COPY public.viajes (id, id_recorrido, id_colectivo, fecha_salida, hora_salida, estado, fecha_llegada, pasajes_disponibles, disponibilidad_total) FROM stdin;
    public          postgres    false    245   LJ      �           0    0    ciudades_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.ciudades_id_seq', 11, true);
          public          postgres    false    234            �           0    0    colectivos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.colectivos_id_seq', 5, true);
          public          postgres    false    237            �           0    0    descuento_id_descuento_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.descuento_id_descuento_seq', 10, true);
          public          postgres    false    217            �           0    0    empleados_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.empleados_id_seq', 5, true);
          public          postgres    false    248            �           0    0    estados_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.estados_id_seq', 8, true);
          public          postgres    false    241            �           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    232            �           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          postgres    false    229            �           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 3, true);
          public          postgres    false    221            �           0    0    paradas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.paradas_id_seq', 3, true);
          public          postgres    false    239            �           0    0    pasajeros_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pasajeros_id_seq', 1, false);
          public          postgres    false    251            �           0    0    pasajes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pasajes_id_seq', 1, false);
          public          postgres    false    246            �           0    0    provincia_id_provincia_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.provincia_id_provincia_seq', 10, true);
          public          postgres    false    220            �           0    0    recorridos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.recorridos_id_seq', 1, true);
          public          postgres    false    235            �           0    0    tipos_usuarios_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tipos_usuarios_id_seq', 1, false);
          public          postgres    false    249            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    223            �           0    0    viajes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.viajes_id_seq', 1, false);
          public          postgres    false    244            �           2606    24636    cache_locks cache_locks_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 F   ALTER TABLE ONLY public.cache_locks DROP CONSTRAINT cache_locks_pkey;
       public            postgres    false    228            �           2606    24629    cache cache_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 :   ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
       public            postgres    false    227            �           2606    32789    ciudades ciudades_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.ciudades DROP CONSTRAINT ciudades_pkey;
       public            postgres    false    215            �           2606    24709    colectivos colectivos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.colectivos
    ADD CONSTRAINT colectivos_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.colectivos DROP CONSTRAINT colectivos_pkey;
       public            postgres    false    238            �           2606    16470    descuentos descuento_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.descuentos
    ADD CONSTRAINT descuento_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.descuentos DROP CONSTRAINT descuento_pkey;
       public            postgres    false    216            �           2606    24757    usuarios empleados_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT empleados_pkey;
       public            postgres    false    218            �           2606    24725    estados estados_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.estados DROP CONSTRAINT estados_pkey;
       public            postgres    false    242            �           2606    24663    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    233            �           2606    24665 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    233            �           2606    24653    job_batches job_batches_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
       public            postgres    false    231            �           2606    24645    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    230            �           2606    24595    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    222            �           2606    24716    paradas paradas_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.paradas
    ADD CONSTRAINT paradas_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.paradas DROP CONSTRAINT paradas_pkey;
       public            postgres    false    240            �           2606    32813    pasajeros pasajeros_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pasajeros
    ADD CONSTRAINT pasajeros_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.pasajeros DROP CONSTRAINT pasajeros_pkey;
       public            postgres    false    252            �           2606    24746    pasajes pasajes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.pasajes
    ADD CONSTRAINT pasajes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.pasajes DROP CONSTRAINT pasajes_pkey;
       public            postgres    false    247            �           2606    24613 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            postgres    false    225            �           2606    16480    provincias provincia_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.provincias DROP CONSTRAINT provincia_pkey;
       public            postgres    false    219            �           2606    24688    recorridos recorridos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.recorridos
    ADD CONSTRAINT recorridos_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.recorridos DROP CONSTRAINT recorridos_pkey;
       public            postgres    false    236            �           2606    24620    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    226            �           2606    24766 "   tipos_usuarios tipos_usuarios_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipos_usuarios
    ADD CONSTRAINT tipos_usuarios_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipos_usuarios DROP CONSTRAINT tipos_usuarios_pkey;
       public            postgres    false    250            �           2606    24606    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    224            �           2606    24604    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    224            �           2606    24739    viajes viajes_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.viajes
    ADD CONSTRAINT viajes_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.viajes DROP CONSTRAINT viajes_pkey;
       public            postgres    false    245            �           1259    24646    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            postgres    false    230            �           1259    24622    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            postgres    false    226            �           1259    24621    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public            postgres    false    226            �      x������ � �      �      x������ � �      �      x���͒Ǖ��N\E�ff����% ��Ԁ�!!��v��d!9Y�PV&z��\
�Z�lڴ��j�ƾ�9�Eq�S�%����p?��yO�^��:�y�\}�?���e�����z�a�S��n���w�_wc�C����nx6Jn�\���������f�$��0�л0�	��z��8ĩ�b?<��W�͛e�iwX���3�	Z�_��<�c7�]?o~7����<�n�3��Dܼ�v�����ݧ�v��[�
���A|���q]tsl+��緧����Yn��0��y�c�g/�a��1VA�yq9}Yn�����O��M���ƾ��4�Ulؼ�/�?���{�8�!�Ͽ����Z�7A���x���;�u�����n���g�~�z�*:n^���^��y�V���7���Y�x�O6�������Wo9���i�0�A��Mݜ�5��8�nn�����pw�a��X?i�&�?�b���k��8]�"}��~�i��^.�/����2����`��>L}oˆ*�o~XWߜ������x��q�����0�qz�ɴH�0w�ާ�ug���0������C��A_؇0j?%�Y��ޞ��,�a��y$4�C1y}Z�޻X������?��O�A�$�g\�s�_��Kǩ	NzP������/��vI�i�Y���Xj��������~�\}u���aW�q�~�B�$�L��n���%����������tu]����Q��z�~���N��������i�z�;�/�ǿ���9��~�z]`�3�Ly������Nj]�m���M�zT�KN�=G]�z���!�a��������awn�Sԙ���&&�QjD�ǹJro�����"�<x��!����ι����m�����ߖ�z���R��M����<�ܵ���}��w�\��������ow�"���ӗ	��$���F�^��*9l~���m�)����-�S�
C���9��^AG<�^
���|\^O��咥CԷ�F�1����L�Is�c������κ���q�b{�&m�θ���>����|Y�ۻˮ]Ʈשv�����_�>Y	窬[�^}'�V��G�yR�y��9�b���
:"�i|�z�{�˃��崻�l�R�J��z�}�O2b0&]�n��������˹Z�=��,�<&-,�;�����T�N.�;����ׇ��/��շ�ۇ㡪Emj!�����q����VH�_���,'N߫�y����i��<�tYude��2ډn
�΅���̴y�=IOU++%,c{'3grZE�c@Wz_������/gi⇪���s#�"��2���s�U��2��~��P'�� /ħ;�A��4FW�dF�[��Z�	�B�! ]2)�H�5�{z���z�kz�z{:�Q�i΅θΩܛУ�k�]���O����+�|�9��$E�a�ٛ%�G���l����S]e(�����=���we�i=���Y����R���`�<f�Awa��PO���U�^:*�����W'�6W�Q�\��W�,��x�a�&)�Gvq�}�X%C�r���Tt{b�Aw_W??�.����6�M~�&�<��ܳYT��ϭל�k䔚絁���v�q��X�Y�Bj��0�χ�B�]{�����e�����MzO�3zz����S����{{<��� �R�FF;���ǥB���|�t_������9����/��Q�F�C�_?��dǋI
��^�R����|�������};-����W���**��ѽ�>:H�Ϻ�\����Y�}.�^�L�� �o0]�aod��!pгhy�[y�TEZ�l�NAE���Nw�����|e_~X���?�#��x=��Iׇl����r�����~����=�QK詣nA�癗�2t�ɤ0����_�r�����W}=*e��~IGE>B��N�uu���Csug�/z2�[�,��Zz�<G,ʨ?��|�-w�b˓�U
�~'=�I1X��>��KS�vA$W;}.���_�k��/eX��-�)�3�k-aO`@T$��;Y����}d������<&�0�-R�}r"�hN'�}�
nc�T������~�K���$�_ŷ����W�b<�x�`a��)��Pv���b~�=�����s��:��t栐*�!�/H!��qu���r���T�f]dBb	������(F��D�������ȇЍP���t����9��i��_.+���9��%j�Ǜ� �)��_
D����t��Z���|�K-���I�y$�t��~�r���������B��w>��`�����y}�=\���P)I=�^09[XΉ�W?��߼9�۫WDF-X�9�S>">�V�(���*<n"G���Ӯ�� Y3�!���yڈ*�b����o�CU�:Y��:���#�*:�:�����O�E�)���2���誀� Ъ��6ou}oP�韛��ѡԷAOُ��[(��qUz�����CD��#��>=�<Ev>D�"!rʘ�|�lO磬�y{:,7��a�_}�e���v� �P8� =���z�קK�'D~ѧݖ��鐫NtQ�k�������zsP*��*�{� ����
��8�S���u��ٓ����"�����H�Ln���FJ��rl�hUoCЯبJ��;�c��_
#Y�①Yn���u��$�+2��H�Y�"z��H�&�42���0�UN�R
AZa���m?����}��W^�������.��1�����Ԑ�$/��fJ�׌:o���¤㫧&��
~����$]���RPϯ�^�+���C��� R�D&y�q��퉞��5��J�HyL�����;}4M�).�������le�U��R��C��r��]MW��9)G��YZ6��_���M��u~hދ�2	埗�*�¸���W�q9�����q�7�[(��a�
��".wU�����K;˲���r��^����$ͧ�=�#%o�5��G�z�#{+U����F&2���ϴ��8�_������IO׊��T���9$'�R���f�dq�y�=(��_���V��r��e�F��|��"�����1��<�d���,I��!�)����-���dE�*�.�w�j-��J�)+:�>9�|���.��,?�>���}�_���M���������M���*]��7ǻ�9+I��}����q2�� �@J%���'��ò/Ϯ���'�3��z�E�8$y��n/�{���_�PV��wh{��ʔ9/`�2/�$:>~�r򏀰#�F�~J���UĦ�c��=)��«����~�ф�}mvd�����w}}������R��+��EP�'�2�	��k갫u��A�z"b���]nOud|)9�s�ˋ�3$��9��p)?���}��!���YaE��-5@����~�Yp��_v�t�u�k*u��{Y�tu��Jj����,�Qg��������*�94Kq�F)uE>=�=9`�u��Og�ἐ�����l�ݥZ7)�1~ܐ3��$ry��/�i!ëP���[>n??��<�"�N�3��l\-�K��ʶ-�s����!%��-  ���V0�I�����+�+j��4�Q>\N��0�f�T2h�Q�j�;���
k[w���֮��������Xl��=��Z�8����ʾ����t+q.R����܏ ��\����1����%�{�y���|8�o.�F�9S:�CIG�Ϻ��W�)G�Dk�y*�5
���+|��΃�僿�8�r�[.w����8 cu�:��zh�],������r���ɟU��59��zV�/����$3���>��՟e����Y�C����CA�u�w+��<P�����Ag��(�.7�m�)�:~2V}���!{��T߯��ʂ__p{�W��o>l����'|�*���u�-��5ST���m�v+�j�/�)���*˙O�qH^a[p����W�R�W��<ԫ���� �.������H:)m�Ryxu�=J1�._�v�� _컮~ � ���ʹ&\n�>����C��H})?��"0v$7c]/���w�-s>�V/6hGf�)c��r�h��|Nu�r�ӎ���F<�F��O1;�zC��T�zs�r�K�����^��O��ms�d�y���    0?��I�=�����eR���D�U=�xP���%��*�r�_>ܔ�=!�<Ǳe$3�Б'�����~��>6�/.�q��*Y\ ��T?��a^�s4���`��
ʷ�;���7˾e�F]X����c�I���ܬѐ�����,�?/�[K�o�/��,��Bzu�Tm�+��������e���v�|�����7�NG��7�S��H�ӥ�Qɐ1�5ƶ��ta�I�ڐ/�	��Ğ��s6�:r������xXE5���z�f:���:<�N9�)Y��)�d�����t.�+7B�L�J&Q����`]e��� ��ZX�	�� mѧ�PO-��e��n��zy��u��^`�LK+���)a8R����ߟ/_���߯^���(�@��
�"I09��
n���b�^:���W~ \V�蔳�xU�-P��l��P��L� [ޑHK�0D�i@t��}N�~%{��f�p�f˽�lr�i�����9�t����R��#�2xh���!�3jA`BUxؼ���]v�"=oo���xT|���D^���RM�VO��pM�on�H�0��h�r]eOl������f��j��p� C��%q��F�������Ϗϲ�n
���?��Z�e�Z��T��
r8z����Ehަ���X)�Pyr�����{��&A1aϮ���ݥ���t��/ۖ�I�8�J�E�Ļ��!#��HBO&�Bi��H"�h�>���^�ۋ��K��+��Œ�W�4�θ�F!�܍U�o��O�!c�$�h���ɗ u�Ǿ
�W���_��/�%��i�>$�Rt��V�:�.Vy�,ɞ�n����m�k����P��pl$����dmo?n~/.�@L}8~jo��I�t�xI�K~�4�<���)��+�}�F��D������W��`m���ew��e��L�_-x�g��9�����'�UٝV�YS�*�F�X�����V�j��k�^`(���,ΐ3��������s�����l�E�ip2/`��.�c�M^��?.;�!�=ԓ��=�r�@?� �=�M�߼�S��Թ>����')��l�)t�zV�6����ˡV�'2���)圗�*��w������%:����C�squH\L�v�HY�E�������R^fU��^˭.'M�YN�^s�u�?��Ӯ�flҠ]�]1��%3�H\��OPnR$�=�d�Z�����3fzx��ú%�� ����! ���m��S�Y�	��.�c��" ���
����2��v6>�'���	�H�Χظ����?������E�=䤺�S�k�`�)��vP�����\����ݡ~@vDđ���e�ufß�ԗ���x��I���� N7�HQD�2fn���w��_�,~����+�rG9���||���~�+��DR�w#'��|粯�Bֱ��[e꼤Η��KE+ʡ�����|�'�7V��q4�s��9�:�� UM#R��L-�'M���u�,�^r.���y�B}[b^/Q�mMy�=	T��@�܁��X���s�ϲ��Z)�W�����d��	��X%S����yW���/�8�k#�T9�����$�˅[�贽��k�O!�>���Ph
r��W���P�A��vU��g�I�2c�X�����d2�C��m�7��~�߮�B�J`�l�29��L�W�Vg�ܿ��9:੠N�\��'�~���~��t-�N��!�H7� k�p�S_O���׻��}��������ZC~`Oy[+5]�'O}{<5ܛ~t�v������ԥ"�4ڻ��?\tQ_\�ےv�ו�
3��H�gy՞�S^@U�N+�$=��@]ȇ�$����
߿��$�`�n���4��Ε�8�eKK���}���2�ҳ���+��6y�'��CB;#
��I�<���5�Z /�BI�L�\N�%Ųh���]�ё<��\�9ˎ~ �]�S¿�:�P����`����uԈ����5���v�M�8��Џ٧�A5@/3�kU�k�ӱ]�����Ja����T����&O���w7�'�#�:a��r�笘G�o��s�J����n�/I�	T��s)���}��
h�)=dAY���q�ID -�F��I�˴�:
�Mr���՟���M���=7��q4U�#�ͻ��G9 ����rr�����4m��-��\��P��"�)�3��ll��������['������rr\��LE��$�tƤ �+�O��N��ܜ��)d$�����5���*j��FG��ƕ�DM����܃Fi(�|}]E�"�ݡ:�`��(����h�U� V9}������W
�O[Κ���D2�e���J�u����-$��E�q��&�V�np&�}{�r��٣�w�*�&�M�HLcP~k���tX��H��"-3b�d�H^�����F���u1>��N{����R�UAx8s��t�l�y��G�._k|E҂:9E����5W�C>ǲ�c��s����xLeg��ﴳw���J;��1�cF,R�x�f��Z:�H�r*������|x���F]7<�=�:.�ƀ�Y6D�5`�>'�t�H��ե�Ⱥ��{���4c�L�.#�_<#��ۆ]��:	������w�N8 ���D�o$Ϟ[1��x�OZ�<�Z៓TN�����l�0�V�Kj�&%�]I�Y�"( ͚eK__���&i;@q�Ü_^�DO1�s7�П�[A/Qh����d<u[�R��<VI��r�$�8�d��tOnL��x�*Y�c/���W�K`S����jj�@���:{~��Оw��g�e9FnM�P( ۇ���.5V����ݥ
\��A0�X�U�a���r�%hF�vB������'�{̢~#��3H���Y�]����a'��mYv�������4	�b2�߃oMK�[�s�X�y��1֟��N�������:ҌG-�}n��Q�Xj"KR�R�ie�� �g^��92Ӏe	��ʎ#pc�����q��D�+R��]b
�g�f��,���w����qpt�Y؜�7w�|��7+��~QZrB9�R���8Vq�Z���.Г*0%a3���t����'}�i{�rU��Q*�f-JV�4-ؙ���Dn������K��H������$�'��] ���,���}+�s����8�ݞPs�U�mZ#����ZZq1P���s=weud�i�h?N�E1����y1��H%%9�E��W;2T9C�nkb��F>/~�mY�h}<s{�q�vy8�=���w�M����J�"��㫍Sy�����t�N�S!�� �8�٠���o�= e�IO�9�;|���ۇj#%�,�RW�^�l�el�N��+���؇)]ːS�.�V��ߗƕ鯈U?:��0Lx����N���>� x�&ǜ%�����v=o�%���+t�9�69��ق����_�T?K�!>��9O'V� 8;��PYL��� ��7�o,>�Iay�=�����8f(^*�<�i�V��ϥ2Ӥ)�-�'���+v�� ���������~B~Ĭr���p�%���	�� ��y)U'���=0�" K� �=�ҥf�\:w[�'X]����kN�d�tg}��ħ���
����D�=f�&M�(}뿫�.��/��}����IEQmʐ�8h�Advs�A�ݯ��z�eK=Yr�i��ΤrF��*���z���9���R��ޕ��D��H3�8K��6�,
����I#H�*���O~�bIO��WL��[�N>�މ,Xz\2_D}rxB��^�uQII%A����8W��6����]�� Α�ᑎ��m�d��Y���*^/JJ��ᄅ�z�/EW���x
�g�"?�nV�|/_t�o˹�']�A:+X�u^�_W���K=�L���N�@��y%u���w:�6�
�eu��3�dS=������`����c�_�CӋOē���\7�V:V�hna�z�T�_=��묳*���?oqܲ}X���6w,b<�ux���=8��̮ha��b��T:%��{ӳ��|��TZN$� ށ�	.U�)�v���W�AG��W�P���1%9ڂ�    ���f9o5bڧn��i�	Ĥ}*q��w�L��?mr}~������օfM����(hY)ⱺ�����t�ݴ�*�v�>��x쑝�gt��_��]�G4��� 	�>r���`hsY�i!HF+z@G�ߤ+��U��	F����p�R0��L���#ǰ�1WA�����m��Ȓ�̐�(MX�ᒎ�Y���X�>�Hգ��ή �H����^Ń��n_�$�`�<��!�u�����z2'Yl*bOTV~�X6oq�dD���g��?�А��K��|a��e
=P��=xE�%b�v�&��AQ�Pڷ��t\���딗���nd�<��mњ@�5��������*NJ��*e�
���uWR�#���rUfx�U}���mϝ�q6�ϒ�f ��\��rNJG�M{��_�%鑪�|
�Lƃ�9W0:6��>'2	���_"��,8��ʦR����������%XH)��,��.��y ̝��ޓ U���Q�x���M3���-���M-�]~��� V�a��x���_OWoV���4��mo#NHp�	�
E.��h�2W�0��oR�\�p�=&
>L�hԇ���>ψH ��X�Z3K�fv��V>����cB��I��|�	JS���-xv�Gw� ��˰�@СsD��UY�y|<�:74Z~C�|M�~��nM�S	��\�cWQ[����ѝ@���Vm�J�f�m@��/mG�|�%#�ڝ��U}NF}}����;\�&��8���e5����.�,Y\g^wWda��Y�?D;�������P%KH�$MJ2����D�1��De��^�nnvMX^��D��� Lo2�ѥ�:�̛}����"�A"NVMw���B)�I�*�H�����旇UU�p�|,K�x�V"C5����	0� ��9�(�_����E'��Q���L2-��Y:=�9��X �2%�'�:��|}�AdYL���ܬ�$I]t@����Tj�@�g��R�O�k�d�B���=3�?�1R���%]n�RU��F� �β$"|�W� g�沜��C�~@�>M�t*2�������k�J�/зL1I�tڛ�#��k�����e�dZs/A ���'u���C��y��k{ӢD���%�x�܃����yw:n�	����҈T�bn��]k�y�+̛��x�Z�U}[?w9����U��)[A����l�W4SQ�ץ�@"��#s��P�nwW�����`����4�S�������� �z���d��\GQaLv����zYT'��\s�h��˺����Y����-��K�E`U`G�)��7��f�79)����R��qL�$��8�c��Up�u+P��*A��������0�y��[��6h��a)PLC�x���;����6����j��#F�P�4:U���պP�BYd �|��д0�'�c滆e�r�"Fx� �q])�Q/ֶ�8�ճ�ųH�?+H�lm��X�/::�wΑn��@���!öϻ�
�2� �R��K˟��1�}�Ou����-�����(�?�q���"xdn���ob�jʹ�ڣ#�*� �r��ts���=��=|�z�b��3�P?�$�~��ʉ'��^����뿾ܭ<� X@ņ�ڷ �i��4����;B��.ڹ\t�l�=��n~m��~�駚����cQR=g��dC_�����R�΄�u�y.����lz5����!�S �,nTvFn8 ι�E�!�H`�W�H��X!��R�60T���T��A:!���y��e�r�ߛˡ:��ysK�/���G%#�2e���n��tl�U�eN��[���%|�g\��ϠOEp2�#���;x\>HT���(:���6m���&�+�z�����3����q�ᓣ�c��=���^�n}G�N�o>�����[�/1�+�T��8��q�0�-�mF��%��_.��Z��N o��>w�^�u�<͵ȕ�t��?.��x�o��;����T��UG��3�N�/��F˺l�P��4f�-TP�������Ϗ���z$�Q��(m`C�ʏ�MF�~�"�.�9���i�v�G��s��ή%lՔ����L��b���h��$�q���Y4U�o���\v?�_!��CK��;�K�}C�D�<����.	>�� ��C8XcM�#4a�l�SZ��;����u������
M�.��z��BI����dI����=�w�XA>Az��.n�@�-�swLOO�p ��o���� �)K�+p�{�[� ���D�B����^�H��#;��>��E��G�7�A��b)����.2[I^(�Րi�M���,���Υ��>���{�D��z|�ﶧ���@ɑ�qF)eϠ�������OJ��wG�eaLz�R'}��a�4[~9�!թ㷲,mC(%7%͚�/?@mx�zk�	Y�N�I|��Z'�'��-��*��K����F{�nް��a �5�G����o��$�F���$��(�~֊��{�[�,�7�o�P������/�N;�O��)4}<��*��兙� �	�@�"�@��8��55sd'���tZ�5�f	2�Y��2/���}��kgZ5/`�;t��_y��U�����vx;�)�H;8�����+��Iu��h��5�Aз�=���h㲢�|��PT6Y�ڹ����ij����R�FŪ#�W����!�39��ә��1)	�{J�?ғ��[�O��g�MMLV����������W�DBG��"a��]�'��ѿ�-���a!6���R��Q��5Q���u`ow͢%nb({�e%a/��77a>�nX!�-��!A�Q\�S���L-��U���+~�5(ث}ӫԦ����5a�y{�ߔ�	.Ud��}֩�y  S�C�s+���4�A:����dF/+�%�w-˚��$�]��"���'6����eۯ�u��2 sl�����G/#l�U�`��TX����q�}�m�x�^�7Y)�˽����d�����<B짟��mZ�ׯiJ���
t9��[�	�a��Ne*��xt��qo�m8��[�ޤ[N�b^}�/+H�:@����m��Y�p�X���V�3y�%����n�v��
�F�w�M7@�6��r�aw^��b�7� ��	.�y�,�P��w�(w�__���Տ���Nm����kR��`��\YsBg���eM�799��#����Xp��c�0��ǣ++��g����h4e9-v�Z�����������ږ�"��is��[�aY{�O�~s�Γ���iihU�`�>��Kn��I�ξ���J�4F�i	@�G�N�ؖ6/�~�=��S"�R��"�tP)��OO�i؋Ik����r�}8��	�5p�^P��������D+J�ԆS�&��p����`H}�5�ܲ���)�� ��,��@�C�IڍY��l��W��ɍ}�F��̟���C�M����}�lo�V�P.w��)��5���K��}�W�����s���vZ
�������=�zRW0jHc�}*������򈁋�J4q�����a�qr�@ȟN5V�M|TT��ߝB�Ħ�V�R�=���3e�����k��E���h�Qq3��I{�+��|W�2�GFo�:?�O���c;C�D�u�7�����"�q������ԫ�Tߑ���b[�hh�������@(I?�����z�� ���JjQ5=�g�g-N�� ��EА�Qǘ֨�5��5�4d�e94��N_��,K���"��1U�'�}�u|8^��ʼy�K���n�;���)t�H/��优��{�O:C}�����iOA���Q�N�Hŭ��>J�E7��ū�y��ޒQ0C�Z�|� �/,I���4Q	6ݜ�ǆ�'W��k�h��(��9\j�����𽽲
ȹ*RO��s,�h����p�w۟���NM�0릇�n��u0e�L %�% ��/��s8�<��̅t�]�=��`��p�FҝTLY6J�P�g��뤏鈥�3��J�~+��A'���ހ�9�6NzՏ ��Ƙ��7{�4v&��o���x�V    �4�g�'�S��ؕ���[��r�]��;��V0�>4�ڦtS{����^�+����x0'4�:�����,�L�,=$I�Λ�ӣ�lw�(��Df7�H�_5�O��P�6/��3Qr^ǥ*��O]?���n��l8�`(sy��k��h���WF��Vr��OK]�p�qXTI�3#i&bl�@�`S��'�#� ��'�m�
��93mEbmߞ�!�o˱�TF�$�+y��6�j�y+������N��%��ޒ���-�b�|8�^n���2��:�C
A�I���8�%j�������oA�� J��A!��"�-��Y�he�� $L��w�vҨ���L�m�X9*�C6�7�_=K�%E�qL_�:�Э}]J�QYj�g����F'ݶ��������B�oh�7�����>������j!8~���T�N���I	Y�j<�ۇ��p�����2@���S�(o�S���S��P��^�Z�'xT�;�]y5��������)�_V��M �rl$ʹ���V�
�Y�>CJ���n��EQ��zW��uc�ճ�5l��-	hXgW|zj5~�����믯��t��O1���,���,�z�y��x�=>�V�S�[A�/�I��=�m���;���
��e�/m�<�|0^9?�9��X:Ě)��K�Z�L��0+�H66�!�d�ɲ�MU�~�T�k�����}r�(�K��< � �+�4���{,��Nl9��!�3�h�2���Ȥ��oA1ؤӄ�ؿ"lbx�]ƫ��S�'���V)�,�,��ѱ1e���m\U�N��x�%�|�z{�=�nb+��a�9���g�z���Ӻ�[���"=�&C{�8gl3@��6�Mz0�����[i]�k_~�����G�����t�[���q7�Y̥B8E(�C��l	S����t�%�S#M�T���+Î��� B,��-���-��YxH�kt�5z�o������}�$�1�wV��k<\�d�������n[�Ȟ�������J)б�H�7�X�,g�S�ecn��ÅoN
~��DY�9���4s���3�g3� f�	*d&$1*f:ת8y��|�k6	�ۖ�LM1U�>��'}�12��g�4;��z _��IW�u�伖(���΢܍Fhi���
�����,%�qu%z��/��o���?�vw[8����e� �C�8�*/�]�π��DR�哃ƋJ=�wF �Ʀz�  �)MoH�����=3�$k�qW���әf"h���`�7x�h�"��V�D�|�u�J$�].=��x�3�%K�v�Bd֔�
:[d�&���ι���j��V��2h#�4���Ԇ�E�Ϳ-�,���sh������4���ք���n��Gۂ�5�a�0S�� �y���`=��N�/u�� ]�m�@eAiQ,�a�	�Z���_�	#�rzi�{"�&�6�?�혊"��	�=�Τ ��$��ƈ�t,�9�'peeҳ��gJ����!�&:��	m�� E�0��Ζ�¸���V�l�-9C����_��,�=)/qL�ox%�8:�M����kb���p�Y�����+�T� 7vw�
�) V���9;4A������UX�uw|*;������D7�rj�Ó�v���2��Z�/���XMۋ��zu�F{s�U �)��r)�h�2�$(�ʺu�|�1Ȕ������ƨ�!g�~�6�dqr~�K�g4y%�Qk����.E��,R1��G� �߬f@;~����ɪ�>k]��S}x�dX�ɦ�4Y�}�UY���-��J��$��>�w�Q��H���������1?���3�T������A��Ў	��%zkO�l�sG�K']Re���q�Y�lg����hf�E}�0LM�a�|�}�9�Y>[r�`l����v�wIfU鐜5M�e���}���~�g��d��&����Ԥ"��`��2U��h)��߭�v�F�l�X創sV�ҭ��U~����lM=�qɟ�	���6�������̸���D]Rv��]O��ݡ��ͻ����ݾJN6��f�8�&.EJ���$��Q��p�a[ߔ`�	�.oYΎ���[}W���z(�N�F��/�'� �S�`Lķ�/*�g
�N�'#�R5=uر���?-�:Vg��tˁ�4V�@?�����V�n�nC<����7u� ���(�O6�o��Lg�5�#^N�����d�ƟC6D���o�8T)��������*I�,>f�,=���&����3L�ګ�� �M���f��-q�!{�}� ?�g�JM:n�ᷞ�0�4�x3�VxI+$��O}��������@^��(�01�������~�wP)z�d)`�g~�9v{�y3��x�P�mq}�L	���zf���Ԅ�j�A^F1�'���g��5e��29h��l]�"N!��h�C��-`��^��uozK�eV����e�}��Qoؖ�5j xS�J������B���Rm+��P�rv���>�_|�T�[���D���٭��Bf��<�s1��n�&]�&L��c-���<\]g�W�;�[iuj��*t�U�J���	>Prp��Lc����Ͷ�h���9�2i���S�6�>������bQl=Mr�*G�8 *A3��T#v�v�^���WNOz	4@�&7��9a޶}�aJ"J�	V4Z���~�����P=�6�<��IǐJ�>,m	��{q��P0�
�~EL�ԅ�i�f���e(7ʦqT��h�y���6�}C�n���CV�`di�gzv/-�>�C托C�~��)���&����iiG`���lԏ٘��-\�|=��륭�����EV�>8��y����ϑ��Cڶ$�V:��|)��£�V�i�6��-2$(��r:�/�*N;Ȩ2x~z2'��u���M[q<�?����m?�*���.�6��a%o�O��8X}t:މ��bR8|x��&;'�އ;#�nOΠY��CQ[��O�'����y��o��A��40����$G�)Vi<�2;T&D��'�)�e��w�,�^�˓�oh:��rq"�$)[e.VQw X�Ћ��U�����ɘ��Sx����RR���'��-H-�r�~�<��60�S2��!;7�ǚ �&g�iй��t���<�L>�J�c��- �	��p��K}�f�|��?0� ��8e%h�z	�yn��'�X}
�Y%^\"Pك=��4�8�e��:]�����% ��"��4Ȅ��!���� �Ϡ෧���l�^���٫K���p^�����=��?�xB7ѩ+,��p���V>��1XSV<Ƌ�I�7��W���񯰍��'�w��������"��R���0��Bqqb,��m�{];dy QY�zs$�]6�:������Sd0e�6��>��wu�����Μ�@��F к�z�d.�p��0Ҹ�C��� ���p������@OC��l5��gn��l�lb�f���LcR;��e�� (*���?$Q�ք� S�p�ⸯa�t�����<Dx��a�`qN�ۦA¶���]f
yw�x9�-�zS-�7rړ����O� �����l���`hE1S�B�*�z������Bߌ�6<�a%�J��\٫?>��f/�������,���n[+�a��� �����u�B$N���9P,��*�Ѷ�l�cju>~���*0p�`s9��NϦ�4���M��+�H��m�g����'�M�p0�xW;�8y2�^�LJ0�m�t��&�Z͆&:���dp�ix͏�=�O��߿lbB΃p�;��"WR�����G���SB���8�?ʯc=UT���~})픆+׶�FF�d�缄N���?�����,�C��3G��ò��4���n�Ț�H� �������6C�npę�M� W�鹡f )�~|�����m�0��C���e���Ew,r�ҥ��(Gj{>^`2�"P�I�����_loў>���߄�vrkD��U� 4��!�~����FC)�O6�"��	d�Q     �l�؛�X�_n�I5X�*'v(y���@� �ɢ-EH�?79 �����T�`�<YP��ڷ���G��a�櫼�4��qb�aJ@V_kr��ovVk}�ݴovtx�d����4�b�a�[���+��y���k̝�஍�	|	��Z��Roi���'��Cr������pPLU�;�F��b�'���9�`�U������M���7*&��}p��Q�av,��6�oo�ҟ��{���hمw>x)`�M�����������j#k|���P��T�������Ḏ���2˱}�o�u����ew�Lf�?M0���llI3)��UM� -E��de�`Lr|��w�q��9���sI���_o���)$�O�8#��pzP�bB����U�=�ҫ��
7[k�t/<j���	�%����&�]3,{f _(e!�Q�Y?4iW�=�h?����+�f(W��ϢH�]��qyص�fRqq7䒒��Y�@�҅��8!��c��a�]v���a�zm���h���u��Զ���=�tm���}uU�~Y�8kI�>'f�'��g�9;��R�6�0���F���	��p0�&�۶��ñ>4���o�O&1�&i%Pl�\̍�閼��0ԫH��;��}2`FD�����e[EeGF̒��%6�J���g��xC�r/?( �}$K�RS��cBw>�0���H47�� O?��N[9P_h(�����ӗ�#�a��v{f�V��L(	�1����L`%�Z�<Ż�FI���T�m7�l`�դ�<�Z�>�ⴻ��������2�X $u	�e����O��daH<#xB-��&�r y�ly�7�V�S���r�r��4�G���W�3q��e��Z����\�gvI#���f��b���
�3쬗gH�
�u5ʫk�c�h�Q
��R��|�#����<���˪m�. �4\�s'S�nE�u��h:6H^Y��}�#�`u��]#s�{6��:sV~���hzP�h'�>%0w����ů�+<z�?��^����y��q.�޳V��OY9�����"&�7iW��ɻ������ِc�P�1<�M��i�1r�6Ť3��(֮^�'�K�2�r�O 1��i�&�55qWY�>���	�:�I~���{NX��t2G��H_bM���9��Fy���c�/�*��?39�1u1ҎӖ�P9�0�� R�q̏Q������V��a~��c��{T��:c�u��DWƘ��\�QC�CjӅ��SlalP�m�ﲆ�i���Ma��(鑄�;�1�*MR_�����C7�<����������JY 
S�ÐYzK�2�Z梽�U��������i.�S��l�\G'����~_�Z�
��?:J�]�u�rk����0.V�N%_��ou(�=��8�Ql*� /u��iR��rZ���><5�%�}�i��hOVg1�����0��}��t�C�k|Z]�`��ȣj= d	�T�3�o�o��Y��Jz�KPD6���<}ݖfxr�R����iWϵa9@����N�E�R9�n����U:$�F46���r��T���RJoļ����Fp����,���,ċ�V^"�\/9�_�[02��R��9L_*P�E����	�y�2�]Vv�e� [�p٤ ��L���V>��KN�@�1I���u��-�6����_�
��VsF���l��`�;X���l��U�I�o���`FÁO.�x���I�5�k�6��mi]'�-@���JF.CG���1��s�y��_>o_��tL��=���s66J��sη�nc���d٨g��M<��l�o=����'��'��0����]6{�C؎�A�4����]��^9��PIZ�%��*��&*�N�).����7�k:l�}p�l��}�jNR��5D3��T�0�j[Ȱ<� z�a���{q6|V��-�}�j�����oe'��`���AMت���Ƀ�ϡ�~]NV�)�����K��P͝��1�<I�H���?�]����pc����
4��VQ����G�����ё��@ȧ�6�	8cT���o�ԾY����`�H�,���J�6#�Չ�}*S���FSP�d�N��/�p��.zc7K����l���9KÍ#'���,$Žɓ��M
��Sf�c~��S����y2)����^'3����~������X��u���Ic�l��8�׹��E_��k�@�3�P�\�RI�6��:(��ŏ��<�*|ɏ*�$q��WMB��IG���J�� {WHn�#,��2������֓�B�.��x��:��l#��1��4M�'�^�7o��E#�"4d�d}~9cn4�E�� ��{�/���1�<S����@C���N�ke��i�pܗ�ے�mddfKg����)�eBʔ�S��vSfcF�<�̓m��w����Y�;�j'+'���pS��d��<��h[�O�����1�B=����N��;b��l܇m��M�`�{&J�i��ߗ0��矗��͇�� �A0�ӺZaIU,�ه�I:��8�ڕ���P�Oe�D�o3�,�C`��y��y�G ����f�i�!�~�[`�Ǫz�@![�!�+�e$�6���8����0��vƸm� ��hZ�0�\%8�ǋ43�fLt��O�Jn'�c�7���d)zX��F�=����� �!bz'��+E��/��t��k쳐�vҘ���|4�U��fh������.��Ad�㻼�:х�)�
�7�B.6���@���B���/�w��ˡ .�����zD��3��4��f�Z�
����0�S&�&%�2�����!7��o�,��x�6��"��2:G��P�K�g��+C���L�-�7i��
"���o����=����,�Bd�|�,N�7ܚlA(ϩo��r����\f@O�A����'�`,�q=��>�+�\�MO�)�L�ʀ�����"Y����r��/N˧6M�Z���-�,NM��>k�
����<�`(��R>O�$Fb��Ĵ��g(%���s^|`A��!�[�w쁄)XH�CW:!��*��v��O��ir)玒�b�b,�\�,m�<�+��c� �C+D��	Nۛ�O���	Ѻ6�y��B+&=��f'9���m꧰Ŧ[H	WS�6Bu�� x��2��3�"h��O�f�O@Ι�}��c[T�^Z�D��B~%�8�|�.	����L�R�	���QQZ�)�����r�?;1F�C	<��d��� ��gs5�m�o�O�����R4��z0�ѥ�e �)dj�$\Ͳ�%�E�iu�!�sF�c�
ɘ�Ë��Wy!=�e9�+�1�4��O�J��{pi�sʹ#�k�@�TB:l8"=�6���4}�>�ξ��ڜ�j�72g�th�W�������7�W�_�����?e�a|R�Lá��ɘ�qq�K�l3�
��_w$�q�x$����������XoEs<�)�?$Ȥk�UWݯ�8H��"�J�4���1�Z�g���j��W~ΟN�̴���D8�|��Fz�� �Y&ɹ�χ���|֥�-QH�$� z�"�p*<�e��=��zZ�
��;fb�ʹ��I�?b8�t���v������D|��3�u�����7`Q�c���r'�,
����bj6[�4��Iڣ+��hm*�
:6i���j�a:,dFs�^���W��/�;�ln��nbPn$r�������O�M��C�	AF�~�$�!�Ƀ$��<tB���}]�/ڷǐ�p����xZ��a6B�#_)�Vɓ�I�}����_�Sm�E�K�c�CN8��wP`;�SG�M��������n����_F�D��$����W��m�8��5��y�n+�0��i��-������Y��"�uH|�>9����Q��>-��"���!����*RCq.S�é��Q�:�1�3�`�����$5:)Jb�_�!���@%�;���
n�/-����<K����љ'�����a��#ס|��f2t5Ӧ�hFoS`c�7;"X�����c0��u��T]�"����^��}�    ��� -?�D����5�9�.Os����Fo �����4���Έ�$b���'������b���K�!��Ɛ�EL>Z^��>��B�e�v{ޕ�љg�)�0�:�:��x{�<d��z�~2f~�2'eƛ3&y�O��ݷ�E��6,@A9T����dcLr:����_�Cո:K�ݙ�Ɍ����@��������X� �++́K�f`v�_{ڶ�\��\����<�Q�[e�%��C�f5D ;p�ȧ��2�?$u�t��[�&�3H�_ϣ��� ��O.%�/`3Ӎ9��ˮ�n� M��c�rLgΟ���
4sR����_�FxV�f�E0�n��\0%)�nO9��E�\�6���֗�p��&���6����g����°�O������}K��Y.�]�.5^S��`�䢤��x�ˑ����%Z8<T�aid�!l*�;
��
cِKI���DN`��q���?��9T�_�UK;����vw*�7��so�6�$ʻ��ƹȁpIZ'�����r�/�*�k���C�ˬ��3��$'�����X���׌�zv�zyV�x(F�����w��Z�؃�K^,�0��~3YŰ)�5�*h�a�v�R&�1rof��}���?o�(�?=�(�ڇp���a`@p^g�a�)�;h��8�@�T'%wyQd����]N�)����P9z�E���;"���bR���c��5��#���5�c�坥(��1�G���4�����KO='I�8U��fd�A�[k�x~j�H���0�5� �Ѱߙ�,=�9(^/���=)8��T�� �Y13w�!?���]�Z���j,�UnJ�m�6�UW5ڗ�	���c##i�����lU�9��AS}���SIxn|�!�X��t:˗�S �@� ���վ�wԽ�l��h��� 5R�o d\:��%Z�S�֑N#�iΛ��a� �r�7ٽ��@S�rŕ����댻T�,�4s����R54�1y|Hӽq0I�Q �)�	"%�����٠z�-�S9��=�p����E�?KU#�ͥsd��%E���O6ev�������˖INy墕_�)�|`��h���6]�:q�J� ���H����Ѽ��`��j\��O����2����Ҧ:�C
^fs�A�?��!y)H�b*m���� ���H͙--�%O�pt�bzk�����!j<M��0�~��������}R�0�л (	��~���oE�v�=$J�nH/�2��m�mH��F��T��cb�s6���Ӯ�"$�Hed��2f)���b�D���Ѻ/3�qw{���5�=Xg�U�4��|�箸�� G�.A���]$<V�;Bw]�����x���N�T2��e�E�ѸW����qxXV��h2R<p�$+���0�7*n����_@1�+�⟏��,}F/N�x�t��-�����F0~�F�M�oց����b�j�L���&|� %��qf3n?�K`O�n�T:��9���x�7Ig;--��#L�G����N�؍1�ik��/ߝ����[�����j����� �o��,��0�%��h�I�}}��H�p��d '� =t)�P@��JUyG�aWdMݪ�8�S�
D�Q���x�4�Փ�\�U͍�$YCg��t�P��s+�O�"�Nr�����1r`��K�F�{��=��]K�S�_nwEAZ�UV�A���l���g���յ��dK����d��2�.��*���АKu.�up���?�]����� ��ܐb��i�Qq`KS�7�!ז�oDca�5{K��_�����u�)L&��hf��QK����ΏI�w�S>�OIʄ�ѫ�'_�٠���k���T�����ݣ�q�|�n�'��kY��%�0� (�1���>C�M���w�	�W�SK2�Ґ�|�B7&�Ch��c�A
os,��p��e��T��4�0�����p��?/�/m�:��hv89"F���B�%�(EB��]-3C�M@9�S.7BK5�Ȝ�|���m<=��Is�L���i��%��x�t �$�<i���%��қu|wx��+l�}�[.5}�ob`p�9�e���z̿�����\�6Ֆf����5�@�9�{	�p�յ.���A>$}����C��|"�Hs�pK��6{f`Gj&-�CII�p���a����N���?��1�����*���:vQ &��^5)������lu�)jC�2����"�R ���X����'�&�i�����N�Y,Y��O�IS��#\����!IiC~�~��(��� a�IF�C�~"��%4���a{h6����DrI�z�I���ˮ��ʿ�3Y�aHb Fʦ�H�a@�<F��@I_�|�~R8�B\�9�S�盂-�vJ��B��}^�k�'�^��K_<�Q*�MW���TQ��د&�3����Bc&��)���?�pb݂}w��r{����(S��̶���ϥ
��_��/m�=�U8�}�I��'�BQ�ɘ��=���q9����K*������m�I��{�uJ=I�L�����*s�Q�I̕_=[�������P�jU�3��oZ!P��	<�V 9�>m���@�����9�����L|�9�Yņ��L_���w�Ea�m��Y�#1�R���SМ������ƌ��v�>��q�Q��_�I�$3v�(W*�63�������=���plg� �7��j�2 	�z�T2�/Cl�+�Hs�i[��oOG�<fG��vds	���C�)1��j�ɂ��$ǧ�a%_��>_�����$ɹmz��;�0l��n��@
�h݇�z��36m$]Iy1���6eH�C�꿨�{�
�Ș��K
ئL����i��7h���T��l}����U��)Ih\m��߄΄�\���$H�v�ϹHs�J�LOKTɥ���!1h�1IN&��I�#j`0`.�#� �St%�?���/58+�)���*!��&��͸�P3�f @QR
�Ǒp`�1���_]J@-�F�Wn�Lf2 �6��b���{�2���t�)�@{��I)�@F� ]�3��~�
�o�UO�/
�|8�^�n7�M�f�_h�֋��ܞv%�D.���0�DsO���������[��uЄ�))�%�b!��3���=�Ѷ6
��J�g��  f�+��q#���|������3�rJ�)���#qo�l�\�Y��*D�P����Ȑ��}V�����t�����m|6�80�B.�e�zoR��Ffh$ƐL=�1�k��� �C����#�~����#m�d�t�|�E���j�����3fHU��8x�hHhO���MI���5h|T/G����"�q��j[iBY��- ��҅�'��Ca6-`�������$��ڲB�:.C����wYn��>��Ԩ�>��I�}A���\G�J1��:�V��u���z�����Τ��&�bډ'N��a`�L���@����$4�_���]��M�&	C͔�+F8I���q��!*N2�6�}�?@H�<|J&aF��OV�W�B�')�1A=� jOK�<'њ���x�3�a�%�>��Go--�,7�i,�m�i�ԑ� @��Gs�i� E��q���V�z��[���M��I�b.�V�]��-���ܶ<�n�y&�O)}��R�͒�K-;��KͅC1s��'�~T����)��i����C��_y��:2����5��`��/�O����{2�8;ڶ��`�%\1�2�-�͆�$/�c�Y �4�Iˑ@���V#e\IM^>m#m��s̃�[=�3LOl�<��Q�x�&Sc?�ø��Dc�M}����8�t ���������A�I����7��ug��8�03��<c�5`��e��zw��V�n0wk�}�}4�2@��2̹���%�G�L6�>�g���<��m��b]k�ݑn#r���h�N���+ ������QvX8t�f��!"Զz|S]�/,��vi*
��ƞ���8��,�K����N�I���Q@�c�}eK�[zn�8G3�9����Ջ�ܾj���    ��]�(ar"l��.����D��g�e��B�^��L|���x�.=<l+���(�����'�0���4k4����7�j��L.���2"/�h.��ޝ�]W��p&��9/m	J��`
�������-غ�	�F	��>�`a�]�UH?jU��޵CoyI]�qL�xzO��8cۓh_������z&F{�#I���t^1�w��6���^�T͸Љ�&��8�n� `�L�U�6�H��xl�c���T%do���I����F+��zj��w�7���N����V�zuY�w��Y�ߒ�D �JyG�4�x�$f�Ä�p�t^A*b�e.�u���<kl��-���}�b/]4�gF
'o ��q�3~'�9�l�6�ƞ)e��ce0g(� {����^Nr��>,�5A-��1 �f��(��'G[�������e�`�(�������2��4�����4��~ym-��'�ә('��5�NQ0nd�{sk]��J�ݔ��>5��7��M8&I�%�I��Ĕ8�!��y�!�1�H��o��p+7䞽3Y1�߹�ܑ]�6��-͚]��]����(�_J�G��V
������-d�Q���Y��@Ȣ���f{>W����M�b�}��^p��z�O��MKC�&Y�s��6�fu]g>7ko��2m���:��/��1�:s��iF��d�.&YCW�~������� �vjᯄ�
C[<�BRp�<rH_���
O���s���kH�U?'��i�`M�"�ִ��R�s��?-6�L/���E��ӓ��z�J�ء�^p�1��|�BKy&XQ�'����P�8��B3b��a�'�>�t?��h���GxȤZN\��
��ň�F���[i�_���O�|�S�˾8�1贺$��6t�� �>M@}�$'��dT��_��":T�T�<ݕ~��4��a}����6�<sU`q���V���HC
O!'�A+n ����N��Z�ҫH5�W�S���F���DM�Y�o�e�����:e�=�j�3N��]Ў1Y~j�F��-;�B���W�Cow��$+��Y�K���	,�D3x�X+p:n���uH��1Z`JrvInh
�ys^�! "�Hמyu��1�*$Q�a�/���׫����i�h����ϭ�i*'$��6!t�x����L\��g�ȐTF�3���bmokD*��*�S~aO��d�B�&�G�[m�ŰiJ޾>�`d5�$)�}^.����2�m�3	��E4K�s����f4 ��m�3��~f�R6Lr��Xzx`:�T=4�'c�I��J+����9��aз�8�Ѐ[f#Y-�w �3�إUB�,��O5F��-�Oc�8u��{��bn�s���dN�h�Jy�dy^É�?����2�X�ט"�$+q�^��&��c�.�$(~͌�����������M���Exig8�C��zp�ڍO��R�.�(ÙS�2Z����0
~p>��y{H���^CO�n��E2�5�8�d	N�U��t�1&���KQ��;�1���BN Ҕ	fp���,J�ۖ���8@�e&�{���x������u�֜�{����M��l-8��4Aɐ��\cv�� �>Fˉ! ��7�L��3�$|j#�Ȉu��v�ژ�f*X�L)z��d�+h������m�_X�	$j�6��-B���Ǖ�Kj,��	��$4T'Z�� -A�7rb��G��`LO��>G��2���l�Q̐��Ig�y��[U=��C3�-t�E��@љ���7;�'�?/�-R����~ȭ.��~��0���nz�_������m�v�d6��3�U�$�A�OV��@��P��p^�9~���d�*���9�<R��v��cFN:}Is
����]�؜�^�B���c����2�V��g��ϵ�
�}:P/)�F�m��b��S������,�q$ٚk�S���]\���� k�"�D��{�L+2"+2��y.kQ��ޕ�j�b��Q5sO�fDZ���Tww35�9zN%;]����D�G������u4y��G��O�y9��)��FM������Po�0�����S5��hjK�b�4ǔu�,�n7ow��zy�E ������������״���S�X� �P.�v��� ��@+*���8�׮��雑f�z�h�a�t@\�9��NcE����Q�5�,�A��[�������uŠ)���՜�����mk����ީ�^1�ρ0�"�!D����Ri��la��I3���ܥ?8�HLJ��M�U��e�$���$���+%W 8S/�l7���^��"�PZ�5�$�Q�f��MH���)׫���^V������"[�H�1z�n:�l���tOН"OKBx;P���dY'����J*��%��q����̬Te��k�s|�3��8�	�70qEqijj�0���12���T��vjY��!����'� X���H��7ؔL�X^Lq�@2:����]��������9��FəB@��1�FPАAZ!�x��Vw1[o[�5h"x��"Y�ۡF#1z�b�g�0Z���w��Ӌ���S�^"�� 8�� )ʰK��p�.v�_Zup��H��i�q��N���O�@���H�ö��TOƄ7H
ξ�@`���<��I�m�������$���iز���������4R�O��ONc��@7��*C�	��訩`�/_��9�i�8�V�*��������ƘFT.a�8�L �T��@Z��ɔ]�8��ޟ7i�HZY��(H�w�	��}W��e3h;
7"���l�|E�9�x`*&�w�+�Չ�z�ar�A�PC��� ��t8�1!P�Iǂ���1�0�⌲7C��m6Ɣ�#��9�G*Ȁ0*�M�/~�;#�y[)��qG��}�}Dd�P�������� %@��ϗ�_/5����0�8���C�Jub��y��,��2*I>�����{��u��)�x��Km��6�
�����D.�.��{��e��;��y[�^��a�����fUڊ���נΣI�G6c�=}~�efWvjP��`��n�_��@�q�p�t�>G Ǌ9�Q�|/��n@�����mA�_n�w�妘Q�J��y��Sj��L�r)�|4���|��}�1Q*>eWSk�#s�n���/?�a�X�6G)
I��"�85b ��@K����W=�,�-b;+M,��nTa�%~c�CN��տ�-�u�NzAQ�&H�$��i�ƭ�;���m�B��;*S�ƴM�A,���|���U*��2C �D�� �r(�3m%�Z>����"�GƊ&}��a�L ݚΟ�t������`�IEqЄv ����]m}u����:�n�O�7��ݘ�q���
i���B���9��Ĝ�o�v_��������k���eb��/=s����Z5P��%�}�_Kd��p�y�x;8$i[�n�LF��Dg��Z��A-�Gm�W�#q>�xcX{�43
�#T5� ڐ�7t�S�TW�����ԛ*��	"����mL"C´m�ZE��v��"��X�T�O�u�n�r�D5q�^
�\�@ݤ&��"Ө_#`ըi�u �'举6Vt�"���&J 	����V}5�a� 1�H%̛A�G��ŗ#�������rw��D��C2�L3�^Qb����D�����������ʩ�Ԇ�悕����7�xx��ʔ�Z�hp2�Au�i�x����ewb�rWc�m�(�H;y�;3?#}�D�[�?�O��㦪Kh���Y�� 𹍟\�l3�Ù5_$�u�nH��G׺���lԟ!�g�0��{A$�uK���8�����!���b�&ʙ(T�E�XM������+��Mto�0�`�%+=��n^
���^/�[k���E�0���C�OK�^�8}Ȟ�Ώ-6"�aG-č&�pa.V��׈l�$I�s9vm/�0L��8������ �?�Q�V��/�[Fؽ�,���P�����r�L���?b�.�y�ξK;hP���?��(c8�GI��ur�������$�Y�C4 ��ZZ7    ����$;�=Qѡ�1�A4*�҆�7�U�4�,p��ĄU�.HQ����َ->~�5ƛݻ�m�jK�f������� ��K�
�>�Ƈˆ�� �Bt>�4�|ݣ{�6v�
/��=�$#a�PfLʯ�lX��Od�ޭLh�B�d*UXN�H`�~��G�B�w+�[G=�aUW|4�����e;>�����R����wc9�п��H���R��~�Y���R�r.�2�E\O���T����Y��)� 	9d(!�v�!�����;7�W�oh<�r*�u��ڡ��ӖKʠ�`�p޾ޝT?�3����O��l9�V�?~X	$�Y�R��G�'���9�:G�.w�:@�A5=������!x�!ݬ�/�w�v(qAO�$Ife�cfղĺO�ձV��v�TRP���+��K�C�Q��2����#�S�2g�m=�/��I�܌��~u�R��x���	�'�֥YdoV�oD3ԍ�/=�}�D
�9&}�:��`�O��C��ɘ��x�����y^Nב��	��CƁ'ET;9��Ň�C��Tz���;6C��<����'a������]��lxsR�
�w�60_2��&������x�{�I�޻x�<��D6>qG{�m,�����6��>��*q[f�xl�2���D-~t�AZbtt0��Ѩl�+˔vW?�Q�#��AE�j`���P�9禩�)^}���\�Jr<j��w[���f4}ܖ��]G`�{�b�$�90��C|�8��P��bZ��O�e�O�%��fT�^I�v*���ħG[���`Lt��^��=�KC�n����}����GP��p�KB��qS���C��W��m/wK�/�)���a��F�/�&�Jk^����%�}N�y��j�@�2D<�Y�6_ao:*5�Y���(�w�M��@>���;��T��g�����
xm�o�J𔁒��kTN��y�V�.� f����t-�P%03�Q[�lc)����$f ����a��Ϻ������K���~����x��FR��4ո<��r��IΎ�<���5�%|�٭~ǝ���n_�Џ�� Z�W@�c��`{���t���g�,�kz�0�e1��ojy�K0?M"��Tv���s�A3��s��H�˸�w�.��� pG�U������&.W��'�H�I
�S)�$Y'�:H��4n��o��Z���fg�_�{g0N�{�y^I����|UFK�q
x5��?W�S\��x:=Zdy(%)�㠖�����ԡ�"�vS�?gkũ6���n�WL�wT'S��&"�I2sF㖭��hs&'D�o�1A�s�=s������-�חp�KK�boZp�j �m��A�%�v
Q��`�Q/ו9��r<:U��	�'0l��n�U9�:_h�����$���tQ���v��W?\�w+�ʶ	�_*Em�fѬ�'��<m{����hy7G0�!'��ͥ@޻e+{��Ca�EF0L��c" ����-��/��8P���H��ս��0��$>8�k7'��0*Ma�%x�q�&���ʝZ-�"�K60��x��G���L�sX?{��wg��zVA,����Ú+���9l�e�=��rG�e@�np�O5D6�%�$&H�����0j�'��'����\ʉm���Z�+*J�9=q}���`�$�dNڂ!�5h���������NBB��2�c�յ����32����ߕ�e�@�7Q��J�;�)�J��B��2��jn]��^�t��>�	�A��GTa��uP�8,��+{��y(n'�B�	.�kˁ�Ysǹ��Bد��l�V���%X�`�����b�<�
u19�TN!=�n��M=���@��n�07�l.�rCƹYq_\7GWn��7�ӆH���0C��v��
�QV�(�5�#R��R$_[XQiP0�n��m��a��\����ǿ���r����@�X`�I�";�!�������îz���9�vP����Mn�tסS1�����5VM�'uݓ?_v��}���b��Ws�8�,�TOP$W>�; ./�KL�3`�<��G`0Z�� ~��n��</�ҩiOI�=%"�'-���q��X����P2��%T=W*����\A��\���_���yDڧ�g�W��͞\�`��0؋���Ȉ�~C3h	���������/1��@�~.�l;z��P2B��$0���CX�h@(G'<0���P�OnY�V~�T�f7P�A�]a�g��D��R������0K����i��ìlﻰKͷ��>a����-ڭ�I�4"�4��%���:8'FM~	�+X��?�� )ݧ�*��wO儇��h��k�E&(�� �E[~��]}���[m�%�l�j���HܐB�l��-{fW�N7�W&��}ھX*�ƒ���Zm�f�l;E�&�4����J0��q_��ń9H"��$`3�쁨-98ⓖe��iCt�옩9�lC���
ݥ.U(u�yj����k��4����Ҏ���V����]4�`L��A���"#��5���hr}���p�S���M�sH#��9����E`� �{_��ȟ�7T6ˀ�+%yA��;�6yӾC�rJ[͑U�1�-��*"d�(%�1�u�!�޴]��:����\h��u�N\r�����>
�?���!IU:S�ȓ+�h���R����͔�m?ـn�no���v}T[�L��aw��aKUv��>�)��g�L��&^���.�AS��r�4�c����1f�%�R��ߓ��ԕ�WS���V!ʷ9' ��ƽ�r���aYG/����
a�Q��K��\��g^Z�t�J��U�fB�0r�0~�K���:��*g���972�\��$��b9��onT�A"Yhc�CQ��L��X�R?�m)YyL�fa��P-�׃�8Y��Wy>==U���"I�ڈ��#�-.!��t��z��=����TbK�f#sQ��qB@�X��-O�+v�v"����o�w�717eI%�������$�R�>�ϨR6^�~����}��];��)�+0@𷿉0�N��,�&ڏ�	o���oN��_/�ǧZ�E&.�.�* ��Az�|��*"F~mΫ������ �ܧ�(T� �� �w�T�[�$P�� q3q10ym���V�l�o�x(y(����%����OxC'ܾ<UI=�[4S
�7��E&�vz�.8���|��W���s��|R9�<c��,U��?�MK��(P����7@QD�QSp�g}�IM}b�w��w=~Fq����-��Y��fI�P|�A�24�Uk����:�2`�t��D�'�I�.i�v��R�dm'�4���-��?��:�"C�`C�;E`� \�n�9��t�[�+��0I�K ��/� =�bx�Y�Wy�-0y/�����'��n� ����.��)���1�	��vt��7��K�7�ᰬS/���m@������&8�7���>���<��Y�<M�6(�WP�@-.3K;�\)�1"����i.�������іb�|�G'Iw��mюp��M$B�
� [)̈��̈́����+��3��,��	�F���ó�~$'ˮ���گ�jw]��9+�I�A�7�P�	#}c�.�"��]�y{�X��	��~� �.RB!ғf�z�@��DL��9j�+��P��l?����������O���Q�A	�mr�XU��s��k?WJ$�P��X�T�v����nU:=ut]��?�%m�?J02`�n��~�~�ҭk��A�@�G�bD<;��EO �����)�.�d�<Z��G��ޭ'A��P����!+\V���ҟ�ͦ��}C�&i%��ss��ĭ���Fp������<����jJ���@�C���f7��d���r�R�R��R��!ڷ�u�Yf>�����o�e�4�xK�B�B�Uv��"����#���NQ�JT�QH��2vP�r��r�j��F���!p%h=���¬[B��C1��X    ĸ��x�x�,�Dv��c��h�d�iA��uIbB��J�И���y�˵o�]hl!�QC�ܡ겐kp�jyub��G^�u��͵� ��Ի��]�����¼���&D㣹�S��i-�`����n�c��`�&H��G�X�RS���j�؇c#��7��Nĉ�d��f���⩷�vW�r��A[60>����AbY�z����)����]+k��";"�4yZG�*r8a�sՁT��^\�n1#�ΰv?�]��?>�f/���!f<�G���Ճ���6E������o9_�Z���l���S}�������ZX{������2�F�̀h��<�*���a�t�/O�G���������~@ @�>[6�����n�S�e�"��~#(5>�G���6�����r�C�<��2��2�HqA�3�a�{_�e���v.f���:^3�a��К;�P�R�7�A?9�Ä�b4�tR�0٭�H�~}�s^+1���(W-`|7��Ηh�O��hD��r�|8�(�Z<*k����4�^,m?���R�G#���[�����/ܻŔ:��|��hk�^E���xw�$4��⨴�-�վ��t�ho�������*T�n�t��2���t��ˢ�C���c�F8��O��dD����%�82&��KX���8�P/k�#1�2���CЎ��3�%�R�	�e*�e��[�3!L~o��T�j!�5��c6�>̢�ua�9g��n�SL��f�G�����E�ή)7���KZ��{�5����B�)�R��O+�m'�PTf��K��A�)�F����~�To(��<�2�Y�br���0u:K0�.���T�WR���C���59���tޘJ3�]���IE�����F1�e����n�]ã)���P�r�B�R�� �l[1����:�������$׎(��B�Q�^��n:��国�Ď�����1�Qe%�j� Uf�bߏ���b����9Ar<�7�d��]�0W'MŵP�����:���M�>����~)᯹��}�bn�b!��_�ļuXk��L��ϗ�=}�0o�2��\`�N�/(��0�e�����՜�?
���=��9���t�*��	̆�iw�.U�;�HF_kx8sk�['A�_hp�ݟ #��?3s{ .���(��}���f�Ȝ��z������1t5��w�9���q��J��Sȩ�M1L����B�lu|r i� �r�-��x!�˶X�8��2̒fd��Lţ2u�`9���՜�}��fj'�~X������@�W�Ͼ��"�DB	@�@�t�e��P������ٳ4�4>�W?Rw��6�����z�5e�~p��;q��0jO1���V��[F�J<5d��QE�����=��r�Tڴ�[�cGpO��V@�W�mM����L�c�h�'0��M��+�x�5`b*	E�~��$��)�4�s\"��t�{�j�=".���O�4;��Q���T������}D�	��b�f��R4�5��*e;�A�XG�	���s7ew|s��>�׈�n�^��dQ̔� Q�q�&ɚ�Ġ�Ɛ�ۊ�����CgM#x�_���ؙh�1��`iv�$�k°/�(�D���%�1�MYjhK�cJaM������$�V4:tpb���"xOa��O��Y�d}�w�(�C /_D��\���K�.Km�Ec�7���8
��ٱ;���P�A�j������,0�¯=0o&;q��U(�]'�����u�!j�lS;Ň6�x�U7�0쩈���4��0( @�x�(mlۑ$>aǺ������7%ߊ�� W3+���yx�?r NOHЉlgB���� Ea�=������X��H.�m/�%�Sb�^�m҇�f��+j�+k�`�"G"v�B������{v�A�p�N��t����Z�2��(ҏ�'rVྒྷ��[�i��ŷQ_�F������Q�o���v�
�NPh�p/�V�*�msV򈾵X�xl�<�v�����r(�-"kM+�����l7z�n���kQ��q��u�\�_�nN�tX5�5Xf���>�Hc=���:��ӟ/v:�i4���}�>�BRq�F������?���A�A���]8��x ��=���G
����u5~tlK!Vo�����3��FöW?
��ț�����m�j�������Z��eYl[^�b7,��~�q]FI�`����c`����Au ����v½�?�^���A�[�m'���������1�b��u�� �ī}�0lYC��'��M.^�2��υ堡��n]<|���H�&�,��	$Tf�3�P�� :;N�1�d��e�(8�6E�{�=�A��ڶ�uYT��<�H)��o���7����6q���"Q�.2���|1k�g�8���H����HQ�imX�q;F�J�F�1Z�i�W���J��a��_׀0z @H�v��B��[��,�e��{b*4ւ��T�,�ZJ��w�H���	���]G�/��	�$q�p
)�?����I�ve&(���c,��v��-��Ӈ� I)��O�OQP���1R�X�+��/׺e��~u�<�j�e����/?�[��p3[���1N�8=߻�������X�6}95�<�頦 ��
a�R��<���Ά�=7z�����۰K: 7�2v@�!���18%���GV�����fx@ >8�t7��z�]�����)VV2t:l9�)(�K<�M}!\~ݯf�M@���G+�cTur<����������y�\�Ѳ��O��\��o/ke�ҩ��l.�D�ĘR���S�l��<�����V�
�6R�I���U]�|	���m��);[4�}��Y�ACW����㽦��#gJ�lj/5�Q]��҆��,%}|�OK��\�L�!�[���2x&;������OTx�����.c��)�=�\ߒ���ȁw�S�Iʑ�I��Ԕ�gk���~�~sz_��	��d7�z]���f�-����_)L=ֻ>��J�8��k�U�VUgw(��}�F��1�3�k�hakm*_��}8	C�e(�U0���C3�9,�O�Z�s���ʊ����ɶ�g��TwDhh�}�,���j�ÓQs0�m�mv�D�:1$D��h.���<,ŗ��Q<A�x�z�Fbk`���2���&u�ǸB_��*�,T&c�%�%��`��a�C�ݶ�`�QÜt?7���rN��HQ��y���o�������j����>�\h��G��T+I:��Jɞ9pT�`\����Fʄ�D�aQ�e
�����#��Z��ȋ�ߔ��ޖ4���
CUc��ݜk��j�t^w��/Ʈ�+�Xο�<�(:��߳W��A-��yy(�NkY����\0�it�?�jOn�i0��V2/��k�#7("�Rꁷ�q�)�q:A���	�,���D2,�X^�ɿ�]�(v��m�'�)�7���SdJǼE|=ՏDR(�0�	�?�T��4;G$"I��s�� ������A��0��mbM�	kB��)X�䶍��V��OۖcK����G$|�@3�Uc����I(�� ��?	�2܎";VQ��ʼV���� P1E_�:Ń0�>P���yɽ)죖1��G�s���ц~q}z����)�>��b�z�	�0p�!��1�,�Kt�o[R�V��`��#��_�_et$�	sa��dj�c�<}����Բ�
~��:�oN� _��+����U���u�83���{�OL"3s��5'�t��gbZ=�RO�FD�0%D`>֧��`g`������������GKF�����&f�P�������������T��P�dG�mzXh$m��+�˘6}��rg��Iuh���C�J�����mK�����Y�^@�.�G@}��a���>�Vk�4:��۬%�H��|XG{�{�O������]���Jhm*�1����W�E��I<���Z��a_ ŧ��}'�lyZ�;���/�o�;�\!R�/ۺ/�T{U� ��k�)�\�����r ���1�}Q�Ї��͵�Х�Q+U��+�    � ��o\��J\�Z��#��$�9�#q<���_�;=�B�by�ߝ��;`w�� 7��ad>i�x�][5�N^��w��_n�֥��@�.}0���f�%\H\I��wK=��U*B�s��s��v&�5!z��s���?YJ���ٛ���"��6���ȰR�=�h�I,Bd �����
���m-z�%�YVw�%[NQz��s*%T8ºι�Lj]�4<̽1���Q��e�at@�j�]n�&�?��?�cl�A{�Cʹ<˼�(h'�Gچ,�~`��	]�wݾ��8k�_ꩁx:9�P	I*E5b��n?eo��u�3n�N��a���d�b��݆X�G'*-�!�[��&����ѯ�ؤ}���dÖ҇���KV�8M$�u
N��a���%���I�Hjz:d�04��������uY���3QT�'��{�;�;t�����t]�u ݈:eF
A�VX<
�m`}��8���(�Բ�� ��AҞ��� �<�,��O�����������P33l����,pKܙ.]s�dnk5AL��=�f>�-��632LO).@a%	���i5/��w�{�y� ��mGwҺ��y��r�����Y#ގ��t5�di-Hx��
�htMf�Νrt�i?l�|}�ı�8�-�Se����n����[JS��2��z���u���9��{����gݰ��`5��?a3��a=!��c �u��؜�XNs��|�XFSӅe��Y���߽����i�I��`�:�ʋJ����[�:o����1!e�v�cŴ�?�/�m,Y�i�C�"�~7�Fא`��q@N��7N(M{�`��V�"������~��O���g���$����q��Z�S��jw�8�0~�=�k%��v��RɰV�q�UA#�
���(�$' ɝ(���U8����W��M�cfI��}��y9�H�n�Jn�DA��"m����1Ʒ�x�D�κ���i >��B/���<��D�5ensT��V�QX��zp��Y��0�&1��9v`,��Z �m�DRj�J���i�ڽ���Z>���p� �4<5���JO͕!�r��h�k}w �m�����o0S��YHZ?1MGD۔��ɔ���{��O5"��ew}^$n �T�\C�^�^�,��<�|�t*�̔$���u��T?�q����eKC��SN�1I+Ho�Y~�݊>��j}����]�� ��vڍ��8yB�,��W�_�wO�pR�e�Eƣ>z�y!B
�, �Eҧ��qE�'��䘺�A4 pIB���qY����W�J�S`+�%�����[��V��des�����w�0�6�Ś"�XN���1QU�X�Rc.(�Q�x}[ryǤ��'ڱ�� ia 3�����2�b���-Ux!�����=�g!"S��dHea�q�;�$>�|�������r���Y�z^=aj�d�Q�X�m���4
5. ڷ�(�"5�4�6B�ޖoE��R�3���&��n�!�k���v.���ˍ�S���x�Z���%ǎ�<wͦ��݆�2��'R[ΐ��|+��`�����ꀕz���w�i�1��b�m5��&�r\b���	k�0KU�s��fg>������˓e����\"u���n� 
11�l�ES\b��폻�B���g��3C�Sd@�4�Am���̫D��]a\�1I=��=�9e����d������3�3�<�C�p��-�q�jeJxi>�c0�
h�N��q�C�Eӌm\������z_��E�;��Z����3Ϣ��8��f�R��?�~�ǅ��C�x�UP�rlD M�!�&°][9E�)̑ԃ@A"~c���������k	���ޝ�n��6D���[��R[���
��rvl�o�H��3��6�
޽gu�^�)��>|O��~��L�v�b��*QS}q�;�nj�������g�M
�(�=�GpΨR���Ԝ��~����n�
CQ�K]�}}qy$�)f����y0�̳h�ڰ��Y�d'^��\���)�	�
|���|9���{F©i�j�YL}�����\��K�M�s��L ������(W2�PO����g�vr�l�m���6���ǵn5�EC�`J�~��c��Ӯj)�2�&o_h2��Qx�ı������E2D �Y^�xl�պ��M�
$$�pHv���$�TKmX9͇-������4~�tR�W�&Б��x�·�-_:]A#�_��)��/#�4O !U����~��O�p'���X�'�x��/7jI������@� �K4|0�-J�.*qR^��k*�9Q3L�<b��L*H�meԺ������g��_���,�5��e�-��Ԧ9n��a�ӓ��N]�❽�帻�1d4ʾ�bz��."�sô۶Y�� �K��	�b����*#t6�"n\j���/3h���g�5�0�Wr��M?�DdD��^�� ׀����b��W�㮆�r��#�E?�,����R���H�>}؄����m�4Q�D%���V�X���2�KL�o)���7�f� �	O������v��%I�R���"&�-��E �?�B��kC,�9�?�x;����7� ��J�+5�"50�c�߰��__���F\��,Ta2�"�jl@^&���~q�����R��N>��b��.$����`��\������!�g7��3"�N�ȏgJ��~�;ޝ�jH:��T;=DDgi�ʾ#�_-��5��:��.�OmPv��6D �xm;�V��-G�:��@$zU������L�B�Y�����2��ޙ��^ts}}AiCu�@��c U:�EG��p󒣑���������݇jn�4�8�@��"����g���7oY$��g\�Lk�=H��;&[��tT�����64�����0%	��uK�Mdw�Ǻ�9h��Z@��� ��!�x�?XȢ�����@�ߕ���D�&��\����u�w�C�vjWl�=�6���z�p'�� �<�g���//�����j��0j}HY㤀Qby�Y��X��c8�pkȑ��&��ܔ{�d����M���:��)��!��1AJ����?�m|�,�v�x��Ɔ�T�XEwdl����Ɗ$���A�ԁ%h�`@��b�Ia��> u�_o��%3�g�E@�z����)&��7kgǅS�~�����K(�  ��@��е�:6aw��l�坝<wo늣Y z"{	^��i�v�����|��w!`��VB?���t�. E��c�W=F|Ը�5�~&�k��<r޴vvJ��Yb=��Ugf�h���s��wy�������'��ڏ� �Ҧ���6W���a��8"/444��B�������7���ԛ5l���S�����?�P?9���cu��Qi1��:��N:y	I��D��0\�efʤ�җ�3h
Z�U��,O��Ӈ�-�i͋�m ��k���(XN�n[�̞�������#�_"��Hk5�8f��J8�o��u�]W(Z���"~��|2���b( @7���Yjy��Yr��E-��z�̾i�ߴ��� y��*��5Zg6�"��cG	�>ԼC��\P�//���!m'%�����2�9n����zHh�wH����՚�`4c.��w�}���K�PI�a�(�����~��̷��3��g	����ǚ$n�U�$��v�+���H{.�����	yuL��\�0 ڕ3Ӡ^�e���ܼ�+�H�o�z�R�4���$�x�r��r��2s�.��@��~9p��	�o�<p\e�z\��_LY�ݬ9c3��2�o�?��T�\]xs�j��	�C�z5ŹI���rzH��Ѯ*Ms��!5�fӬ�(��`_���Yz 2G��[!��~�e3�a��m���|�d=��@Y(g; �0�W~���*c�֎�A%no�P$j����4��,����<ˤ��o������)�>N�,���ׅգ�GTWp+3n ��s��_o��IѺSV��ь��Zɩ�M����.͖8�Փ��    łD����~�ز����g�49.��,Y@�*�;�Ww���<�<I;�pf���{�b�>���b[��dAƺo���9@rf�[��1vw��	�[(5�� �*v����+��alJ�P��E��p��.Cpa4E���O�����V�.�`�Cx�}�����M���D҉3��tP*
�\���_/���B<��y����Ny�c.��?sPH9b����pT>�R��k]R_��t��%����x}��u���?]}�<j�����^�>���W��6��^�8ޭ{g���D�W)���Z/���
Am�J�6xm�P������W�g�^GWc�5��c)q!���QA!����+d��'���j���(s}<�   Ccya
c7_����$��!�;v"!2G�+���/�_�-D��,f���5e��v�D�+�,��:��b���
:�"/�T��g7w^ QG<[�閍j�t�T��DY#�1uXm_�s�-��-�/qt�;�az��E��?����`�B�mcM�qK���y����(RZxh���xjH���*�:�~�V�`b���rK��RG���e��Je�m%�B;�-k1Q7 ��e5��_��Xy��Z�,�hX�������S��٤��գ�{]"�Mh˳3t�43�¸��\��n�Ԕ}�����B"�;�{&[鳬g��Ҝ��55�P)cYw��#�f������Bv�TG!$i�4�[�8J�z���^��s����|Vmm���a�fs��!��9�P���y,�ws�aw���|�s���1�0{ۂŉ�)��P�Y��m cT|�Z���_HB:פ���+F���������=b��-��0.Q� _�� ��m�^S��P�H5��B<uW�,��lO���D�Z���O��^��[|�@�el���~\(!�<Ē]QC:��� h�׺G"��Q�H��	
���d�Б�ݲ9�&�|@�%P�L�����ѕ�s�v��yRA��J��4�v�!{?C�v���	uBz�t�� q� %3�߶�t7ȁ}���75K
6��u�`�@Z��H[{qxX��c�<;��;xZ��\b�����(���ɞ���Pt��R�ƈ�z (>[[�//�M�R$�PWg)���RǤ�"�Y���k�]�`$f�E*d0abt�AY�)E�*�?���w��0�z�鸣|���w�v���!� �* |S��HH�_|�
ߟ���:�����ᔁ�d<���9;&u�Q-U�L�Q�B��э��8�H���~����,D �����Ż8F9��l/O�wkd�`/��[�J�$(�&v�ÌX������H-x�.&�+��0��~q���oSRR�^��5l�i��G@��� ��b)��f*��5�����\H>X"��;A���f�L�D���Fá����R���I�RfHXqtJ�s��Ѻ�ق���f�-JxQ��3f�x�ܶ�^h�֏����VZ��Tdì-���~�`�ZÜ��@������J�]��"{Y*�bb�R�D��Xs����J���R
��v�I�ą�Y������]$�/�t?�O�fN	F�X\L{sr!MSL�<K쇫oN�����n]���gq�33�`�T<'�O����b�����YIw��t���8��m��q;��^ F7��ݒT-u@���3��/����gICJt.��� pC�Q~6	B�j���3k�����|,l�u�8�myd������r"�C���gZ.̒��#8�����-M��RA%}E/���[��=�OcgÒ��Ԑ<����ZK�\��6+�
�qw��2c��2IT�J&-AYԡ�}.����r�bC����3R���@�YZ�Sn*��,O�ӆ?'"�&�� �Z`?:��mؿ�q-[�_�ww
�<���3���8Oь��>S?!���`7�<��-q�Ƅ�ފD��]&�2{��|�$2w7pxc�v�!�3wA���Hk8�tj�c
lY�ʢ嶖�ƒ�������u��}�7k�%�;z�S0��S�@�ӭ�@��P���Hu">���i��
v~L�>=>U�q�TF�6���� �ܰ�� ��w�Dԏ*m�Q9Po6�?��Y'P�-)L�F`!��Y�'�e����VTP@u�,;����Y�r�8"U��`�G�3�疍� E�8��.�����5�x��˶Fp	�.��� t�q���9M*��k�)��.^�]0�y�gy��ḱ%�����'A�ѣ2f^�}��E�?\�J>]�9o�� ��[7s��]�e*�����^��}�3h<�;�譪ĸ�!<��k�S����
���
�'��_�vV�e�}ԭ�W��3��m)�������G����Q,e�;.R��^������^��I]a�����9����N�;�Ʈ�Z\���/IW ���Tj� �8Tr|���-é��QT�B'�K���J)Ǒz\��_�\�g�r	�"����i�N)��h���5^j�/�@�13;�l�*	�H����q�b6�J�~���G�baޭ�<+���?�F��XJ=�A�ЉA�0�}t��b����S`Q0��B�ɜ��P�:`��[�|}yڭq�YR�����-�Ж2�ُa�;�����N��$m#Z�\�Nѧ0Y6����t�MW���j��q�@c��g;+��2i�?�(L��ŭ;�i��T�T�l���{������~���3d(c����	�O���'య?��'� 
!m�x�ڶP�m\G ��5��-�<�,k��(�k��	��}J�N�}�W�ٖ�=�c�l��GZ��؆����M_hSN`� �՘a�\���|��?�%����ۍ˃A�s�q��AFƴ>��p�l�m30D��r�$8"fT�<�h�硛Dw�w�	P)K�H�CD/d��m��y8]WCȊ�T8P|c�=�),=n[>T3��|.�J�Zh��Q��X^�����v��,�(%ؔ��LJhR R�\~�7,3x�w����N% I�!����b��b���a���� ��J�tv*,e�ń��N�݅=��i�0:������0t�Q�-s��F ��� �����`�8�۹b�>�@�E��*ȏ~�h�$��3�1���]6��y�I'Q.�kĤ�>���x��/��m���}�o)y�&c` T��0���S%����3Sw��>a�`(ÜJ��̃�ݿ[S})=�66���و58%��rw���>���wq�$��Ns8ܹ�އS4�6H��
\p- 6t�m.?t˨[��-\���y텮<����F�_J�x$�������:N'�Mt��`�z��8�=�5G�"8 KE�!Nt��6,	�"J{|)$��o}暘YE6U���	2���Z󆙶}�Tf,��nغ�ߋ������1��v���M���Z'G��^6K=B[��P}��@�HZ6.0Vj��Z���!�#0Hpp�g�}��(n��\�6�g�X�KQܥ@C)�C�ܖ��bɫ��n�A��h!J�s<3������W������Ġ�թ1Zp��0"�QX+�f�ޞ��7Q&`�i�B�*�$�ܱu¡r~w:g�q9Z~1������{Y�'��2T�� +^V6�3�ܴCy���Z�v��^�8� �`z�����k�2j}�P	�Ye��O�čd����F������A�����TB��n�(�2'~��|�y����m|UlyŊlE�����OF���;�/iR3���n��{l���ò"Ϡ#as
i],��M�&�z�<��PsB菒���K�X!s�a�I��ò�vb��rh3Q�"���gX;�㛳���HK��7��6�5: ��nZN�7֬�oFr�Y7;o
70ԉh��'��x��rw>�|����Y�����ᬮS �����ϭi�y[�^�� ���X�����z�����9:,cJ���h'2�z�)}
H��GH9�YRT�=Ǳܺ�_6HFzM-u9�nt��<B67�9W\��
����Y�    u��f�i�����t8m0d�,�$�!~>�.�02�ź];��$�� 3��,��:���!g��H���fM��^U����4K�8K$��:g�Hͫ���uy���`���m�R� �@�:���&�]v������N���
V���<���I]��AG��Q�p$,i��ǿ�/����n$683�*K���CS������q���J�.,���T&O���V�[����rXKQ�H�W�{�L~m阣��}���x_�J�������$���S��uh����SgS+�'�Ô2T �m�����-E7}>!ξ�]n���h���(�8��%���V9?���_7�q<4*>�%��G�2��e����>�Oo���^��&���W�]�i�����,ҹy��jդ~0P�E�M��v�m�yD�����{�´����M���嶮K����̽L�+lгm��{J��w���,jwHSC�Ȝ&����6J��yg�}�^ ���ò�+���l�H���Y�/U'ʂqW���jy(�t�΂|���h����(q��	�g�u甪̇nbvf�;Mv��B�@#|�����g������ZRa�!�ct���6��m%}���ǅɲJ�5�)�_?�2(�0�ZT���Q���{^�!T^]�Hl�=D3в������+쎚�����:h�G�K�b�uCD,j�esP��C�0	�1�4M���poN��g`(vsB���"Z/@1P�?�E���e��#�I�aA�V�s����R�|�f��I�ST>���ڌ�*�^a��á�R�������bip����YfW��_*���q$ 8�Ϛ \���@�1m[����03
A�������̰Iص�:��e�1�|}l��,Î��ic���j�/w���;b1��9�k�#;J	��$n[��D�����:;K"K] �hs_]�2���=���l�#`�3Z>�L�������0���D)�#ӝ�@�WP�t�l:W(�Od��M	x]I[�~�Du|m��S�kg��-4R�+����6�q<���χ���I�z�FW����p��5�݋fw�bug1�	���Ț�����{8`N�g��N���Ea7@���g7�v������O����C�h�"�e�\+��n�*Ϝn'>�D�ח��Y@���2l%�{o)��T�R&C��s6E�1l�q���$���PV01�OA1�b�j�e��J��eT�B6��X��ьp|���?���/��"&��ОS<�y� I� h@�O��P������G����W��I��
n�3zj@���L����]�ʄ������H�}���43�q�1ʡ��Ips��euǧ5�E{ԉ5ۓ2�'����8�y&İ�Pa�x-��0p�&l����޲�Q�DM,6Q���M�ay�,yĀ����2s��x"�p�-e����[��E)��hT$�N���d����+�ϯ�O1
=uppqD !ߋ|���)%9Ro��1^�D����\V��������tu��n��%t=P�}  �Q!��.4�q��z�&����X`����) �d2|�f�e�^�{�Y��-�� 6�-�ҏN�>ǵ�,�!�ۇ�D4q^�]�L��k꼧;�ث
��D	D��f.,��d�]or9�$��a3�4	l!��ް���R����{�?.�M9�aj�]ᥦ�k�E�xVu�]�G9e��v���������Q����>��l��a;�A�=�ea�9��T g���m������1�L4��(?�c��ٻm���J�ȃ>��}��R���ns8�S��V^M`j�����������#[���>�r�Z�Xi_X>x��lzL��P� �S���N�u�3��6ΠI���}�§L'#Y���e+��6��q����TǴ)���� >�~%�����t�)�S��Ύ���@� ��u׏�Bӕ��X�0e�0
~�g�������.3m�͢:Pj���)-�B�
$r��c�љ����e;+�/�\0bk��Z�S�V�a��C���K@a\`���O���ُ�S;	�
W@�g�~��\l�P�"�K3�Nz湯�v_����=x�9��A�@����<����p����� �4�D�sB�QT_}1��#���Z_��M���U3�;�������h����u�>�b�8��Z�I0�{n�4������ǿ63��[���QL��	�1���:����S�x�v�/�fỢ/��<���?����oBY��"0DG��4'�=�0��|������R_9���Bi���G�v ��S	㷏���&e�>�:�0s}]����m�s
� �-��P�f�c���gGR�x�*��&��d�j�P���Բ��ZD�Ydp9~0�Ȉ�偀x'B���Oi�9����S��o�Gذ�B����`��+A���6de�X_ζR/�S�2A�.�kRY��QT�H]���Xe�l��,M7��<�f�mYc�/jپ�v�K�%�eD�����-���̭F����N���� J�l�u��n��#U��v/��uyu	>�xh�}_�Sv7X�0,��\2��+;{��1�9��#�7 ���I�7K��)�g���8S�N���iS^gp42�q�@	�l�{Čuv�RO��L�p�6�[t�;g��p��h�T��K����s�S����`��
<��h�a۷	��Br�{���S�|}�Pn@��s�k��ڠ�9���TϚ�������P"�F�X�}��7�e~��_�k�Ċbp���s�.줴w܆<z��rd�A5
!�s���H����T��F�x]ޚT�����#��^�}>��خR�C�jN�ŉ;�P�{׼��t�[Qbi�p(dc9��^�͑�1���\lO��p	s1C�&;㸥�WnYFm�+Qc�+AU�	$}���(L$ҿ������Z��o  � +Q�>;*�<vş���%zF#b��c1f�c ��bDsD��Ic�mFF�������{��zK�&��ǒ�����"�"�-�He��>�}�M�&�Pu���\ &��z�m�b���m��G�e�
���.�i�A�!{o��H��,2fo~dg6=���Y��\#*�@�5���5���d�+]D��vw�z��&Ɍ�;��C�(�4��Fvn��r���gC��G�����n�z	Q��]�!�m��QA!�p9nL&�"�c����nOS�m�Fn������~�P̙?�W?oم��
� D�@nQJy]Itz�.� �>]��u��\&�sT���d�*˯�:Ӗ�:��z����n���<�S�-]÷����~�y�Š�Q!D�����yG_�K����V�E)m�?�)h�@\�٦K�r��6�_�#C��2�jz4���ǈ_���<�j��	���Br��Opx1�IZ�(�����:�J��f�1)zT��5SySJ�@D�_�'�;V�0ΫA$Ym<���5IijcOy����a��m������� ���˚�*���
=}�%�����.�x��6��P��Lc����x�{`�h��ֈ�y��S݀���<c�3z��4��,�388܏w��I�x"��EF]�d'�}S���\�����?�TGL"	�Xg�����1�Sܲݵk��� �#����r%7[�Ű�#A�VG�2cʰ�3w�7&!E  �ްwmp���������+8�%ʠ	(Q�nI�`,BS,.1��k������6�!M�[Y��C�@��[g7�Ӄ������1@	��N��4�)?�VH G'�"��J��E�SS�@|�_yR@���GAu,�܉�|�����?�/ڞE��m���m���eS�����ђ���(�l/�3@R�v&c�~ԉ�J�1���mR�[ӞװVFD!n�H]��T\)J��sh2�?�jZ�Og�i�U2��� ��]�N|}�O�KW�б}�< �p;0��$̳�MP�%�#����a�2�{��8Q5�3�g
v�L�Z��.��l��f<+I���~��H�    Yu�"9$������I�;��#��W3��5�7�C�d�s*o�;�Y����f�렼��v�q�b�lD�/�][��	Z�9�G�X�qs�f��<�!��"e������Kxeg�$E_ 5�S��ٲ|L1~�g���8�5�D��5f5����5b��jm5��5_��$���	�w�� ��ܶ�U	7:l��=�Hj�U5	՟N���J��:��J��'�xff|��P��?X���jI\	�ϱ��v%�����v]4�Ǩ�G����v���@j��a�z����Ӝ�ׯ@�d�F��B/Z>�u�Fﺐ��-�����*�q'J�4�hsOc=�x��,�̴+�7�_�� �#FX'�չZ�}���շ��Ӻ�4��Kڠ5M��A��瑃�����"t��뿞�>N�e(F	@t��Y�y�z�9h[��Pә�����s�Y���ȵ?��^9�(�)ݹ�k���3Mqe���22�* ��Dɧ��<��%�0�^k�"Vv�-�/�{7��h�b_�ȋ!d�҉#rq�Q�I3�6�H�P��� ����DBV&ؙ��ډ��޸�r�ځM����z�M<��$&��è��v���]���G�r3�h��Q찑���G�4�:���a��1���9���'3�7�	A˝�g1B�l8I!�l&_��=7���v�6�� x���ת=��.'Pe~�`����XO�!��[�Y�����xEkI�+���*�ܝ�#pDM�;�8h-W`ھ�=N���
����?^�|^p���~1���
�b�o�7��e�]\�ߨ����z�ggg�d}��F�x��X�a(��w�����򞶳mQ��������+�.z`U�1�%�2�h�ߟ��3bh˽%w���������蛏P�U�t�����9w���v�\ޗC(�!]ڹ��Q�:>E*���������]���sqr�D�B�4���t�x
�4r�.�A%Q���3�S,�\Ȭs���
�4���\r�e�9��ì��o+`{����+��u���R$J�zT\p��3��A昭� 
?�r\��2�%��iCy��4�����ӡX�R�lm?j&G���fJ�a�|���"���X�W[~ �<{,	���X��#��XҼ ��3t���@~;GHI)ZoM��9�k�90����%#"�$-�n�3cfj��k𨡌غ�8�b�Rib��D#r����j���^���������rc
���M�7���wp/u��]��������湡���<h�������l���1,��N����jK�<�d?�ɍ��ʣb��}�<�9`o��x�@VC�2�k$zo�{ S_�7!�Z�65&�<��I��i
�$��ݍJ5:5���:0��=d������7�ma(hut]O1�N%޶q�n��8F�֏�T5j�e'?H�*L�t��W���������@ӥχ%�W`�шȲ���z�Ab����cD�Ȼ0fժМcB��t���(��-+�*w�R��E'i������X�,��ݝ�_�#�];=Ҥv�-��6��U���/˻�yyW"s��Xrc�᧱e��r����	v�V���=�!�'���n�yؽ���b� 6�!����_b�`�=��E@�`�����u�K�%��,��0`j�D���0x|L�����9:����)�I~�lC,�S�)���be��O:���a��v��~��֜����v���f�� G)�"#5Csd��)�;�^aJܬ:���_}e����,x���=%3��B��O��iY�����2���h���n4#�LPK�ۙ�n(�$(o��;�^�)\��"��:�s��Mͯ�qW��2�M���r�;��I(���M�����s���Ϯ~���t�����"�*}֚�o�<R�c��M~���DD1(��0ߣ]�t�տ��_ژc��6#���(A�+̴�\��PtL�)�^����k�⻉
)#��"[|�D?y+$!���Č�W�U���f�a��>��=�u8R¸t�u�o�������3�)m(Rt�V' ��_�%
9Kh��-���A���B����FآЅ�)P��ގR��#���!k
k/��-���Hz����� F�b�:#R�]Xw!� l����ͳHĔ~9�&Z�xDгqw�.��ӆ�1�I����co���Fa:<�/�\ޖ%�$�)G V$�ᖣJg$-}����t��!�<F��v:�@�!.2��"��R.�D�������D^.��E�|� z��VV�ś̒�7,Q�Z��V�ſ��g���\��O�ñ�r���p,�6�t��Y�����[�̞�ǀ��Z9��>�E%\?��<����ۄ���CCw��_�	o��$p�n���p�{gyf� s8�4�]eu0��`/%����?nnO�Ɉ���Cz��E�>�	�w�Q
�
=����E2���w��^�]��X��whx���,����>��0&�s������ ��k�9�x]xX�F[�s�VI�n����t臰�"��e`� V�[�5������0���u�I�j�*~�a����^���:�nQz�W�b6�2��ƹ�y�U���:����7m?\\���娼Ni1����=��Q�V��������y��\̗�7��-������̩@�.�dA����5�Ƈ�c�]7�����d�������9�ؠ�ܸD�� �7�鱗(�"���RT#�4�our�@��Yꋰ��\�=��/�C��.�� �
�ml{[C�P�SW4����+X��ԍ�^���Rh�r�
�~cX)@ܤ�X`_�elO���0�_�W���n�j��ԸK�ǃ�Ѱ���S��h��K� $�>c��� �s@Ծ�S$���1��f��,`�,o���%Lz�a*�H>���������:.�=}e����$�a�U���-�_�ۛ�(�uH��eM�"	�m�S]�T��=A�F�%S�Ǝ�`�m���o{[��T�l�|�4Fh��s�R�[ؖ6���/;�A���4 �Z@1�F��2/2�xg���VՔ�
�q0?�o�O> S�
�gR<E���ڒ�8? ��A[&<6r՝u��8t��\��̄��������i�k�J��e`��}=N5�ٶ��I���#��~�t�>=\���-�$�	M��v��8��y�ܽ��)���a�l�YP�"S�T5n�����B��+�ShE����	4��������6�z�Qʛ���qɅ�4��EЌ�Xka&�$�R��n�;k��Y�biB̋�nM�Dw���[o�
�ڒ����j�X�μU�����ǚ_�^������'�հx��Φ��yr�a%���?�a� ��ҏƋФU*!4�z)ރ����6ă�NjѶlb@�36�#p��yfq��oP]���^��f�$�^��i�xS�y;�ϑ��>���b��4*yx�<�))>���.� mP��H�M ��%��(0Z���u��@�$	m��	�9~�шv��/.�O�k�����6�f����?�3�y<k��_i��"����Ts��=w4�ú���8������1[7f�¾�躨��w^�w�ߡ&9ٶF��^��%��4��(N��`��a�$Z�v�`�n��%Rl=ty��;�1����Q�A��"�Dq����.
|E���<IB�s�c;�pƏ~���t$ʌL9נm�SQab����**g��\�k�1�%��;F��#����^ݡ�����p�;~����Cu_R.E��=W�!��ſ��w�[4��rgA�qu�3�$�Q�\>��))����/{�~��z�ь��O�?�b0��XD��vG��8��Cq�~���H}��(��;�Ec_S�f��Nc����D�Ul�pZ�}��ha�2�o"�� �qm��0w؝-�_�ɨ!`D*"�cJ_`R8�1�̵&`����o;w��i%���a�����v������B��J����$,Es�l�Z�'.�rk0��ᮋԛEK��lߜ^Q�i���������3N�|��z�Z��c��E    ԏ���{z�{Zw�
��(\�+D�zO[a�.s`!������gt�y��<�t�:)��a����X>��%�o��LC�����#?^��q�:r�PE��S�:�5�>RAs��42�er��|����e�����V�X���^/���!V��r��R4sv�m%ݼ��i;���H}�D�����v?��^ ��N�X3u9�Ga� �����f��󺪡$����-^���`��ah���YLӫ����P1��,~�(j���G�r��{�Q�7'���MYz����}c����]��(Ǭy6Z�⅟���:*�T�|Y{Z�wkl�a<��n(�y�MԧðWp�>�}-�ut]g��wԡ���������b��v�����6����:-v��a�U���r{~tc��I3��F(����
'��j��¹���*f�ƤhG�:=� ���S�z}f��N�z*.!�Z���z�&�X���<�����;1?=��lGr�/��"�_��N���lk�ltD�@暁������9@\�!� rhG����ڡ%u��Vu\B0���x�FZ�5~d���U���㞧j7:�m��^�/O�������2�3+�3]�.��c�S{��mb�i�a�T��23hڇ�O��S���AxFs��Jv:i!�e��b�oua��"*7%9$�O�rS��.�7v��t?�0�]ì����s����_(�-��3�@�-L��h��K�iR�����],�NZ�)���V�R����uޝ�>}�)&f���逴�B�;�ם��������h'u.���梆9���P��V~h�$�a�@AqV��Eq�z�b��!t>82���=�������\��(���r/Tr\�E��j�b���Eq:�sW��x��"���;;h���C ��V�
�c��e�iLq	�����m}���3�2�<�}kW�5)y?r�� V�����XZ�;Ө�ML��ACn��gz��A<ң
�]��B���˂2�[zry/i���IƋ�F�g�3�?G�.a�]�V�@k��տЄ���o��������+����VF�<:��\��7�w*����f\����$.�^��a�;
v�M"�m�#�;�64�	�!�u��{2����TceX�(&ߋ�O�A��0_[�8�\�{&I(H$�)�����xR:�n'%��l�
�cҋwF?US�����U<����/���v�:q��Lz0�8�p���� 7�(�������Q�a�4Nj�w��!���ʾ�+���>��S��)�#?+��K]2���,{ۢ�����f���i�� O&�v�;���(Pn	�kG"~8R��|�e��v�xv����"U���b�YՇ���z�M����X\����P��%KJP�����~��������w�Hi�2��\E��`���6�Q���UՃv���7.�K=���o��IOL�=v*�Z^խ�p9�~������$��G��Ԇq����aw���*�pN>6
T� ���3�-����t|{�yR6�=n�>����rim�]XE;�R�-����ß�Nz����/K����� ����׻kIrY�2�)R$��r�s�_�B���$1�Ѣ�UFFTGfTw�6��?� pQ�i��~���9�	�Gh�	��{��]��-��]���(� �Ũ�k�̢-
��mL)r�~�S�TlV`�@tj�ǫj�nJcH� ���u{ix�@z����?N���:˽Sׯ���'1��)�$}�e=��7<�&#���hP���a�A�)����
>,T����b,���G�b��z�{}ڭ��
�R�{̴�S�!��jlA��uU�p�]9L���1&3�������p4txJ�B la�"�n�ܳ�vB��ަCx����a϶������r�?�ޚ���6%nLJ/��
�12�iZ�x�Ɵ������������)���8w�m�A�B�>����0�;�D��T?��|�p���sK�0���g@�l�4���{����xe�ݭT���,�|QP��i�ɤ\���N�fk�.��v:&�i�-#��E:�s�N|�{�,E����L�da���ؗ�絉�hIxh��%�^,d�$	PX��0��u��� �1�\��"��i9{><���{�g�I����:�o~�����Fg�"���ńĊ�k���	��J�����>�\�(���B�@a�>5�H�G�]���Z����/�e����M������)%��s
�:�s�I�L$�?��~�k�$�>��U�Y�yi>�vHG���S�aC����\�wx��ϩ�z�G|����e���nh?�պ Fo׵[!7��'�̈�N����`�Lr��
7��\���v�o�KkGyk���,��%c��f�ݽ<�׏E�4I��{��R9���U}k!;u�7;�m��'()����ف��Y��#������' fP0/���E�Dh;�鴪��>���P�
��[;0��g�0�7�j����Edxg�NN���L��3$n���h�kÂDp"3� �d�P�%��_^�~ܽ��a]����_K�[����~�����;��kW"n��؎�l���@�M����ݭr��ޢ�M�.�jr�9[0��-��h���7_��q�>a� Ӫ�'H_f�)շo����ǟ���0�pJ�#Z@�r�ZX}����}U���@��V!�y�'D��_�����$��0�B
�2�[�&�f�]�������C�(f�6��I��Z�}��n��:���� Zo��,Σcz�&=A����@�l�Kk�jL�D6V�% ��f��C'UҡDێ4'�H]q�ʝE~��];ОG�P�1�E���հ�+���vxH!{�7�I��U3�am����w��+�_�� ��&b�&�,y �a�wņ�%����T��f�c�([��͵S
^V�oŔ�+���|s+A��Rr��.��p�1֑froQ��-�v�s�#�a�ee&IhѼ�%�m���߾1?`��D�X�K����A���h�ҿ���};2؏�PA9��/��xBZ�b��koJ�^��B���H�ƅ���̆й��U_/C��G	����Ҟ�v��a�����,���Bg�d�I�B�d<c��p�ˠ�����w�ޅZ�F+�"�\r����/��ߪ���W����������z��!R�u�鸥8>ML �i�D�k���e{� qZ/'Zh��6�H �`FnϾ�ge4S���C�2H B��F��o����@�����������-��G �q8J��A?lu���e����[��a)�7������x��{ �;�g�ۯ�"D.0��tr%�����\�V�v5�I��! F7Mމ���uZH����ӡIsd�� �f�]J���q�g;�&�]�D]:_��rȈ���[���H��]n�	0��q�iQ����r� �w��A֗��9��Jx/ <�����0o��ώ�;�a� ��/��pY�t��r	�����6w�I�8�VL�/t�W+ ()2ѹjy�2���Ɩ/�lEk=��D�b��s�`g�����G��)gp���D�P`¶��GTOow��v�R�AI����%cN@�թ�=! [�a��Fk�6XB <�ar���D"���3'PA�o,�=�ve�t����w���Z.H�If���%�����-���ϫ�M^c�vdW
!���_���q>��^o�#�СM~��!mV�HA;� ��3��m��~�pJ�QO�N���pp>�x,�/�Z����R]L�fU�裃.珧	gANvHa��3��������F�-6�"��RZ$	�ב(U�M��D�:�X\A4�A�����3�O(����Q]�y�}w���:��g�1������$	�-�$����D' &X�����~��W;�Sd��'����	#	���{�� ���������|@9o4�Ѫ�݆ �R�?m�F{��O�Zb�)
h�     N5�4���V��-�|h��[��:�LW�H����g/��__k�˗d�f���+
�te}�A��z�Pm�2����FQ�s%��m�|��=�<d���h`{>�g�Ox�m�>���t��v)ڨv�w��a��i�������>]�w}�R)���͔}����(ޏh@�Phv�{ ��~ay��;�����1$���`���VΝy-�4���O([H$���	t�ɋ �80U�{`h6��+B���6���*#*]��s�i�^n�ԄO��Rt�~#RMF�������>Ph��]�&@�1k����N�b��E������E6Bjg:�d">ߞ�����X�"�ݺ;P���y�4A5�@�w1��h�D�c������N�DHm�n���0��xbώ��r��]'����J�h@����y��>&<����n=����t)Α#�EQ
��17�4�>����%'zu��"�'�yМ�hܐ��+$Y�j޳���І��{��� ����n��C�!.@;��a��7A}�Є�(�]-�iZ�\�֦D
hD2:���ۻ��W���h^ɵ��&�&5����1O����.�h�ה>%��NX�>+���-pK�fo
 M�����G���dU�я��f��!Q(7�+Ѝ��}HK~��y׮F�2����1�y�K�e��ö�v�o|\���t7�%�2I$�K�������Uͽi3�����4�y��Sp������_�����ʜ��l)�Cعew^X�K�?�ĕi��v�V�#&�s�*A\2U��������~��R�����	]V$��9'���eMz"qAA�Y�"���8b.틵��~o�lU�'Ju$��<�rn	S��y>}x�鸱��f��h����S;�,�9�>��yXg��;7NsL�D�/�BOR����S5���a����!E�h�AR�{�M�`W娮-iK"ȞAw��*�uKʃ�b����W����F؞=����{���j��p"�� �S@)a�DD7-a�~�1�&�Hڹ�C<��p��D���G䧏�_]l}"�Ӌ�¿!-�C����҇5e��B���&)�-m#�,]���U }#�i��};0��G��=�Nu��UF�E�o��f�/K�φ�Y��͘���� 45�����&�M�G�Z�S���������H��E��'B����Ch��3u;�^�j�%�~�^0�#��~�9 �)9�r-4�IiYi��J��pL��+׏����O�ݽmo��hj��cB���,1�}�D(vbo�_ ���/�Lǝ�=�sH4�8��6�
4�fe\c�I�0��c��Hj�z�d�@=����L>m�ҷ�߫�[m�x��݄XJ������dPi��S��"�["�F|�)�'�X���x�cZ�`r:�I�ID�=�ک��$��Hi%��Z��|�o7�����}��eYr���!!M�S�{��}��z��_�t����A�'� [ a���C�U'��<	�Ku�,5�c�j�is�u'�[��L��Ж,�M+���Z��l�iN�9$=8J�M�
N�Y�jn�k}���^]�_����@��W�D���M�k��=L�����]]`tXꏅ1���X8p�%�7A�&���0�����}˱��/�ou���(�f����au���<�(6��)ղ/��">��zR�d�7���E*QG�����:8��'�+G^b��vx��º�xn>��� ���o>{�}������3�V�;�|�s�c!����]�a[����f�$k�GZa�pr�~��d)�Fn'�K� ����n4$(�9�#+����n㢃caOPiX��.�8�V�����wb.	���ژ�8Rlm��siTs��W�FNkyF�D�s$e�c��4��6)�����'I�ٟ��1#����e�ᔳ0n�$��%��V7�3u@?vl_�z6��t2��3��D��i���K��]f���Y�x����l\E�h��Rcu�����3�3�=濼
��6�D�s����@�n�~�&�d���[�M?X/�o��h����w������~�M1\^ R����ǽwâ��V^�ϻu�s'x�����h�юc���6{��������M�A�{�<�e�N�?��
ˡ�[�_jē��@���9�[dy�h����PX���K3W>^X�`�SX�_sA��n�����-�a�Y�օ��H/~h-s(gm3QT�f�f!���z	��8�Wڱ9��|�N1�W�2�9j敃}���>�������f� ���;k����f�����6[ �T��!��� ����VY���D�v8�:�Y]F�خ�%s6&�J�:N8w 4���@�Fа>G��d-�pXk�5DϮ͵�N�O��H��m�g�ה[/�'/B�s�9�:{t���0�O�k�h�t����)@"��E��k1[{��F�����lN��]~�~�Lд�L�E�0ݞ3��yb4���~ѱ}�9�PO�+�x���s�E���G��O?=���@��D�x�VL�+Y�&š�J�u��Z���������0[��{�������v�?��W�m�T�p(�,������m#�Sڐ�h���V��*ò��#���M�#9������~�I�M��Dy��VUI�MaW�Pa:���LA�,B殏!�{I���!�������ь��=)a�mk���j����l���b�vb�����h�}�T�j=�5$�%�[Y�Fp�Ǌty�l_�C�ʢ�W����G؅��2����OL����W�����Bl����9ϫb�!�ڠ�(�7��$|{8ݞO
��8/�	���s(�f &,��}�����nW?���!��.��(ՂI��^m����^]��Kg�,�E2��g���;u��
�:\l�zM��Y=�gz��-�<�����>�|�N��ӿ��P��fv�������M�׷�gA�r�/v�a�%7��=���nw���n���U���WĠ�*r�Oӽn@N:;���(b'q ���t��10�x�N�Mv�ՑE!pKz�<�Pr�Qǻ(��s��S4��H��U��a��S5�+{�'g����������J�à�,ua-.������!���T��
���e��>�X�8���b�� ��ޏ#<Mșm�'lL�	�u����q�r��гӣ��� �Έ"YĽ�9�7�_k�œƢ�>�.*I�M�̆xRr�g��zi�ymi�8��p�=0�~�0̿V|�e��͡> �;*4>�t���ȥ����'���4�"��,���V¾ڵ�8Z	��f����Jj�F�vƤEs����B���{��n��ؼ�ǟ�f�ݳ8E�?vj1�	�ݠ����.���V19�w�uA�D�,w��xm!��Tv�^�8��wUC��^���\�^x����7X�[���w8"9�#�;���,�����������Zv�P�2?�?�2i�2�e�h!Z�q�wx�C�c��E�Df�t�t�:����|��|�������T�-@�� ��!��{D3���i}�&�x�����>T��.2������8Z���_��U����@�-��6hvr��������OvPȫ���${�lfeܜ�{�O�@�jn��EE�J(� h�gr|�����w�͈w
XA	�:T�T{23�c����_�7�9����;�W��}/�|����1����;Ȱ�� %�Ws�}��ڮDb��6��í�����������#��%���cK���"�8�¸YեL~u�=h��¶��l�E��������4�?������ΩD��E�Ui#؎��Py�?��u�M��Hdv_:��D5lB�)�/�b�u������=i�g�[_��$"�B�Xʁ4�o�*h�9q���O�����eQ�k8Ԇ�L���������-3��t~a�����`���;r	�
���&������ý���g�{}���Ì�,��"��F���/����`O�f�z���hH�e��#�2i˄�f�����缅�4�q�����    �͉:�Z�)�\\� ��������p�%w_X���A��UH�,b}.a���7�������������]�l�	�0�����*$p@�����fq��W����K���n��m�ŮƱ�����&i��}�R,ų����b�LG1�Rz,��jt������o�/�,��Ā/ VF1y�- �Þ}����Gn�g� �����Z�8����W��������A�>�M7U0dG�ծ�a��o1�%I��q=B���+B� GB4�a�4ig�b�o/#�b���h|H.���-���G�����:�P��L�ZK$�	���������z:$5���8�����͍_�?�,��d���F��?�*C	�:y��R�;��_�//�5�p��O�����*y -֫K�_���3�yn@�Aԩ��s�h�4��M�;b�@���@^x�_́b�m,�sL�[&(7�a��v���p��v��;W�A(��1�ÉdeZw/4��7/Hx�� �:E1�ɋ�=Gx��|i���ki|Np�8�q)ڙ�|	P�-��x�t������r'�Q(:c����^�M�x�����߮����=M���I���*�`֫n�g�(��:\ģ�Y7��y�p.����T�i&�sD������;�7:O<i��Wk.G����+�@�����ѳ��0;�G��*	�㣇R8�V@����ʮ��U�B�Nڧ����� l�DJ�5s�V�9�i8g�w�.>Ҳ�M�|��pD8�9�5���j	�e&o�[lq��u�`wV�]��������$���8^[��輲f��l��cHi��|AJv�<�{kAa�Dɒ����$lV�����1�w��j
�[OH�	_5B���N��$[g�(���I<��)o���8h$�����]��C�>�2ƙ���g��S�qe5��z�Ӥ�ƈ[�wz���8���|�\T𪊀y��O�b���o�ђ�A�9�l
KB!���s%���K}/P���~�o��I��0^���yg�2�n��fh�ċ㎛Z����2��A�)+�O�q�]T''�(��}-��^��F1��m���M��K|�nm��c�]�ݼ�h6�9@�_Utj��ݍ()��rR�x�~��o&O�|%n�����fA!}E)��8�9R=_�7���z_<+P��X_�ў�-�p����h�4\:_�P�w^��Cг:������� )B:�b�sòe�S_7>-�;yϏ�y��Yܴ���S,��Y�B®=Ŏ���y\^?C=ӓ��a�4$����Sᴷ������9~�yv��&d���_�Z���ˉ*ZfT�c6 �/Jr�%�̫yAV]������y=���\����E�`��-��vm<5s�]��kn�F��	���n���awڼ�+��Wt3NVUKs��ӽ}�ݮ���V�3��u&�?�l�R
;wl�?(EW=��Ð,�=i@SM�L�>�����^�����i.c��+�3ƶ�)xr��1�G\�vo���V� �
Ǒ[f�AU_G7�uv��]6�A@���8�@"�����O}w~�Y~��s��Co�*mF�aV"�|~����%Kտ�C��hib�jҔ�g|^�Rt�WBǆh�j@CS��g&G�V�Mjk�v��ʶ�CAKl�@4�-�i�0��"�nډ�t�o�.��A�x*�J.����35�I���r$�~��$�)��5�[�U�#gRZt���,aZ�&y<�*��,�B� �Y��D�d�eg$�����qF��aξO$�R�fU��~1
�iQ��;������jh��oB�b�-�hc���� y��B�<�����J�|V�D3� �;�B�,��^�g�u T�Y�4�Z������&�wl�6w��H�Ͻ������),�������|��+Ö�,��_q,R#f��)#۸ow���ۑ2��4��SK�HM�L:�=c�$j����8�}��.�Jq�0�sW���lh5�o�zzĬS0�����^���v<����[�P'uR!r=|%���QZd����&D�����$�Da������C����RiP�$��� ��d�o�6y�qͽصC����-�K�#�
?D�վ ���lQ|4��s�~=�Id�(���Zg+�!���Y-5�d�d)u;�\��tɓ��h;�����"m7�0OU�O���uY�--����@ZO�c���G�p�����$������E�S���!It~؟o�ٽۯ��H��K83�D*ʹ�����/w�@J��g~�=�/-��J�׫sWX5�p�I19\Cz�����w�ָ	� �j.���i���?�K�.Ќ�VK{����B^^�j*g����ș֔Z�ڄ
8�e��rDS�T�e�G+�gw�lmJ<@b���Wb�����{8���)���\�zњ�/���A�T���s{�ɞ�$�U�4�v�����t
ͫ���Lpq�s��z�Nq�P��,2_�O��n����U=Ny��ib���U�R��'akK��[�{戟�����)���S��i A��dğI(�@�l~�61��w�Z%C<B�&�fe��t�4���n��x]"����ʚVD�$^I�d'a}���'
R���B�տ��ۧ!�G?U�����` N"��A_��lFb���	�@X�F�
L�!�E�Ԥޛm�����N)h��2�Z�D�vt"{����(�vݯ����{�s}KM��C��9��gj���0�Nz4�v��K���O�9ܖ$�q!T`'iajeT�?{ 1U�������Dcݖ�-?`( �|���F��ٷ��X��!�Ꚁc��2Lq�P��~-a����EҪ�&a��@�R�D�"�Fa%����{�͕Dh\������%���xT�qػC������n�쾃ݫ���W���v���	h��f���
{
+|��������]�����;�)�"����gd�n���*��[m��n���֢�b�T�ӳ��s;j���{Cǟ�4(b0�3��e�E�����oզԣ��.�}돞����j.
b4BiwY�/ w��V5Tf������98ݑ�N����6ԩY�,S(1�U1@d�<Q���pw�.1��N�z�y�-@�3>
	D+�K���00#��������Y��pй����j~��o������C�
��2�U�G�f⦅��Y�s4���
C��{���j�9Z��v�,�����/���nN
N_v�x��/=�d�O�e��5�/�p�r�"Wb_<�������Ƶ����`�
e]'��3GNo8yJ�8ϛ� ��D��f� � ��%���+�qw��2���&hp9�	49�U�9z-��Y�3�](5���	 ���	,��Qh�v}@a&owow��G(~T��G3Df�4���ZN����D�Lк0�$�7|R,�me��sK��i�~��K��8-S�%� �u�~�i��NSJO��ؑ %d,'���i�6y���ᄬ�Bݐc��W1�4{`�W�o�|Jy[�B#\M)"�K��_7X�6��M�
zi��9�"D��C̕���DB�S��D�Q��`�[�!N���A�K�?���I�v�z���O����xZ���P���mGd5=�:.53�5��m��E�cQ�����z��
��P������DU�����L�`Cc���7���^��?XS�[L�RC�E�]��D���|�{)����R�$���Td�hk����~>�)��UOg�K-��gU<&�؊��]�O�� �����/�a�*�B���د�M2Ė�3���nY����ĥ�s�}#������&����w�j�~Q�\W!��xέ,�����=a�V��d4����c�o����R-K��!T�	���8�x[�څ:�����悀�AM9��ZAY�8xFM�n��!5��^_}���1�5C�﹅җ��O�� K�ͥ�D���⪂�`9��s����B�*"��y�nV�0    u��/)��I����狡W���d���؝&;Jwk�����U�]�����E�������x�޾ٽ?߶L�+D.���r.�ƒ�7��Y)��?�l��oqiX�.Xư\|F�jp�&�kq6��G���"e����d}�pỷ�q�]%VD\�|˰M�K��j�P�p�A��}h��.a�JZ��7du�%@ �m�(;Fz�L�i
��ͮ^���YG�6�
, x�A�hXϐ�����tkN����O�1=;ݾ�(޵g��ͯ~�_L�{یY��Ӈ��OD,nKo	��ǃ|&ɥ݇i�1_q�T;���t��/�F�~�0���~jaq.�ц������7n�z��V���w��HɃ�D2�B�i���������rm��@h�8�G?�G���s�����تj�;��O��O��8<AW�YC�Ϗ��j��{�Ox�>�ȿ����`Ξ[R�%���}{',���#)��aH��`i��3�����_�����bLe ���#�����0Q�>~�@�/�w�^A5�-����U�'72�74]'��y��'�;�C�^<ln���]/��޽�_�k{�	ѻ�o�9R!���!�s`n�9��3~-���eaښDj�,u��$]ow��7�?��2���2�i���"���O��vǺ��KDT"�qF��7w!����}5����h`�dtk�p�Y������s	���,�H��!�������J�����*�|�2�9�"��$�܇a�R�deoDbv5�%����E1��[T_�͠�{�oN�p4ـ�]?��N�^�L?�n��/�)�|؛��lmn�!�^n���K��	rHWC�!"y��ެ肋~�Kl(�i!���;������p�P����u����!%v�䰾7���׌�KG�=�o���%��Ybur�춠����S�����ǔA�]d�๦󑤗��XF�m��A�E4P�ϣ��[�~ɹ�]V�jpJ�ˡZ�ؔ�ۗe�e����O�r�u��?�����.Ab�p�`�>�Ԯ� �´���cP����'5�~`�	f�0-u�y�����L�i��A
AXo'S� :�z��]���o_:��~���<+B���a�w�j��#(��
��X�(��%��:bۊp}3�;d��d	IE�DcK�heJn��4�3+#��R�DS�^�?�n��yf��C=��Y'�yte�Z[X�{�H����k^z�Mbx���<BMan�-b� �p����'��vy���AT��I�d_q�@��^5k�|��ΣMs�������A�Cs�����|%�m{@^3��_έ�S/c�m�Q�kڀK2_�%���W�wv`]�JV"s&�F�:*�H	l�4�!�?I��K�"��ݣ����
��Kk�]/p���\roY"k���r�h�S�Ew�����v*���9`QDn,8��;�ڞ1;j��s|$Y,hϒX���6�_*1al+~�D���l�V�9��/����[�b'9ۏ�p��#�Y&ؾ����yI��]@ ��=e���҂�|�sQ"�v[BS�s����
�#jw�{2_7�,��Ժ�۝_�d��	/�� E��0�ַڬ��D�]>eQ�-��o� j��6r;�e�l��<�믐7��4����/�;i��M�a��V���y�YA&G]����껇�ʸ�'���Tp��u��~2Kd�'Hlw������d�X�N�Gf�(�g����Z:�ǻu���*�n?� ��>��(�Z�W�w�ﴍ {ړ��ZXR���c=�Q�O}��IP���m���'�2�C=���9l] ����\��#��EC`�)\MS>ad����aߜ"(�s W@��9�e{��< "�r��m|BTj��FRj@�8����
z�Z	��dق���'�{���Ņ$�D"jw��4�����L�+�%C��gǩşa�)�c�ռ�N��\9���@1K:8�|O����?��m9����au�� 08��͗�]�'�jc��Bzɋ�TNE�E�,l� ����;ܟO�w���W����GLԕW�"ȋ;�@������-װ+��ec�q���'H���M;d!������]���ޏ�$(ú���^�޼��xJ9b3�!l_Sv�x 5�[ YD��o��ۇ��,	.�^)�f��P~�h#e۶���	���x	qn|$s�-��u�� Ղ�2���D�e��(�����n�lE�G�txA�-a���y���5���I� �/@���X	eօo�|�G_�`�Fzg�$?+rK������.�F�URQ���a	����o;F���z��	 )_n�3�q������!���߁�DB�~2�c
;~{���%�¸�/�\�*-�'.$�0�9,[�r���`� �C=�K��濾yzr㬄�5􀬄�3���CV�	}^�!yCJn_�@6E���%R����l>`a~�d��:j����x��k9�)n�K���++���]�*��1s�F��BM�Q"�!���ίw��%DR@�8�ܥ�Qo���TO����hQ[���)�ʠ��K��I`,:.�n�?��9��!X#���HB<D����E�Ӷ��9e%�z2#u/PG��Y���ۢ�ؓ���9�/]@*�"\K���~�!D�צ;~w ��5�+�њ�D:�>t�L��0�V��5	G���Xr��w�{_{�z��N?^����g�`A�3�J�% �7W�R��-4�h[&9PWuqp��7�l�� �Ou�,��r@��-�vSC~vt
Һԗ������uT�-��ͣ�񶝡���Wv����<�e���)���Ӻ�VNLM wA�@�MZ�!dͯ0g����B07%
�WA.`B���`4�R>�k
^t�VS��/<϶,�չ�繾T{�����ǟ�⃊p��J�ܽt��`̷㬾3�ܼ��B:�ɡC�5�f��ể�N�1��ӛ٪%Yv*>�8��؆�h�E���9&J�!"%�z��b�܃�dI��k>IUJǟ�6>��$0i�2F�~=����ۜUp�C&!��җ4?��@-C<a�&�t~b�l�ҷ79pBd�������vw�� ,�B������P��)�y
�-A?��S;���Q���(/��`6j�:Ӕ��񄍾�׻������*ع2��@@�Ôܣ{�}9G]�Zv�����v8N*��C��~�N��+Կ�@ǝu�[�D�ԩב]}�轊�ճI�c�Y�J�X8|���eX��� ��i�G� ;���-����׏���Kw>[����b��X{����D-�`���C�ZiX&�&w��T� ʷ�4F�n@�R�6N}X���W�PbQ�0��h�m^���Ϣ:�2 ��^H�I�S\<(W�Q;�.�����z�r3�̱�� b �M_�~(].���E(J��2���
c][�����WdI.]'�[1�
�?���/��C��
jP��_]�GAywZ�r&P����a/��&Š�$���ۭ���F��.�HJ�.NN:D��u�L�[f:�������#7�Lb*ufh{=<��_J@]:lqF,��?Q-_P��u�X8MD�5|�iNL�g��$G�DJ$x�X�>�R~l�F��;�ҷх^m����N�D�"NM�ׄ^\O��m��؜��$]Uv<Ä�Fx��wg�RF�GFZ�,�sO���VW8����6��)��1��/2B�+�/D/�P��#޾������V@.	���C�v�:)���N4�P���������I�����SG�&m|��K ���?\��v�Қ��#��>rl!��#9?����c�����g,�,�)��]pk��ag��ǟnw�fU8&�C�)��8Ȁv�X��SԼl{4~��	�}����\�z��������W�4h�|LA6�Y�x'(<)p�W�D ��[�p}�*����iB����N~esܗ�T"L���0�a����(�h�b��!Z�J8��1�.�X}������:5p�    ������;S[�'���w����������u���H��Z���n/���{���?
d�T�U���Dϥ�N^ �#��D�Ջ�Jt�h�F�M�)	�j7<���x�Jl��IT=����c%�P���K�����$�?9�D�����LrS��{��j�gآ�}�俑3A��><��f�=(�1w��g
�O���y_��p�y_ct3z��f���K*���BY�Hf+;�����qO3M�:|(�HJ'2�};�9�}��p< ���O��M��Nd�/q� DQzy���nS�{�� �b�D���xU��:z�Jy���v��A!@jA�>ӹ?�`� _��g����V��+)�p}�}��2��F��A�q��v��g��Yj��߰���n�_i���);�����v�C�I׍O��qj���`�|�J����D�����\�N͝� 嶾��ˑ@|4zS&k�L�_���E_��\Bc�����L�:3d9?�>�_�����کL`Cۍ�d�f��܃��w���穽���8�o���d�v� .l����r�۽�P�>{  c��c�;�m�E�m�.��ܯ�(UkWX����;ż87_��l��pR���G��ͧ���<5z �����b�����g	��AZ�� ���̰��g�JUF���D�V͠�'
\��laгy�}������\%��3Z ��F����%Li��x:�W2+�cQ�k�Xr��P;�������j781>J�Op��HG:�!'5�]�	��h��Ѿ .x�C�p�@����$|+z��s�q��0I�O���9CG?o<���&kQ4�-R���(EU�T殇m��'��5�Z��.���D ��~�z�zh
zͬgE�1;�����ߊ���/ﰼ�̼�#�����|�E*�f�P�b�+aD�U��6X\cΞIw�|�_�Fa����1�	�����lj�����B��Y���у�D�X�8|��vڷ��,z�M�L��kg9+�w�'K5�N}�t.�0`��|u��d&1�dJ�!<�>��u �)���lJ���*V
z�1�"O���l��͗D��\£�|�IS["�'<L�������D��S���5�)����ʊA�Q��˿=�;�Z/��J'Ҿ8��I-���1+OV|���	�Fj&��1Q3�|�����dѳ�9����=a���o@b��bga< ?y �yu �����]MȽ�<�����:�E������M������{з�!ӓ�|{<�[��B� �W~�%�Hf�¨(�./���~Jw��gy05CY�:#������V��:��r�Ռn�,�Hm�TW3�~o�pl�( ��t!�ȏg�n�k�_0cKs��W(C����<q��`5٩�Y�s�r���	��-q���Z6��n��?_��;zm��x�aq���I�u����f��{?�]v���Q��5G��&���!f�$ǯ6c?����E�A�(x�K_g�l��Hc� g���kXU9�J�*HT
�t�D A__����nfI�/��A�H��dv
�u'#p9p}���t�����m-Ҕ������a�h�$^D�����CNz�0�qW.v���0��@M��
��n��W�Nh龰��B�o@�ݷ�D�S������u�d�L:���։0�h�q��1�����Y��H/bǐ[��N�	��gU_ߟ�y!/H�:���	e�0���k*fg�n��s�lX��C&���p�_�s��֑��W�u6��݃��=1��ՙ]n�m1�mj�æ��t�`r+�2P��_JG� �[�*k��QP �m��9�<��X���	��R�(x�1��rs-������t�����l/��e�������-�6q���k3�ND�䨂�M�E��^�Pm�8�޻�'��ÅY{;�C��L�8�ʀ�������?ۄ���U���L��Gܲ�z���A���^!�ީS;yEs���.)��B��Xɇ�K� ��s�$maqL~zs�����mk�N1�$���Tjg3�E�
Lnn���ݠ>����_M�'����J�)a���Ld�P�4�\ �g 	_
��̋4�"��t��D)$�����t&KX���W�#�kr�V%^¢b~2���Vi�b�A�#-�X#�POF��ǹ�ݠ����g�ғ>?��oy � ����kp-� ��"|�r=��>r�þ�g�ڽ[�A�nj��!��pp�4��o�x4VKT5zv���cg8�K�0ADS�p��i��އB��(���cg���8��$y3����ffh��觵q�?�K/�im=��}�!f �6=u�烼U��~�ߗ��M$��D��6c�E4o��/K���/�����BodvP2��L޸�=�����F$Z�ʡ�rrW��NF[uԯ�4�_}�u���w7�^�~l��f�]Fq�t��3Ģ��5ңkO^xI9F\�Z�4���-���L�f�,��$�p��vh}�1�}���6� ��,���b�:aA�I��%?ҧ5�%%g�<D�ܲ�$�o�Sȃ�(<B5 ��$�ln=�	��|�N��د^��H������(MboW�>IGyTZX`�VC�����>���+~���`�m����p��)������ʳ�;�s$�N�����MI�t�����-d��>��ە8�:l�}�(`��⾊���&q�-C�� ��c��Bb}�K�"R�ki4�6���U��e����*���u��ޡE�]?��,	gFXh ��4�rل�`�VK�����O��mbOK<�<	#��� �l��=��v���
O����!�C�����͟��O�7x��v��U#m ��N,J�a�GM��_������D$��4R��c�Դ?Vw��6�t�D ���?G�5U���x>D�Ɇ�q�L
���u
�܉�����&��X�ˁ�w	�Ԏ�񯀒��\NN�!iw��Dq_D�����:���un�숎������b�9>�Q��o|=qF�������B��st�ކ��uMIy�!�D��G��k7�����A�&��OC����D�h��LE�k=���C�\K�#�6�,����!�����y���6���_n�a�+(�7Zu����x��cj��m�}:���^��ȫ�����y�{{xx�F���= �/��4��OP����h+0����LF-.�}�"	f�0�3��j9{z�?��0BtJ��f�s���1bE����bn���c�L �@��������������)<�"�Zzڪ�r'�i�t�La�I鯎�w{9"�h�ln;"�L�ekB/��b^�����]{���yK��;_{����9ԅ��=��!"h?�H&�'q����A�Q6��:cL�������{yl�L[��d^�"h� n;�Yb�S�R �DM,�� ��Ȝ�w�i���xz��U.*o�VX,����%�K}��]
z�ţm���醛g�B�g�$���N6O�Jd��b�IF�wSO�<AΞ�Ay���]=*2)��T(��ߋ��g���iKٺ��`�Ⱥ�#G'pͩ�a-�<\ח��=�D!�� �d�7U��6?�������b;����*��=��b�;���W�����!�|�{�B`�fQe�n��zZˮ*��	HI{+�����=B�����:E�ݑ�mC\�q'_���C0��g��8Ddkhdw:���J���@)����Bq�f_^��SP�<�����1S��|�7�Oϗ�Ml&��#�3{��-3>��6��a�@�k4C���%�,p�l8;�)}�h&�0���k�a�����y����N?-L�ִ�-�� w�3��3�}��D+v�g�ӡH���3@�˼���q��>��lug;���>T{����ƴ�������nw��!�G'`��0իx��[?1�!�3���|<9��{g�G-I�M� u P@����7�.��E"�i�w:9#���/�Q#�pa?�p�&��S    �vډ��w!���W�����6L�m1���m��ġC=�-��1w`��Oqb�WUS��Z�`;Ў��G�1��r� �_�����_��<���л��R�{C>}D
��;V�"6;�&�Mr�&���=�O)lK�ީg�ZҙO� wK��czU�����M@��WB$=��`�$ZP����;�>�^O�wk���+;yv�3D��w������ds�6��~Jox��N�^�I�E"��V-"��o�ؼ���;adl��s�c��m�Գ���� Z	�5�1I��-
�#�n�gH���j��0�����T� ��C���H?Wif��k�f��içgGV<`�'b��R��:Z���7�������ٝ�f�Ϟ���}���\<9܍�"W1�׊>���5�1i��)0�������6����UP���΀���=�-~����Tr:�C4Y\C/�Eh�vz�]������]V]�B��k���^��ꯘk{{�[T��7������&�i,�]��o_�D	���ƽ��'�$��6)��6��M�c���A*5�����L���֛/�4Wc�+@��>�bj�ʗ�J�V����8�,l|dVbZ��&@��uZ��?�$qE���QT��ϩψ�9��T�|��<��Dɶ��j��`[���ɔ��Mh=ὒ�-j�.(�����G�wz{��~�,��I��
��~sZ�9�B�q�	{��ڢ}ѣ�8�d�@�F�d�KU������Ხ�;����,��ޡ��}.�����U��ŐT۝'w�mG$��:��vjb�+bg���kf�KQ���("-� y����y5������i�вO`��l޲/V�ю�$m�y�Z��PTC��-��(��uY� �*���W�ka8������v��,��^�����M4�%�}��.���0��%:抰�e��)#��e�o͒:������a��l;�-U�V'��2x��2���h�x�:d�r=v�	 � �K�,/vM3������md�0�Ш�9��u��{�|�>� ?�ن@���,�q �8�A�S�t���ƒϏU� \��RJ�o?�*'Ƣ�B�PX�u���D	���n���g7�[G�X�׭�}�v�����`��s"����S<@p
��޽~�;�O�n����~���y�J��J�?����CD�(*�)�Ƙ�hЇ����ʎ����s}PNJ�	��Y�s<����ڃzW١��'�d g۩>��;%�I1v�i���o�Ƃ4Z�:c;s�n�� �(�u�>&�2mC����2�h�NJ�>�0, ��%v2�T�R�ƥ2�~��ܝ�ۻ�dv ��1x�P���*Z+�ߝ�GP�j86����W��%��~�7,�I���P�� �i�������w-�� �,���+g�mvd-�9~6>��f���΍��>��,)^��+���C
zh@�YK�JCS����X@��͎�4�D��]�e��F7�]\Č�Z��t/�D��PF�D	�4p���a�z_m-�%h�K�M�nVj��q�C5.u���'�0��u?�vU���S{�T���~߆��(��Ϻ,t,�/�9¼<�;�N(F�эR�㇃�[\]��:����w��k`��
�g lB)��b7.��_���aD���e�������-�q~�-M��O�H�<�[ֶ)I�D,�K��0�ò��9��6i�_�wN�������� P9��1͠�1µ�.�F�8*c@	�l\�Yu<Z��Z��A���y[tD��4K9����a�������`h�rQc�2�כ33�дH*�j^j��
�h��+|��qD�gE=�����6ȆX6vn��0ٴG��ϡ���4s�5G��K�4M�js8����\��v?�^K�#��[�	���E+�8;��L �����+���Z9�'�.��zE�q�\��g�-�F�aB��9/�c��X���iD^����"8ҧ")�%^� '��*����!�����h���%��?@ʘ%�d��joÌ���7ώ��fߑ��nD���F�QD�ѷ��kэ~��M��T���9*�W�;���3�z)=]�[4T_�1>���D뾛��U�WD�����ăD"(��깼=���I�1c&Kap��ȆP�!$��넦�NqH�Br��CC�&DH4�6��f���(Ə���{AM�5�~�+�^��Z�zy~�O͒Ly��<�@o��ntX�^�wpV[�˨N�E����o]w���V%���Cb�~u�ՠx��e�P`zvd���v*��gqh��7��
���k�`�h�J�@���"���>�i�{�7��������u1�]߮UTº�W��r�>�.�i� ɛ���A4�Y	����$߫�)^LD�q�^,�� ݜ�,�����uU�%!T�����TѶ��r.���I��:�^o�F��A����sF���A��=�|r�]ݝB/b6ETy�O���E���g��z����k�'] =\��/��d��O�S�~h�͌ � k�滑г!��TeV�V���ֵ�M��tb�c�%l�- ðLOp9���nv:���e�}у�a���'x�m��E4�z�x*S���|�������vܭ��R�=�� �t �[gk���b������8v����, �~���e�\v��H�NH^��v�Mm�B��5��L%�X�O=��'�/�Ϯ#��'A�l� ��]��_W�A�t���4���'�o�۸����v�s��lm�3���P�В����;N��W�s%R>]�D��S�@������e�d��T�����;�y���~ؚ#L�;��jx�����d���$�j��u0�[Ö�&UN^�b�߾Y�
I#��Y�v:�A
��i�1��M�6�D�>29���/���CLs��Iw/׏���e��\����5kK"���2��v;ͫG3����Lw�����TR�!�'[��/�?*����S�pR�4�xJ;�?����y2�6��X�B;(X-a��O�R{�a�,��"R<h�Zu����������/��%�(��g�������x�"��>!�����o�������[�C�/�&�#)AY�;�a�U��׶�X�#g�F&�aL�s;�0�Q�߭�����HԎ���c�kXo����2 ;����'iA�>�_\���"S���}�Va�2X�����5�X�����y����$mЬX<����j���P�ص:;ɸ�ј6/�~���ow��v9/p7�T6.Q9e��ҏ_)����9���9�,�^Vu�z����ק��&��p�$��PA!O����r�����7����y9GBq��K����ˈ�^it^0jm��(��l�9�{Hi�*K]b�C�竭�C��HMS�����y��w+F�ʲ��n���Н-£'F�%�W�H��B"�}��μ;�׊�<AoZh���0?*O��rM~$a����o
�!�v�#>
l�F��
D��Ѷ־�8��`���e���'�	S��M���b$�;+<V~ �U���%̤S[�>���H���QXD�]T��m
���[:��V=
������E-�B� �����Zy���"����s�\gh����|s������\��A�r��{�P�\��������~��(�=<��('���������gʣ�|��q�a�D�(.�5ÄXsGi�6İ��\�]/��ɓ�x{��A9�3��c��οPS��ަz���؎[3=��	Rzw@z���n��I��%�1�&Ծ~�����>l~� ���xaN�[Ֆ�q{v\_�&�À���ա[�V�M�\+�ǫ�7�B���|!�z�Rǒ���
��Ŷ��ֻw�Yl��H����> 9��Qu��N:��f��z��A$���/޾�����W���i�O2#�}�C���ʓ����ǿ�+�_K6� ���Wۈ#�J�j��b��te����m9�a���/�n�V4��}U�#��Q/�BՃ�F    ]��������DمGd0p� �#�C��T$*��P�G���ջ��%Z���4�1UYf��M{�Q�%e�ݰ�(�$LG 8�o���f*���6��o(Xi�����E2��(a���+�:Hֵ�F��`�e/3BD}}��&/�ɯ������H�}u����v�.|uB��R��Z��N?[PC��y�)'�;?<�v�����O���J`�ZbC���I]��6����E��}�A�j6ߞx&�d��izs�U[yɭbm��@�zj?��$A�=;�__�~I��Oms�r�t��R,})k�D���'�[�	o�v�6MHh)휫u�~�������b��դ �� {��i�,��X��f�3f�؂�j�������}��w�����f�D���H����%s�ip�������
�?��HN"���)�biz$��Stc:_O%5��O!B3:�6�Y��$+X�ޠ3GUg`��ArDx�  �\ߜ�E��xc<��% �s�"N�I�-�e����A��>d8�tH��3�:��v8��j�m,������R�5����k�� �sӏ�/��`�h*��o_�(}�����^�g���P]V��bn�>+S7�#�o��e�C�b3V�)Z�^�P����B4;�s�Y&�y��,���*r�������z`B��xM�:���!�i ̿>H�-�j��gw����y��-�؀�����>�7��UO���7�s�f\^�|ڮ�ovv��k�p��z� XY�S�4�$Q���v0�j�E��3`��N�1R�-I�˻��}�L�4�nȚ�&�z5K��{��3!��J���ˠk���B��O�P5�׮���,�� ���t�^8V/&V�,X�3i5>�Wn���k�5Qq�߮�	��D�}M�,�8Zh��a�ۿC��pT��mi�C�xR;2g!%<�0*��7M�A�#;pϒ��ݒ�1��u�}��'W��ґ�!J�FX�Vd<K�v��W�gg6�����8�zP7u�vf��7A?�����ooH���S�ݜ#��)U�>J%4c͚&������S�A�C�@o��ʦ�����Ћ������Ҍ��C79CUI|7����i�y����β��i��)�鏀��v�܌����^���[���)hNA8��W�Q�V�h�������9�9*Կa��b������чm�9صk&�*�{]2a����[J[�p<l�Z0i�^�1^8= �6�R���y����ϝ�!��JK1GVV�b�K�����^��!��!��5WJ��yR��T2>�q*���Q�=�6�
f��Zx����U�����f�/���>՗!��4g�H]�!)��	��`s5��/x�I�O���Iؾ�),���_A�<�q�iD1sZ\�l�����g�u�������/U�Ȗ���a�U��V�m{ ���������~�ѥ�K�To�~"�����DMXB��9kc޻ ����J'�^�/�w�4�y����j�-�Bt�ً�;ި����ݮ}��x!���p*�d�����ꇼypH4KDB�\i~����Z�{; �{�T��N�����-�};��*�)�a�_*�E�G@Z��
�^e ;��Z������Ta��f�<������\�<�eR#������������o�G��®�R���Sy�7{ډqq �Va cB~a?"gu��C��ԒJ�4��:���X=A���8A̽!KP��P$5���� r���G��!� O�z�+�H	��	LI�%RgGz)�=b��W�f\���Թ�.~4%s��`��J��~]t�)i�JA��~s��[w�p~/53���$���u�GO�T�I��G�9��,Ǚ�ĒT��^��v�l��ӟb��P݊a,A��>�j<�������	[C0��gX�꩓��S<q�ɞ�����&���������s��'�>�J<,�ݩ%R�ye�~ ��FG�HdR�#f���97�c����nG3�9Q�c�J�9r���^p��[���ش�{��7�nmw#u�0_[4-
)����eV����:v���[P �&~s�[U`��ʎ7N!_���*X�mR͏�\�K��=���l��_/�(�����m���>�Q?�8uü����0�]Z�kY9S�`"�;H�ҼѰT��%�o�vNʳ��t����a�2�q� 9}��c�$)��,w�=ٶ&1�sχ�\Ȃ�Ճ�@�Fȏ�I�A` �ƪ]��ϯ�6��jm�; ��H�O��q�S���\^�ߵ1��s-S
���)��y���ŵ�|�̂o�偎V@*I�U������
1ZR�%�k���h�����hs���*�Ұ��xC����r�s�F������"EUY�{����W���qۉ�u��=.�@Q	��-�O�7�^�3���I��	��?�����v�� ���m��^3��MA%Y
�Yb���P�}ݛ��v���3�:.檐*�С�g���i��<!��(}�:)A�R��[r�/�yE���?CL�6�<�������	_�W��N����'�#=	�
t��	�a^*�M� Ht ��O�v�$�?��ox���?4�ft5�!0��=B������q��<t(@�l�J�d��8a�1�y�������F
�d�t��dc��HN���K&o��kq��ArH�vloĞc�Ʋ6�?������ˈ)�7�*�����Ĉ����&X�+�gH祣Kd��A��P �u���/�yV"�j���m�ֲ�p���'�W˯?�L8�;	�l��ߎ"�f�_��J��&����ud��}��)����@tK�-(b��z�<����`���7���7�#���X;"�ӣl8�z"��X���,IEC��XԒ��ʤ��H�M�����C;�i$�]D�q�P�4?n���_�?\��m��9�,۝S���'�z1�������vG�t��m��bZ�g(u������C� ��~����rQ���S� �ʚ#DQ[�P&����L�;���������]m6!�̀z����*�g@_�+!��;��+ ���@�h�}̗���1S���b�N������d6՘�9�U�Oޞm�=<�W�����(���*PMP�n��aAd����x��c,��?��/:�%�9�[�1 � Cm�G�k󒺹�{�A��/�~�o�}��FF��>�ٻ�9�D�z�X��g\#.U��+�\W0=Ǆ��ؽ<sbl�t�4�+�L 1��7�y�C��8��3��}8UF�ѐ����w!qA�� Gl8��s�~;�̑�F��HaRŀ���zM���[���]甩�d2!�8V��[}�p-n�w=�{N┖�OB���q<����a�L,	Z���R �����({�����d�� �k
�o��]�+��۟������M�H��G}��n�$�#�ك�Gj�_��z�~=M�~k����Ŵ� �	ܙ���"	��̴��1��O��X'6�d^nb7�N�X���\�����ζ�e��x��a�H��z�d
�I�ۻ��ڛ����es��Y
�",ge�$�t\m�8�C�\$���� w��]�a ��x9����~`��A)�_����Q!���MǾ��3=�0���Db-�wkX2m�o�7����ޯy*zI
�߇
�p���"p��ɐW�D�) ?mБ���9���F[�����Yu6g��q
�u2�-�z�mM�œ�(/(���\J���M@P/.�7����~m������8'�Ч杉�篻��i��k�>�D��e�c=�j�4�k�k½A�`�l'�����Nݰj�V�����w���G6���C0Q؏!Q����i1�f�*���(@�S�I:�t���w�;����h�q�mir��0��s��.�a�m��{;�=�*B�����]㈴"~�Q�W���]?:����A!�{u�L�R:뚨c��{�J�    d
(���H�C��/��΀�O�ɲ�s����j��ʽ /�P?��=�'����f�>�r*?p���h�Ka��Ov���"MJt��^ZG��pO�:������;l�$� K�i5r�覒
�$�vm�#�\���@%v�����8���?ݼ��L2�kf��)�s�:��%B,�'���x�C�������.��-�;E~.�>l���OT�Pu{sm���zTd���1v�q!���x�|/`I.�k�;�-]�Ip�,��w���A�JU9�r�~ ���j�,�����1�LǑ�2���B��Ca��=u;vI�빾Y<뾸����%����`D�6�7
ˎ~1��	2EA|Z�Wb��gX�d�W��E;��М_�\^,X �
�B	�i�K����l���`�p;�}��3���{|&���(ux��������K]м�΋��"ز�����X:���.
<�h$�z�TS������S�`ʏ�@e���p�L�cR̓6.1�0a=Af��@�"�9e0�Kh�ZX�P�es/�]�]�rN=���{7��D6��҇i.�_�k��f�yR��*O7+��4�[s%}z�G��B7z���VChR���s��u{u��f)i�u
��v�����Q���)�&]��漀 #�&'�zV�:��ϟ�6�o���9�&�ۖ^�� � ��I��>�/v�MZ
�����_�0�{(!�.�vhM�*K�m/��z�'@x`.�t4'�:��a<Ap���v���^�_7�Qۙ���k�ΉWog���߈�0��O4��_�3r�L��E�-� �8k�s�Zi���/��z��?����u��:�.1��A�E0}T�1oM�Ǟ�o��)�1��j���u/��hd�������Z��bq�?%�Gt��S-a�~4U��h��Ee��[�@�3f�T���x=�F�"��$ݰ�3��2��a@'i�.O�����G�:/w��k�/u�N��׋<���u��˓�n�q��m�͒Ǖ�;&���`�C�)�	
MBl�;��J��U��U�s��y��r�����@vg�bwko���f�������^��稶���S5B���I�p�������uN!I٨�M=��}�M���No�z% �fxU��P�G3�JۻZ�m#T��Z�Cp��|����m[�ؗ���[���ʡ�K�L�]&sj(l���xͿ|�V�'7�X���į�&G�+�
7��.Y�ׇ�_�u��n0u���d�hѝ�x��^8b��ɖ��~�t�p���Af0�F+� �A��zb�,��x�~�hN���_J�O����A�%��d����F�9�Y����U�����:/��Řz�<�˙'~#�V���-���@,nD�aF�ȡ�X��l3/����Q[�,�>��	A���cwK2̿.�kS׉��)>��.v��o}�{T��,GT�g�i�频X��f��u�IhKȱ28�'�YC`-�}($Y��LM�בW�ZJ8pO����Ō(�ˠ���H�����j�|��'�=��B|c����Й��lbD �B"���Wd����ɐ�0�;$$�0T��[\���)G��`̈e�m��Gb�М�ˇ�� �%T�j�t�-�A��Ͱ�aغ��a�$��ʒ��;�$����y7�W�/�y=�/����Q�^qo�?h�b�ijN�W*�A{f�6pM:�ܒ
XV�oԞ��"�֏a��X?�h7VǏ��TO��N'��SO�=&�{Y-4Y�u+a =�3�@$|���}����2�Se�!{j��� ,�f)�e�XWL+��,&c��vKۗ�^XD�2x��ڼW�sy�l�VK��8Ā�U�'p�j�0}Y� �
���кOC]uO�c���؅#H���|�]��:�c�h�xB���E��0���^=������~,m��Ke �*�'s.����& m�=�O�/ %�	�ӂ�d��-�P}�*��D� m�;���\19����h%��%b�6bs3�@�P����kKs�a�;�$$�2m|a�2�W�7BYGK��pC�����\����|���AI�9&�k����i>��	��,��N��A��,8��a��Q\T�pأ�����H/^`�rt�z�&U�k����m!�c��,��Kw.�ސ��A�q=��
�㖲Lܰ��;�BnN�Nq�-�2n�C�����b�;<�:�V�}t�L%��Y���۹�����rSn�`W����x��W3E�!�ο��Nw�z+!�&�I�p��4�/n!q��4�hF�\Y���8�A
��	QѰ�em}}q<b�N�2%G� �����9J�!h�|�<VK�P��K��uf�]H���Җ����F���wf/L�� �-�\�V�	�_ڥx،�z(�}�h�f�꒦C��o(��j�M���s$Q�PȲ�)����ĺ��O��]�^P���]6 ��C��-0}�]F�Ҷ��_�Q#C�^8������28�F��J����1���ߜ�AQ��-1$O��u�ǢeR$�c�V�/�W�y��u�t�δ�9�%����4�u��zk������ V�H��G�~��\���*q�齸#^-?�	��W:���9p���xNOaw�;#A0!�w��4����A�4��wKu�{ /�����`��ߊ����H��['$�&P�s���#�[4�0F��|�P�Vވ���aŝ"w�#X�U�y��b����di$��E��R;���$��|��z/���GI�+�g`������.��꼋�
�~�':�8���})� ����A�0^�4FJoV�k�DO� G������V�'��p�P"��!*fA%���c��vK*�~�F��
O�����y=�P.����O���:Y[�d�a���� ]w�v$T�.7;�j}� ��|���FwH��:;���OOb�Ja�������v;��L������.���;����׽*��+<�3z�n��'�/���o�m��]2��j�W�����1,����~��2���6p!�������EK)d���U��ty�^P!�tq]љ�b�Ǟ����F��w�l�X$�ZV?�M�TM-��,ir�T�K������x�X��&�sQ�~8��,dh<)+Z�5��	�s1�9��*9�3f�� o)��r+%����#j���3����3'�4�e�A��e39�,��UO�r�i��v�,tl�#bk^�6k�8¶I�'{Ym4	�!\��4�v9��w���qa�ѥ���w�42�W{������ǿ�k]�d�ՒU���<!���x�YgC�s���L˺��0�.��e_N�!5�5���pE�
�ox"lj�����T��e�_{��q�XE�m�N����߁·qa���4��q	0mvep���!I��x�zeP�j��%���h�����ղ+$v� ��>�y��z�i�rۆ�j(�$fL�s!�L[M/e�#��O9��)�`8l�6�8p��S<b,Zc�+C�S��eu��߇�~"0�zu5x:�K�0��vo��u*h��
X[ʑǃ�	�Aj7�=���+���c�uR�c�@t=�ˡiSZ��ݾF=�$���Wh�3?��K;�Fe90nCl�	-���Y��:5��
�W��'l�?_l:�;����@�4� ��Q�y�DV�2����[گ�5�I<�92�$�g�B� ������a��
SD #�R6�����1�8���)�%b����0&q�O4����D�`�0�\V�仹LD(B9�w��@&���	C(5� ����X���0Q��xш�!�U(��UG.��dSFQ�s)kf&$R�}����Kw����zlTB�;�'�����vx���ֺUK�k���v��O4�nG>�Տ�M����ќ��):q����NI��W��:�M��^�h#>USD�qX�n�!�hi�C���I=�_a�~@�`����1������]>�"ⅇñ.���� ���!0�s�L�h�
�_k���[�R��3������*�hX�f<���aT�H�X�w(��v�ئ�&�    ѢM�YH�������V���]���{�C���'3�=4�5�HYxit����oԍ� �x�[oM�B�K�	����{!h��T~@ID�b��f��뙤y!�@)zp�S��m���0s�Z�H�Q����NR���}�ÔJ���v�+���6��,��;���\�].Cj�(�����V���6��c=����x�N6G��+�:@�}R����wa���1���t����Bab;ͨvM�7*,�t��Ĭ�d�h���t�g�J�o����O桯q)� ����%QWmV���J�uƗ,IC�����E��K�DG�C��٭���Z����R��T
��,��t�_>�C}���7#&��QSޙ��3�+�_�H�і	[LmC0y�A#�0�h���䧶�9x�z���`(nl:�F��iX`�3�{��0�4��E�c��r8�����8CF�I���ȣr�l�Rw��v��*Ig
f�3fW?i������}1M8l ���9�J�qS�N.�ds�[��_�*�
(Or7�i��v� �0�1��w�><���H���k����g�}6=f*dF�����t0P��=���OzH"�aH2�ء�C\���P͞Q�37e
;��e���^�K���XJv�̀pD�v�| �t� ˫�߯�2�yPi}�stP��t'X �t�Nֱ^�'�5A�Eg>��c4�*��!<�?�3�34|=mlnY�uߙk��je��C���m�P�9)(�5��:/��R�]�Ŗ�%-�? H���K�l�Ճ�I-��i �\.�W�����fu���d�{�D@�b7�=p�c��j$b 聉�p]P���#p妜���[N�bH�_�"V��Jo�}d�cy��M}���e��d.�K-DQb+4/׻�m1��^E J��۱�nL�ٜ~ws��� i���Rq��HK-Z��:�,VqH��eE1�]7�6R�|vS/��&���:5���0K�\����ᓄ-����jE��5[�E�g6Y*sne_����ˡ�@q;�����0�E���$J{��?{!��4����N�7�S��hz���.�����??�&hGyx�AY��H(�WdPG�����^�-]'���W���rZ����-������j��9�;~�2�T͹4sW��t�lSZ�HCh~��7�֟�(���K�U)_�F��&_A+ �����A>��྆�(�2�~CH�/NЄ�+a��� ٤y��� �~��$v����#����z�g5���\� 8R/��1�0G��c�����@@�qX�\�*Ƕ��vH���mh9�I�8�_� ��X�2��^|2)@��l&���n�k�Ϗr�P�|[�:nE2�d�͋ȩ��R�Wd&�.E|Z�����rr2�v�uN�R��	4�?O��݁��H��Ԉc���&D�1��P��Z�ǥ�?,���as�椦�!�Ϧ	��)֑{,`�-立�z��%i�B����u���"��+�����;�[�,��両F���QԤ}) ����ݟV��j���T��o"G)�6�������_�K�|O���u��'!�m*�
�S�'U~��i5%Q�i��Hܝ�*�d����I	2��v�n�]�#P��,vM��$����uQ}��r�[��^J�h���T�z��-��j/�e����!WNoP<�Q�PU��O+�AyB+�$�?A*� ��'^��G�>����r�E\�N��	&Z��Q�XC����xԓ.�&����.�4��I��OC<"}~��?�첤���n��>��T`Z\k�P�lH�2���W] e1[(�m�|�P��v�"q�@,�@��\��#� 桄��4T,��$0P1�oh�Sk���ԩ9SXs��4�Ӈi���/�����9� �ڶQx*I�o��uӂU��qo�?x���g�f��᯦���҂����&d��f�=�'l��=4lj~���nh�N��F��{����5�w��ϒ�B�"���A �T�a�����~Q�d��fd�;e�ʤMJ ��CAӸs_ms�{Oc�k��NP��MԈ"��z���������c^e��~3�t��������؁�ˋHS��tJ��_��o/�-שmlM ���L|Z@&�]�����8����#�|����|��@0[a��X~ř� � .y�x�ݦ�&�E�bB��k}EFou��!��b@Q��\~;����aF���M�(bk���(*�����B�`�PCpm��Qiƴ�ô^H�_=�v���z'�:�5N"�>���V�'���+��r������=�:� G��< o�-o���5��a /�V��m�Y � �*怿.���ǿ�a'0��u92+�(�� 7&8M���ӹ������E�%g=+��܎��E����9?�$�j_!Ӯ1����'"-*�t(Ss�����e?܂�4ڕ�5�t�0-��Uк�k����)��ߕ��.>z|���ݫ©w+X�T��� � |(�]���.�R��d!�����E�GYi�-�k>�֚[������H�	��i�~v�n��ǿ�G��bȧ�M���4`O���i�P\e�BB�!��s�='�����%�v3�£�� ��p��"T��H�G��/�h~ə6��[4�sQ����e����֮M�>�:i�݉P�}�5j�`܊]�������v�1�:�)]��«��AX'�Hl��^\�г}J��ةdv�LV������}�<4�yh�"Jޅ��t��Zx�����v�=g��z���C��$Iۛ:N�e�'�(B@Zo�l95*	�ú��HDCYZ�����(.H����N(z
�߃e�6Ǆ'��&��}E�����8$$��$�z5^�2����"1��ro_�.<g��Y#;dd��p��aG��8���z� ��3���'�+��~�a8m�\[}��:��5[�;���y����6���6��!K:GA�.W�<�v(RW�� �ѣ1�<%1v��b(3LEr������ReK?Ss�P���R�;[ChՖ�����T�#��;`��K�W��������#��F�<ZF (�/�	��1L���X���=c$����:��^F����1���4���q>�����X=��pR��\1~�։ዝ���Gr}��y�0�V��w��u5�,��b��u�{iH��	b�6.#�3��8q�YM�Ǘ!ϫ�q<��ʧ����J��Μ�0�����k��l%���Sc�P	F|����þ�O��]^�����d8ԣ�k!&N�Gs��o����r@P����/��?f�NCh��+!+��Sh0A�=���9�/@|H�6�Q^��I|�p*O��AZ��&>���QY�����W˻���t�`g�1�IZˡ�K$���s����u�z!۩{��=~3}�� @���]�jC�P�L�E�]��5�%𰷽���8�(��' ���9wqAkH�rD�*�0�.��ш�t19�G(#�=F`(#�=��{!|�tBg��Rt9<�����0�~�����Z�Y{s`��D�NG�����A�G⃒�p���9�~���v�n*o+��эc�JioF�-`~�ν��o�@�z01�ar��6�/��C�����W����m��d�L懏��k��|3[79�B��~Ȭ�_-��6�-���q@{y�yN6�~�{��N��򁵙 v��TA%Jަ)VM4mS���u x���4(0 �=a�|�/���y��i_��j����k�šZ~d��]#g���׶S�M@�ާ��f���2�@أ
4�6؃&��.I��l=A����e3W��k�����1��<�[CrT��\��#���U�'}��w	�_횶��(�vT)�Z��W{ϕO1A.�1P��E����"��z=]�gȒ�Ɩ$0%`�8��+���{1��C��פ�+8�	)F�ء��j���Yð��ŞO�5�c��I�TnK������zD��s��k��I�$�S���	����I    �~���(�Z�P��qڧ�zώ��*�eA5ɜA
�٭\Jm����-w��^~"D��(�`���9e	D̾i�
��v���n�KaB�`<����F�
p��v��"u����esO�ܨ��Ϛ{3�[�>n�uf[%nPDs�J���Yݒe�&EX?�������y�3Bv��l���w�;�<����q���0T�M���@\P݋��	�_>��n5#]#s�?���.E��.�@zd�S�E�g�"!N���u���B���`wDG��E���Q���$��^�4|�.R�C�
J':��2=)*����'\��l�E���?�#j�CX�YCJy�Pt!��1X�xR�����z����E�wg�:���0�{�w�%x;�`n�W�%N@���y~8���0��O#5��i��++ho7Ο�|��Q���hjryd�*S���nbځ:z2/P`(��{i���"?	O�ݵ���U����<?$�`C�/PJ)^�&?��>��(��+��C��x@߈���$���Z�����'x��N���?9��BɅ�qP�A1�>�b�5¨���0���>���[#�#*N��h�<��@XBv���
��m���kSXN�G�Y��]��d$/J�Aae��B��go�ȗ\�a×m7���t�T�M����?��rF�0i��m�Q�U�B��NG"�[���/�vH���FXt�о\�}�O���/t�.�:�M��q��T���S&d�T�7����~|(cF��ch"��bA�-�>z��yM=3竃�R�>��:W!��K�o�����������=in�zV�>E��t����PN�q����9��N��?���tU{���=�\��6��g͓y��g__~9]��֖�ꆭ$S1&�F:�u;P����ߎp'<7�i��i�\�ˬ��������t_��+���� !&�Bo�����]��p�a����DP|2��oFl��6���/p[�9 �%g�l���{i�E���$jH��1d{�:�mHiXU@d�����zF�{	/>n.�u3��a4���뗠�	@}Ɯ`v�<T��bM�/՟F�By���i�(�=d�Pz9��:i�f�^�Hp����q,:��S����I��j�9��L���ֺ�m����o�����0�"�l+���+�Aa��C|qd�I�P���f�j� F��8�/�"z�YJ|q���^�76Ӆ��M���7� s*�W�����/��X�,Sj�N�۪�V+U��c	��BzwSm#��q��w�����->�(�,g	@�-�pǏ��6�g *��V5���j��L�j�����M��O�
�0����e�4xy'��"�k?��%l�������	�[E-�+����Z��Z������P�6��Ў�1�wׇ�\CT�땱R�$��D��%�lf?�V�Yf���FT��w�2D�j�/�W���'�ml�������r�L��i�>0���)�֕8H���z}q�M���O��~�rm���&'HѤ����L��aX��C |b���x�� ��e�һ����ӺZo�F����H9��%_˨[p��(�`A�� ��sJul��(% L���?�N���
H������.;���+���)��K ��u�`7�6n�	Q�K�/�vr�F;'�(E6��v�_�]*��~���5:I@��\!� .WK]	 ��ol���E��D��j���"*��E�c�7�J�3;���QN�%�un�0}'7�f��7�s�R3E��\���u�_�;�R�[��K1���I��(F���6oSF��3�?�1o��E��F�16$��R�@MA���dy�E��lN�?N	7yB����P�v9��u}(�m��81b����F���u|X�7\�<Sx���.��?�]dχ��S��t}��lƊ�@|��蓬�;)_�nn���P� ���g�l��h�!�`�g�gjo�%_WKs&��#5�o3��{�����۔{�]�(+�	�E|�+�#� �-�RjF���/uw�c��;��O)��^-��������Pҡ�"���6�L��K�+o�:�W�ˎ��/�$��4���%8:���kӓ���]�i�I��KYD%�
�xa���r���ei�,#���Yl�
��l�h��|��d�Z!�^ŧ�l�ow���$�D��46����laB�/�
�����	��E$Ň��d���N$�'=�_��+�eٯ�Z�A�2�LL��N�S�u�4=���P�j<�^_��Q;��T�"���a�CY�g�b���< �,�M�[A���njڙ:1<x˥m�I�a���;��
ǧ��R�Q�3����(����}ص�G��XW<� ѧ8B��	h�{IU�p"�u&�X�T����i]j ����\r�Ʋ��Ӓ֦�O�U?�ώ����1���_����Y�q�s��V(Tl
¡�z��'�1����ڲ���Mg����� v��Ud5��7����E�W?I�+��n<�����~�:]��{�C��n߸'q7�M�w�q>;3z�`�5���N��WQ<�YG�՞lN��P�Mj�S� �T#r����;6��5i����r8�s�6�d��xC�n��f���n*+j7��7���-GcL���,��/��ᦸx���v��>��NBw�������R�(� �a�(�FG(2�~�p�NEt�������ú9zR6�?Hz�=|1]Y�U�x���rܝl�?�jۑ�+O#�@"]�c�&@�c�T�K_�T�^��~�@7P��������X�S�b>uP8��ߣ#��[��i�z����@�[��V/�����TI��aؗb�WT��l���yu�D�?�޽�<$�j�'����\���.q�Vx{m���O�]T���o;�,��X�hZ���;���B�[aZ�'/�{xU]��̉��9Z	+&o�psgj�y�����J����b'�mP��4"}�h-�H�b�l�$|YrW�G;^�j��z�H��ZM��a���湺��V��]���E;j���*�k���-�,�?��X���G����?7�\>/�3�G��W������ũ���6�����ο���\���xq����8~���hW�v,�%��	����|�<T3��Le6bvZ�!MŸw�����n��6��E�Zb��e]���~�� d�t�t썀���n��Ze(��V�x��J��c#�V�kS��UK2��W���r�3d�lye�zt�衍�m����vG�N�%hw�y֥��
�
�da
����D�R���Qqi�+�)I�&	�j��?]���-?���|�W̜��D]�Qٺ.}�T�ک|)'����y%7���j��,\�u-���g� m�5��]Ig���+#Kg�0���{Yp��X���K/kbh�}P������w�+8>$�|�4�@m�P���ya��k(�~~���1G\�x�j̗{�mu�P�������eЬ�|�T�v�&���n�py+I���w|�:�m���!a��
�י�/��菭
l��m���P����${u9�{��zRL �8�&��]ka��f���on�c�Q#.��),x�]�B�y��x ��E�7��yM��i{$���gD�D]��t`3��^�i����
�wZ�"r�s���sd|���+�_�n<��E��/V���3��S5'-m��G
�����(Z�'������@��A�2�g�B�/'���t��{��j	7f�ԋY=Hi:İQx)���������ʴ��Ц�j�*P\/�N\�{�:�u���U�&��BNh�Ss�+|9�K�4�ɢ<�Sd�#���t���G8�����Qs\�:�"�jU��4a�Q;��/������B{�\Z
.(TT<G8,=��R��$�l�]Y
xi}���C)�z{��:еe`�sĽ3q���T���=5�goT���({��:3A	�<m�Ve,�Nwk�r�R�"L;V�>�VTnhȹl܆����v�;3��`��l�S,������W�    ���u�N�@�h�s�@�i�����K�~�\��w�f�)!س�$>��x:�����&9v�3:x誀;3�.�bd���������E�J}�i�@X��1������/�p��#%KUd�Mα�۩�¶w&
��]Bb���F$E�X
�ߞ�'�4$�U6�n�.��$rK
��螊r����z���Y B��u��֌�A�:՜g�eԍh.g��r9��\F�<����
���~��Wc���6w�K����^N�0v������w�/���p9V�k���-��2�[��v�?�����m=�X8�k�sM�L���/^�5/D�� �Ep��d�-�A^��ʨ#���kb���Q�B-�H儱��a��-��[�)��B�M�Տ/����e���!8*����t�V��¥6p_��ʁ2�i8zA?�����ص���J
�ݬNF3�+���Z��:��;ס�	�B�F�/fj[l=T���ۋ��q5L���3����8�D���{��N�]�?������l��m�rQ���0 �������ᦔs:ԇ`�+�M>�h�4�S�#� ���%F�5��Bp�{=,E#�J�&wa=�x�z9^ށ�8G>���Q��1+�}���,����rFv%ݝ.Fׇ��Y!C.�lB[x�)[S^ht��;t�f ���m���-��ӏI\����Q�j��A;2�p]p�ӡ힙���r_ä��|X�"��Jg;�j��GWEHƮ�V�)!;�k,�Ε�X �l�Y�{��C�Թw�d����C��);Qu��F��S����R;,ONy�H݆�P���wW�v̓�����
�N>|7}��Z�{q���d�|��A���4^x�7����Kg�E����U��հƔ��bV_;�V=���w{*�u�'w+/�^���a8Me�I�i�#���\���h�o���u��$dg�8��(�{�+�\6���A }� �:/i� ��XSJ�8�埜%�W ������IR�}��1��)�vxV�r�DT4LwQ�F��M��!ʰ��=��.ҳ�F�ƿ֠]������kj��D���>{T�J^�m��v�M��P$��JV��j���B�L.�_�4�wH�a6lR׏�_v�bߋ��w��2��^���a�d�u�`(����A���B3m��t��DNϾE��c?��A`��~�U'["S���T/�ǿ��_?K}����ȭ�$zOh*���i�o����n.E�F��F�je�j�9�\��(s� �V��/�uAgn�2��#���5�L?(�T�1`D��O.ӕ����|u�ٹ��^��I>���s �G��^�x ɳ�����c4԰t��lt�,�P����D�����G�Wȃ'�$�E��Y��������������n��#�O��7��0k��_�lq�?��+��~�@��^e�q�ض��!�Eer�a��PN7(D����ht�� L�^ ��try� ��U��6�V���mvk���I��FՁ`i=ǆ��:h\Ƹ�*��z�����b��5{��,eY6��}a����VO,�>�Ww�V��3a������f�m'V��H���/�1��>.�W�hZ�P�W���vOx~�&`@e��:f��ۋe����|*xm�����M�����R�M���ļd�"�	������,�:'"�DƵ�(�dˏo� �^��La�Y;m�5,ߺA�b�1�O��)�Z����Er�m~��g���}ӎ˓���m�f�@.k�G}�]eqB���H��Y��y��Hm~�T�޳ `���@��nt[_�\K-ye2��ߊ��@�peCȃ�������:Ȗ��Bf��~7�k��S]���h��
:�ey�<��a��V&�s������,lv�$Ȁ2
.cY_�eN�@�pv����
��o*��C�&lIZ�cSGn�X�w[XRZ?�����6��e��|��#G:w�/`�����6�2�LO � ��/Ǒ��@e�%#��F������@Y�vM�`�Μ9�� ��,A�s��q��\t��>^V]^���8���x�y1�so�H��BЌ���a�"���U�!n�I�w�F)���qh:Y��+!���� ����pt�H����z��Ui�� �z����c3�~��C��NDt�?����R$g�Q���_�3I��ˢ��}9lO�ة�(���F�87|ñ(�Z-�<����g�br��њ)r�퉉S�l�K8*
�.�U��^�Ϸ}�Z�B㛣r0��pJizk�͞�i7y*�X~*�����X�$J��h���O�t�N��l�q�?�A��%SIWXD�d��\�9 G�׎ �m«3*h��+~y��8�ϛ�8IRr�N�4x ���9������v�?ņ�e��G`<���SS��Ϋ�(� g��-V�3H����bٟ����������m	L�=\ӸFq0����xJ���Y||:�)���Xu9^�nN�����|W2!-���2!�N7������l�4Ȣ~d?�24peo��~E2��HҘ�c[��GO�����d���l�#��q�e�K�z���r�F�u�X��mh�m��.*�Yx�;D��`��Egs���j6q�B�	L��a�v]�٬��塆/��$�B�=�T7�1c��`����q�����S��s=v������ս�e%�>�����	R��&�Ġ�;;v�t�ގ��y�����\M�fH	�;({�E��?=��b���ۅ�E��M���!Y5��(��Оg�CVF5xD�V�����G�����CM�ЩS��]ߒ��eH��Ǖ����n��Pw8u��0��9�����clK��^saxGvؒt��BH�m:0�2��<ųu"7/z (���L�����8z+���q�ɳuc�g�f 8̞`צ�_��Fٸ|��)E1���$
D aJ���^��Y�'�pt�(�L~OMTKJ��ۂ�J���9��뮞�ݙ\�ݙ�H'��c�>аm)1�W�nBM��8�F�s�y^�].;�4ߞ�^����t�tV���HubМ��E������
�K4��\vtYv�sv���7��"�K���p�ऐ��wC��U�P��}^��D�P�l7����)���Ȫ+䍙g�<���������VKL�	��e�Jl(nj�Ѝ�A(y2N�L�I�7�*/���`���O�ED\ ���#�o�J��S�`�`��\\s�h������*m���e����1öq�ԕ~�ڼ"�/���u�FI�v�}�f"{�+�C��A�j��uEAO���6n�q�T��ڲ�j�L�u[���G�!B'tMA�cYك�;���r���|XӓT��RM�@g� ]��#K������~pAֻ �IGBZ���P���l_��G�ܶ��������\N�V]�7o5�D|�YK�r����h��8���8��������D�
�
�	�n��i<��li�}^��9jU���	�3ٌ��);�١�?��O�_��>��3����Vp�P	A'9"P8x�a�悉��~a�L*�x^��#Av�Z���mol�w�pYw�D)����#3Us[���R^ڹ:�\����La��/٢��W`/7 ]_=����dU8��u/�����fK�7�3�	��"3���AG�-��A���r(��c=J�K�� �_���fۆ�d]�S�����J[V� 旅��^�MCZL.�ѩ$��<s�V� N�8Xoq.�@�y�m���(�A�Z'nj��-�I3�ʶ� ����s�5ՂضK��7;�?���_��p�xe�NP'3��'�����Bǫ��B�IP��'��g�Q�:��w_Cn �4���riz�v��Hн_��a�+����F��ªR��U���]8o��l���F��c�}���e��YHRR%�4���,n����)o费^��y����)*�%� 0�o8����H4�6Q > ^�bLb+�n������##C1��S�=�z�F.�p    
�a��/�z�J�z��q�ۂ��@`��Zʑ{/.�9V��D���>zX����d��ؘԚCC�x��1������P1���	����1I�;�lV|A�A��zj�����^�&� �9־��+�c?U}R ���(�B�V�^ٜ֘A�J'�l�Ctơ�H�[1�6�<�����;�P�(�L�i��]W�N�uѺ��IM��*Ujb�ƽ=sQ3�2�ci�?ޮ�@N-6�\b�_:��;A돗�5;�:e�:Pb��q�����x������\רc��ö�ȫ|)�;��������[.�k��M������'Ls̖������|�<W;>�s��Ip{;����gug�շ��r[��&%��>��Y?�d,J��v!B���<�xz��E����������G�e���p`���nE,
�Ge��w���H=$d��F\�XԮ�XT]{�˻��C Hx�,�:۫}`�8�!˲[���C�
����l�Ӵ۱�p!�F��;,Aؗm7�����}��`s����g?{����e�JF���}�j "�ES�ǎAQ�?�5�"S��w;�s=,���ߚ��ǩd{nt�ax�gx�{�Uc<�OƗ�em�ΰݴ�pv�ju� �h?&E�r��E'��&��d�Liۘ�r|�����
�yEbHA	%A�A5a"oє�m�����$)l��W�]&��&m;}H�l�	`}��!��^�0`���Ja����k�w0�B�f��v�V{<u�	*��Z������J[�yiZ�`c�*'�=����P�q��p��DڨCOQ9C�Cq>�wo�5K7S��(E$�z���o��X�� 7�nu.s���]��%G�z�?40䫮=ꠌ����	w�j	��ピ2ŷ��WR	!Í2@!L��+7�Ȝ�r'��/HSD,y2�]5��tCJ	dG�5"|ߐ�_7Xv)z��a�� =� �!{QR�$�+�311�95�8�=0x9� Sx���j�ְ�l��[�1J�kP�Y�uۛ���P���9JR�n����	qͨ:��<�DӐ����
�.* m�YMF���p������U��t���bw��8����FbCϭ�T�8��40�n��H]�t�Z\��F����|8������om�r�����9]�Xu��Q�L9�7��g�F�qM�b��"��	��M�d/3N�����&�w��\c_?�m���	8�hi��p7OR[I�7�j"'�|�!I�b��U0�����F�q[S����p�;tlq�rz����ru(�2���ڟ��h��c)��q´U����P�L�1A�ؤ���Q��#�PV���z&���|$�Y��߼�T��Fǎm;�鈂��Tz�@4&Tn�xo+2���C=:���+��y�I���r1d��'W,���u��� �Ab�R�9����)�sw��A�D�#�3,����Gm�*JV���s�.8�Ҕ�����_YP�nu ����J1h�����э@"b�lkf���RZ�S�ǐ�깖��b�s������"Җ@/"B���jD���+~/V�q��z�׍P�u�Ç򺭋q��0�ƍ酰�)Kv����h�g�w�� O�M �S��u>�=Fa��gr������	';��J��ԧ����5n$�# ��8 >h��<bÉOUX����78�3m�@�
(>�M��\w��q�V�l��<��!���u �=(���u@��>�1w]QSC"��k0������\��j5�V�!D�%�Up�6i�����U��	���rsٯ5�[�(3���P
�؜�ӎ�_#\s�٪��"��j�&a���?��'`��Ff<�6�3����4ڎ�tW�w�_����&{L�zw8�ɕ���=f�i��c�j�!����ɢP�"�e�QK����[�-�$�sI;�pɀv(jHi���3zk�����q#�5���/�y��z�ǚ�%���
�pI�ۺ�(������hy׹��F2m�T�e-��n�x �ԚV
N��Rp����5q
Ο�mt�0
�ajoP`PN����lY�Xk����Q�	H��2��J��,����p���DI��H��Iu��P�{�>���ZX#�D %��x3g�z���x�娸��� b!:��,�]n��
�%��F���M"4�H²������ʋ�d쥹YD-h���,��M�ٻ��;u��YGz�_`�b�$(>�C��Vܪ�A�
X�Y��jˣ��;�S���|J�s�" ��1�9"�қ߆ai.�n�M�4Z��;_q�J��F�>��}1��]_(���^��bgu�gX���H}s�ԉ��=7��j3���&�R�zz��A��|qh��4��xs���h<C
�$e�BD5E1\\���;��H��I�I�iX���zGH�UB���&C����{,ךV;#z��O��LC��*�U޼L�~0L�M̟o��h�|R�)(!��꽛<P��f��-5��@翹s�f�BnG\�C������q��NP~��%�-Di.�H�?@�o/o���opD3>"wI<Ω|�B�:��]�05�!��<�\��ef]�8��=���MLH؆�=�����4?����oNWkG���vSԧ�U�	F�č��E��/��SM�#�6��������-�׻�Çe�������!�i	���5�!�ٮ�'�eܓ�P툚�7"S����nL�M%z�3�� �y,`���#��[m���9r~�6B�9ʹ:�)������օ1��;	���r �`�K��T�V�IJ=�;jIm��EvU��\�Ag�U��C!EM��U���2q�s}m���ϑ1�8+E J�;���_+"���:�E��M$y%�W�ztG�&6�uad�}@�`j�`C����v�6�ٯ�9'�+�����+/k�߷�����f�.`D���!|��VN���_n�.�+2�v���� ȇN®���{%	��-G��y��'��n��>bx;P$k����~�n.�x�󾑲�N��<�]|�/nkhe�Z�r(1\Zǒ�c{[C� �Z�W��Ѩ9�
6#���c8�q���0��g�%7��~{��H��᥄e�Ƿ�:�.�D�E�� �	H;LH�z�� �~*�]Ct0�r����zȀH�Lu���콥��T_�, ���)M���yTq�
⇠��i����k1�� �0��$��	�j篑s�_�Ы�w>��i��"p�)"���R�!S.*���_ga{�T�A�C���f���'�g���Y�ζ����g{Xn��W�(��\P�d>)�>�i�v�*�O��(��Tq0=��϶' w��\�{����1��|�v=s�d	�I�H�f�!x��GKI*��5-�_�F�O�Ꮕ�3/	�uV�@͝A��ie֨��B���� ���<��`i݂����[�A@�`M	k� *�����7�f<!r>%َ���ʛ�m�e6^�,z9��L���V�nC�}�[�O3��a�t�iˁ���i����;?��(�r_�\&#˚ʞf�z{��J�u��\�m� L"�!_.�Iiw$UFč�������n��v��x���=��yڦ�wsp]���k�v�gqO)�M�Wm[_{q9�)�M���'o9?�݌<��]X�Oק��j�OR������*TI��&~�m�ǲ�G�'�A�Ɏ���r�c1K>,�����3�ٍ�F;;�P��^<=�w�g�Eu�v�'1�L�]�}`��e��>8�~������@l��P�0����f�-�u����ѿ�r;{�m��*���DZG����C��&�l;�Y�M|e?�:>k�u�`�e�6�QZ?��]_�l��H�����La���4�,n��8������A^#y��6�����[�Nm��S=j��L�MdBn���UJ�<"g��Nm���'źq�j�"ڍ0O�����^���|w�9
'k����[ƎF�9�]Z���Pv-״�l� ��}3�    ��|18�nW�mB�iP:iƲ��kd,܈�}u:/��B�N	$�|vu�;�܆�'��tuβ��:�B?p��\��AD��ǐ�X_!H����3;�>�����2tM�z_�0tB$�����a��Fk60a�@�W'/��+g�&�rt���v�4�Sy%Z�K�P��4uK6S����f(��D��|m�C�j 8-	$wp�qp�C��C���E�A�O���sl�����kX��e��T���ۨ�U֞-��Æ��g����x)և���P�Ec�FK4�oV��3d�6S<�jb�:�Z�� �"n}E�o�f����x���S:�	������~}�<�:nmr�w�Ñ���Mǰ�>�~y�W�=IT�{�,5$�ݔQ�>ȑU"�o��߭��+ ��,E
�rј�xJ�'A�V5�{	�~�6�6џ�r�U��pS��^�V��˞B�A�Ķ�<aik����B�f�F޲�"�����m;�]�1����: ޣ�������G�hk5��K������̸R�ל�*#V�B���xw_ݰL^6u�R,��Y<�SV�ܽ�"z�q�wo�i������d!1Ds�7U�BP�
[Y��r�&��zg��)��XފaO����s(J�����[;�%~Xkpd�Ph���m!�n,��;�i$� ������L��{{id�"��#��Ξ��(��Bn��I����{���#��e�� ���\��@*�sj@��� ��{������t�I�{�'J�9�)L�����!Kr��oZ�4��;����#R|�͙Ch+@��9��<�d���h,��ɗz�%���
�#<��onk�7���O��;)�@��E�ـ�k���;�;"^v˳?]�g_V'2����[<�g8�#2VnLi�p�?�_}l2HvOpc�Kl5��+��S����C�|#pUP�)>��\G�� ]�c���[��ﯝʒ"-��.C�Ҫ�r����Ov!���ޓ9�^��H�O罍�x��m-[�����a��m����������5����X�Q���ν�fs�Sz����g�y� T,��]��E8��'����rח���h��9HY'�$�p$��v���mH߫�c_�Zҳ��W���j$�j�W롗7|}�u 'J��;?X�БYW9Co?��ޖ�.�K1D'�=@Z؏���?�*vڶ�2�����J��	��~Π\\m_���yuv�����ʕ��ڥ��O�\t_Z,}]0�%ڍgU�4���zL�Ԃ+q	�:X-�^�ę��hN�r�a9F��ON���5߄vt��s�9�v��)���U�����/Ěi�Ҧi�)o6���O�M\��dC
gp�Y����.���VĀ8d5�Y4�� �<�R����IR,8}rP �'�w '.@[��Ya���qY�恨tTj٦h���m���~�^vo��� :�B���� �b�v��.���:\�<O��i }2�/��#Q9W��w]��ܫ�p�(�R�4��z�*��@�Aݧ��Z�s��&> ;���! ���V����rυy��-�%&���%ڦW��2*z�c��y�;�%6?����m4q=��z����+����P/v[x,�N��iVew8Ɵ���j�+��W�u� Pg��'���0��G 3ת���~c��X?B$�v��8���$�8���3p;fD?��	ZQ�r2G:P�v@�s1U����6M�>-����mFJ����2n"i����Dl�X������$��!p"�9�-��[Ö�mcN�K�� ��������r_�x>!cxlv+Ҽ'��c��������_�Im勑�nuX&����:�=Z@k�L�. ����O�vt<&�����/(��/�"�N���J�=�����j[��o�k~�l���Ȅ�4(����!@5��MZ�����>X�D@�0�F�8�����;�5��vJ?s��~Ӷ}�$��%� ��Չ�o.kUHb��RD�Re����x�8�G�%&ծ��}�Y�:t/	j6D���ӑ7��z���=!S����.�×dJs�q|%�O�-Y��F����*]O�"e�\/����s⿨��~��mz?�Ȥ��y�v��imȡ"�_u�z��Mn��l���>F���������{R4�!=!@��>���Q���~�|0kh$��
0D+�i���x���&��PP�N5���!����TB�����{w1��Bs��pV���r���`��ٮϏ���E}���O}�
��t���FjE��Ŋ׊�HOЎh"N�B�����̊�~�(_�=Gg���M�֌�E>;��|*�]5^� =��uv���������y��pܸ
��<阳b4Q�5�$��6�~Z.�;�>	�>�l�ə��`�5�3�-Q����kR��� *Ka(����e\��@�*�����#"J�mL]�Q�&w������g�>j�7�0�A�M;^�Pw��^����Q�ɘ#�HgJ�\�K��?7���[ݓ�[y����pe�~��U�ޯ�<�}��� �yS�Q��|X���&���u�`؍!���w�l�G_�c�(O�����N��a�ά�z�}&]c���������ͩ�������2��F`��-�L>�d&0��2M,(�`x��7�i�P\�?	�̀��&����4e6�8��r������͔�H����K8�"/k�����E�ҟ!ˁ�,��B�)��h'�����?���wD%g�5�-p�.�.l�զ����\��B �:"�6ĕߢ��8+�\0s�~�ߜ�cg���$/��N��Q�tt�5w?7�b�5k36e?t�^@i���1��F+�䓂���$YF��?�N�^��M*�J���3%a�Q���2t�ȟeh� ,��	ܠC�U����{�n�,�m=L��d��æ~n'_K�\��w��=_.��ف�[�Hl��#4���Hb���!�������)������}6���)��Q�],�m"����q��^�j��|�A��r��I��Ot@�1�ni�~�����6��k��?�"]��5�L����,�����Ƕ���ѿ��(K��5��n[�N���}�A'���c�xwح���!��8�~�ا1�G��q�.u�aF�%>��3��Iw�&�����ʒ�#m�#"���W ����Բ®���Qsj��� d�����+����*��!kЊ^�'x!(�бS��"�շ|��N-b�+�M.�=M\�K�Zn�f`_^��ˇe���� *�#]�yuoid挰����v��bX���j{�z-B�)�i�a�Y����-�Q�=���2�&�L��=�Xk�����r}^��:\_+�b���C��ys[NnZ�f(�WK[��nS���`cj�E�omk���r}�� �p�����h�� �Cs]��+�
�-��N�F��C�ݽD���2eY;�v��cy3-L$���,Ξ�#4j�e�ļ�����|'^�����nPE��F�,SDA�O��+���.��:Y��Y����#�V�;���ǿՇ$�H��S����N�qH�V�u������~������s�{�q���#��f���fl4nvۜ�RGs�<C�V,�Y��*��Cag���i��*�}}~�}5��l^�L��Ij+�ﶒ~��_���@�*LLu'#ź��e�?l����5Ɔ��WJ��M����i�����q1�~�t�6@w9f�j3���o�Vf?��Zs(b1΢D�E!��h:ّ�_5;y��
U^x�� �o��֜�~կp]���4e6J��S�Vz��vŏ(˚;�6BM햺�� !ܳ�dFV*���0�D��eq8�o�}�m_-Y�gv����*�O؂���R���jI|℄�nZ;�Iy-?���	�I�����~C�}�����X[���f/����,���<��)Bf�~(����R��]9<�����n%[��C�t|H�U
��u{�upZ�eWP��|ey �5�D��H��q�A�����4�ҕ��v�' V  $
-Q@�mFv��f�_GӽAL�C�XNT�p��)>p������c�GR����zύ�H�|L�Fׇ��.v������G��#�1��g�x�U����	s~�(ђ���"����W�#�\fx�<@�����|x���^���v�
��2{���W'���pTQ*9�x�RvĵW�(���g�=��u8:��)x���!��).����V"º�K��8��^�Z��J<.��F���\�N �4�+�`JR��ʾZ�K��[V l�9Q���7�����!�y:��TA�p�8CB�\�N����O"����v#���-�gB/�����M����h�D�:v�iX��Y(��J�rmwG�{O����D�1�q�t�- d����� ���У�l�֫��˺s,<tZՁv��k�k�I~�1El5e��$e���QV�����B+y*���\��U^��̓R�]��`f�Ip�3@�H�8�n�?����6g� H)�T�c%s2ء�{X��Se��ڥ�.��,n��h�i���xCX��%G�z�èq�a�v��{���6��샽3_�	�ˆja�h�a[Y���l��C���_=��۟��~%���=�\vtQ&N���'�$�����5���*ufǦ�2W7��)�0n��_�B*� |o&C��~y����LBG�hL�� 04rl��4�h�0\����6'�$����ߣؖ�Ǧ|>񯾥��خ�їc����mڦ+VC9��'�|��y��o���E�?��N��ی��I�<ŁP�`F,ñ�p��W5ϭ��N	,��3]����N����29ag/X�0ϵԟ�.�5�P`��g:q��s�Z��H�.G��I��1��˴���EvR�M?N��@��r!�-7��箊e��:$I����� ��iآ���6�a�治�R���9 M�F5��t�8-��r�E���!˸�q�S��%����*fۅ$jO��/7�uc�0�I���*��ৈ��q�ay{���F�b��M�&�z2�C�����|��["q�9��zUɷ��� Ϯ|�s��h��b�e����@��\�1���z@l���r'�����@@VS�I���ޟ�F�����i�,�������:X,~���� )G�3�ej��Úy6��ܨ��ɮp�A���G��<p�����8zU���Bke*>B+}���_�V�%X�.�O(J��R�1�c�J��n�I���%���� :u�	��k	ST�&�s]��E� 1�1к�<�ގJ�OM��дv��	/�"^�+���Cc׵����]���lS]�7AJ�4ِFa56@��Q�?`N�!��ևЮ
͌�ڱ��������WoO�ӭ��XR�K���2��r�(���[�mʯX�T������� ����Mc�ZB��|���R}:�8
�Č�g5�� h���{J�wд�0B����,�#��I|����y\ޓ?��Fw2fy�jJ/9�$�`ʦ_vq7��&{x��[����=�P#넠�tG���2:�ߗ���nXQ�jջ�w�IA���S��q��[$�<����Q��;NS�7A`�?[��?��+�#\���LR	u8^����sH�S�딚k���HM]��#���dn��0_��ק:5j���Λ�eo�3}������b�/h�PCT��u�f�H}@�z�&��[9�{��H5���Z�L헝G�|U����)3;��đ6�$q���@S[ߚ�i�qyF�VDJR��HVա��<�P6�C�p?��U�����d��g}��n��\���6T�~��+�n�ϮZV+K�f*�c�tor���;�s�˘Mp������#�F
�96N#�6�\��}�_V���eWg�|X�c�"�L,�y�-�m������^w d�0A������U����\��s����Jdo�
��Fm�����s�)?m�5TR�����Jɞw+��K�����Uy �0�1�t��K�ˠh���N�b0\����s;�'����)v.��� ��7P1�}ߕ���Y�vo�Q?��[ e��V��M��i��C%���s����\B?�k)�@�nWC]]t������ALk����L��ӶҮ�5��ρOls�Ǚ�&���;�,*�
�]��蜳eaT�uZfYT
��!�X#\�&IY\�5Z�v������t�tC='%{O�!ئ���vc���686���g��.�i�D˒��r������_�3���k�
���´�~u-��p�K�܎�,4���Wf�����o�?:�ߒbY���n��ԯ�)R����K����h�����f�]/������ru��H	�����v�,�̡�eWց�3�йMuV;��Ŗ5@-�!�8T�FP^�:9}񊜞��<��:֏-��~B5
�\�|4O��QD^����@�L$7M�;]���d����g�FFX_������R����������j4��A�c]���,]2�]��Y�,)Y�K^Q�p�$�S�����i]hEs�5]�3�x����C��Gۢ<�qV�|����q��Ag�^�ݶ�����G2������ �@���2z`B�2s�3�����'����nO��L�B:إ��yq�����7�
Έ=�����F�k'��zy����C�l��W6B��-ү��,1�"֍�^⚚c�$j��*XD��� �1��� � �r9^�6�%7"׍0�BP�h�?An:��)i^h�7E��`p!Ҧ�@dM��������!v���zM����\I�I8P�][�i���V���.ga�^<*���>��/���_~�����6      �   8   x�3�4426�45�4���2qM9M�\c׌��5+6�4��M�|��=... '�=      �   O   x���t�,NN,HL�,IL�/�4�34�2�t-.)M�L�+Iqrz�&e�@�qp��'����+rp��qqq ��9      �   x   x�3�tI-�HL���,IL��t��qu���2�t�,.���L�IE6���WH�&c�锘�������e��\�Y��r��f�d-p	�s��)$��TXp���%"���qqq A�._      �      x������ � �      �      x������ � �      �      x������ � �      �   E   x�3�4000��"0�O.JM,I�/-N-*�/IL�I�4�2�PhS�����
Wh����0+?	a`� ��$      �   =   x�Uʱ�0��Z?L��#�,���T�8�#'i
�7�.6�w*;�`\�P�:��<X�<�>W7      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   !  x�U��n�@�g�)��*!�c�T��.&9���s{w��0v��#�ŚD]������g���jUH��;R�Q�bUXo.r������2�#9�0ף�������/��J�ԑ��8I%]s�5��T1�SX��8.�?���u6L�Y".�W�p���Eoԡ���d��r8�a#��<�l,5<�o�*D�3�ڛf�f9��5.�X)�l�����m��P�w_�0�oH���J��@����i:����*\�o>ښ�Q/��0u����V�����-w�      �   0   x�3�423041�4�4���4��26�20 	Z ��b���� ���      �   h  x�͒Ko�@����`�J�3�C�.c�qf�1ꆗ� cHb�ǯ��U��U��^��ݫ{~�Ǎ�pV;WX�Wp�{�W6c���~�a��q8{a���O`=�������rJ���C.ǃx�XA���N��q󦩲 �7�|/��LT���ʅ/߹��gfIY��[M�{^d���v�!z#��	vk`�΃]`e]i �UL�j2� �5�*D��Dz�D���`8`W���|�}K�<�:f�'�1��C/��:$+�JiuM����R�n3����[�
��ʚ� ]͕�^{���f~M��i�P������Ǵkp�	Q`��������Ʀ1D��v�o;A櫽��Z�j�'���<z����ײ:c�M\ibX�V�P��S��"�b���!�؆�M(��'���.lm�(��h��ǄWe�H���T��6���t]��CׇmtY�~�Z��7���1���Fb��8�y��������x�˪�����Z(ߑ��`���x���ú�8�0�B��p�q���kln�99T�P���"��v1W2�=�q���NQ R�'���1]�eh���m]O�&f�S ��������������-���b�k6�N��LR      �      x������ � �      �   �   x�m��o�0�3�+<p��U��Ig�n(0�[�|V(,_WWؔ���d�.$/y�K^�c�[c��H����f�4��K��]츼sw�����,���U�n���,��>_=D��Ũ��Ll�Ni��<&O���)<:����0a0������S#oR��Gԕ�����ڴ�r��7��8����9L�����R=ǋ;*p�y�o��O�&B���md�B.��S�      �       x�3��CC\FXČ���`3�"���� �u�      �      x������ � �     