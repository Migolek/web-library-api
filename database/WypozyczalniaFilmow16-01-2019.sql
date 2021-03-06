PGDMP     :    '                 w            web_library    10.6    10.5 �    )	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            *	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            +	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ,	           1262    16666    web_library    DATABASE     �   CREATE DATABASE web_library WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Polish_Poland.1250' LC_CTYPE = 'Polish_Poland.1250';
    DROP DATABASE web_library;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            -	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12278    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            .	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16688    Aktor    TABLE     �   CREATE TABLE public."Aktor" (
    "ID" integer NOT NULL,
    "Imie" character varying(255) NOT NULL,
    "Nazwisko" character varying(255) NOT NULL,
    "DataUrodzenia" date,
    "Wzrost" integer
);
    DROP TABLE public."Aktor";
       public         postgres    false    3            �            1259    16694    Aktor_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Aktor_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Aktor_ID_seq";
       public       postgres    false    198    3            /	           0    0    Aktor_ID_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Aktor_ID_seq" OWNED BY public."Aktor"."ID";
            public       postgres    false    199            �            1259    16696    Dzielo    TABLE     �   CREATE TABLE public."Dzielo" (
    "Tytul" character varying(255) NOT NULL,
    "RokProdukcji" date NOT NULL,
    "Rezyser" character varying(255) NOT NULL,
    "Kraj" character varying(255) NOT NULL,
    "ID" integer NOT NULL
);
    DROP TABLE public."Dzielo";
       public         postgres    false    3            0	           0    0    TABLE "Dzielo"    COMMENT     I   COMMENT ON TABLE public."Dzielo" IS 'Tabela zawierajaca dzielo (filmy)';
            public       postgres    false    200            �            1259    16702    Dzielo_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Dzielo_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Dzielo_ID_seq";
       public       postgres    false    3    200            1	           0    0    Dzielo_ID_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Dzielo_ID_seq" OWNED BY public."Dzielo"."ID";
            public       postgres    false    201            �            1259    16704    Gatunek    TABLE     q   CREATE TABLE public."Gatunek" (
    "ID" integer NOT NULL,
    "NazwaGatunku" character varying(255) NOT NULL
);
    DROP TABLE public."Gatunek";
       public         postgres    false    3            �            1259    16707    GatunekDziela    TABLE     �   CREATE TABLE public."GatunekDziela" (
    "DzieloID" integer NOT NULL,
    "GatunekID" integer NOT NULL,
    "ID" integer NOT NULL
);
 #   DROP TABLE public."GatunekDziela";
       public         postgres    false    3            �            1259    16710    GatunekDziela_DzieloID_seq    SEQUENCE     �   CREATE SEQUENCE public."GatunekDziela_DzieloID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."GatunekDziela_DzieloID_seq";
       public       postgres    false    3    203            2	           0    0    GatunekDziela_DzieloID_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."GatunekDziela_DzieloID_seq" OWNED BY public."GatunekDziela"."DzieloID";
            public       postgres    false    204            �            1259    16712    GatunekDziela_GatunekID_seq    SEQUENCE     �   CREATE SEQUENCE public."GatunekDziela_GatunekID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."GatunekDziela_GatunekID_seq";
       public       postgres    false    3    203            3	           0    0    GatunekDziela_GatunekID_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."GatunekDziela_GatunekID_seq" OWNED BY public."GatunekDziela"."GatunekID";
            public       postgres    false    205            �            1259    16714    GatunekDziela_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."GatunekDziela_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."GatunekDziela_ID_seq";
       public       postgres    false    3    203            4	           0    0    GatunekDziela_ID_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."GatunekDziela_ID_seq" OWNED BY public."GatunekDziela"."ID";
            public       postgres    false    206            �            1259    16716    Gatunek_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Gatunek_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Gatunek_ID_seq";
       public       postgres    false    3    202            5	           0    0    Gatunek_ID_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Gatunek_ID_seq" OWNED BY public."Gatunek"."ID";
            public       postgres    false    207            �            1259    16718    HistoriaWypozyczen    TABLE     �   CREATE TABLE public."HistoriaWypozyczen" (
    "UzytkownikID" integer NOT NULL,
    "KopiaDzielaID" integer NOT NULL,
    "DataWypozyczenia" date,
    "DataZwrotu" date,
    "ID" integer NOT NULL
);
 (   DROP TABLE public."HistoriaWypozyczen";
       public         postgres    false    3            �            1259    16721    HistoriaWypozyczen_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."HistoriaWypozyczen_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."HistoriaWypozyczen_ID_seq";
       public       postgres    false    3    208            6	           0    0    HistoriaWypozyczen_ID_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."HistoriaWypozyczen_ID_seq" OWNED BY public."HistoriaWypozyczen"."ID";
            public       postgres    false    209            �            1259    16723 $   HistoriaWypozyczen_KopiaDzielaID_seq    SEQUENCE     �   CREATE SEQUENCE public."HistoriaWypozyczen_KopiaDzielaID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public."HistoriaWypozyczen_KopiaDzielaID_seq";
       public       postgres    false    3    208            7	           0    0 $   HistoriaWypozyczen_KopiaDzielaID_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."HistoriaWypozyczen_KopiaDzielaID_seq" OWNED BY public."HistoriaWypozyczen"."KopiaDzielaID";
            public       postgres    false    210            �            1259    16725 #   HistoriaWypozyczen_UzytkownikID_seq    SEQUENCE     �   CREATE SEQUENCE public."HistoriaWypozyczen_UzytkownikID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."HistoriaWypozyczen_UzytkownikID_seq";
       public       postgres    false    3    208            8	           0    0 #   HistoriaWypozyczen_UzytkownikID_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public."HistoriaWypozyczen_UzytkownikID_seq" OWNED BY public."HistoriaWypozyczen"."UzytkownikID";
            public       postgres    false    211            �            1259    16727    Magazyn    TABLE     �   CREATE TABLE public."Magazyn" (
    "DzieloID" integer NOT NULL,
    "NosnikID" integer NOT NULL,
    "ID" integer NOT NULL,
    "CzyWolne" boolean NOT NULL
);
    DROP TABLE public."Magazyn";
       public         postgres    false    3            �            1259    16730    Magazyn_DzieloID_seq    SEQUENCE     �   CREATE SEQUENCE public."Magazyn_DzieloID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Magazyn_DzieloID_seq";
       public       postgres    false    212    3            9	           0    0    Magazyn_DzieloID_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Magazyn_DzieloID_seq" OWNED BY public."Magazyn"."DzieloID";
            public       postgres    false    213            �            1259    16732    Magazyn_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Magazyn_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Magazyn_ID_seq";
       public       postgres    false    212    3            :	           0    0    Magazyn_ID_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Magazyn_ID_seq" OWNED BY public."Magazyn"."ID";
            public       postgres    false    214            �            1259    16734    Magazyn_NosnikID_seq    SEQUENCE     �   CREATE SEQUENCE public."Magazyn_NosnikID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Magazyn_NosnikID_seq";
       public       postgres    false    212    3            ;	           0    0    Magazyn_NosnikID_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Magazyn_NosnikID_seq" OWNED BY public."Magazyn"."NosnikID";
            public       postgres    false    215            �            1259    16736    Nosnik    TABLE     g   CREATE TABLE public."Nosnik" (
    "ID" integer NOT NULL,
    "Typ" character varying(255) NOT NULL
);
    DROP TABLE public."Nosnik";
       public         postgres    false    3            �            1259    16739    Nosnik_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Nosnik_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Nosnik_ID_seq";
       public       postgres    false    3    216            <	           0    0    Nosnik_ID_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Nosnik_ID_seq" OWNED BY public."Nosnik"."ID";
            public       postgres    false    217            �            1259    16741    Obsada    TABLE     }   CREATE TABLE public."Obsada" (
    "DzieloID" integer NOT NULL,
    "AktorID" integer NOT NULL,
    "ID" integer NOT NULL
);
    DROP TABLE public."Obsada";
       public         postgres    false    3            �            1259    16744    Obsada_AktorID_seq    SEQUENCE     �   CREATE SEQUENCE public."Obsada_AktorID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Obsada_AktorID_seq";
       public       postgres    false    218    3            =	           0    0    Obsada_AktorID_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Obsada_AktorID_seq" OWNED BY public."Obsada"."AktorID";
            public       postgres    false    219            �            1259    16746    Obsada_DzieloID_seq    SEQUENCE     �   CREATE SEQUENCE public."Obsada_DzieloID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Obsada_DzieloID_seq";
       public       postgres    false    3    218            >	           0    0    Obsada_DzieloID_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Obsada_DzieloID_seq" OWNED BY public."Obsada"."DzieloID";
            public       postgres    false    220            �            1259    16748    Obsada_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Obsada_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Obsada_ID_seq";
       public       postgres    false    3    218            ?	           0    0    Obsada_ID_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Obsada_ID_seq" OWNED BY public."Obsada"."ID";
            public       postgres    false    221            �            1259    16750 
   Rezerwacje    TABLE     �   CREATE TABLE public."Rezerwacje" (
    "UzytkownikID" integer NOT NULL,
    "KopiaDzielaID" integer NOT NULL,
    "ID" integer NOT NULL
);
     DROP TABLE public."Rezerwacje";
       public         postgres    false    3            �            1259    16753    Rezerwacje_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Rezerwacje_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Rezerwacje_ID_seq";
       public       postgres    false    222    3            @	           0    0    Rezerwacje_ID_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Rezerwacje_ID_seq" OWNED BY public."Rezerwacje"."ID";
            public       postgres    false    223            �            1259    16755    Rezerwacje_KopiaDzielaID_seq    SEQUENCE     �   CREATE SEQUENCE public."Rezerwacje_KopiaDzielaID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."Rezerwacje_KopiaDzielaID_seq";
       public       postgres    false    222    3            A	           0    0    Rezerwacje_KopiaDzielaID_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."Rezerwacje_KopiaDzielaID_seq" OWNED BY public."Rezerwacje"."KopiaDzielaID";
            public       postgres    false    224            �            1259    16757    Rezerwacje_UzytkownikID_seq    SEQUENCE     �   CREATE SEQUENCE public."Rezerwacje_UzytkownikID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public."Rezerwacje_UzytkownikID_seq";
       public       postgres    false    3    222            B	           0    0    Rezerwacje_UzytkownikID_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public."Rezerwacje_UzytkownikID_seq" OWNED BY public."Rezerwacje"."UzytkownikID";
            public       postgres    false    225            �            1259    16759    Role    TABLE     f   CREATE TABLE public."Role" (
    "ID" integer NOT NULL,
    "Rola" character varying(255) NOT NULL
);
    DROP TABLE public."Role";
       public         postgres    false    3            �            1259    16762    Role_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Role_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Role_ID_seq";
       public       postgres    false    3    226            C	           0    0    Role_ID_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Role_ID_seq" OWNED BY public."Role"."ID";
            public       postgres    false    227            �            1259    16764    UprawnieniaUzytkownikow    TABLE     �   CREATE TABLE public."UprawnieniaUzytkownikow" (
    "UzytkownikID" integer NOT NULL,
    "RoleID" integer NOT NULL,
    "ID" integer NOT NULL
);
 -   DROP TABLE public."UprawnieniaUzytkownikow";
       public         postgres    false    3            �            1259    16767    UprawnieniaUzytkownikow_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."UprawnieniaUzytkownikow_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."UprawnieniaUzytkownikow_ID_seq";
       public       postgres    false    3    228            D	           0    0    UprawnieniaUzytkownikow_ID_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."UprawnieniaUzytkownikow_ID_seq" OWNED BY public."UprawnieniaUzytkownikow"."ID";
            public       postgres    false    229            �            1259    16769 "   UprawnieniaUzytkownikow_RoleID_seq    SEQUENCE     �   CREATE SEQUENCE public."UprawnieniaUzytkownikow_RoleID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public."UprawnieniaUzytkownikow_RoleID_seq";
       public       postgres    false    228    3            E	           0    0 "   UprawnieniaUzytkownikow_RoleID_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."UprawnieniaUzytkownikow_RoleID_seq" OWNED BY public."UprawnieniaUzytkownikow"."RoleID";
            public       postgres    false    230            �            1259    16771 (   UprawnieniaUzytkownikow_UzytkownikID_seq    SEQUENCE     �   CREATE SEQUENCE public."UprawnieniaUzytkownikow_UzytkownikID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public."UprawnieniaUzytkownikow_UzytkownikID_seq";
       public       postgres    false    3    228            F	           0    0 (   UprawnieniaUzytkownikow_UzytkownikID_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public."UprawnieniaUzytkownikow_UzytkownikID_seq" OWNED BY public."UprawnieniaUzytkownikow"."UzytkownikID";
            public       postgres    false    231            �            1259    16773 
   Uzytkownik    TABLE     �  CREATE TABLE public."Uzytkownik" (
    "ID" integer NOT NULL,
    "Imie" character varying(255) NOT NULL,
    "Nazwisko" character varying(255) NOT NULL,
    "Nick" character varying(255) NOT NULL,
    "Haslo" character varying(255) NOT NULL,
    "DataUrodzenia" date NOT NULL,
    "PESEL" bigint,
    "Miejscowosc" character varying(255) NOT NULL,
    "Ulica" character varying(255),
    "NumerDomu" integer NOT NULL
);
     DROP TABLE public."Uzytkownik";
       public         postgres    false    3            �            1259    16779    Uzytkownik_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Uzytkownik_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Uzytkownik_ID_seq";
       public       postgres    false    232    3            G	           0    0    Uzytkownik_ID_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Uzytkownik_ID_seq" OWNED BY public."Uzytkownik"."ID";
            public       postgres    false    233            G           2604    16781    Aktor ID    DEFAULT     j   ALTER TABLE ONLY public."Aktor" ALTER COLUMN "ID" SET DEFAULT nextval('public."Aktor_ID_seq"'::regclass);
 ;   ALTER TABLE public."Aktor" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    199    198            H           2604    16782 	   Dzielo ID    DEFAULT     l   ALTER TABLE ONLY public."Dzielo" ALTER COLUMN "ID" SET DEFAULT nextval('public."Dzielo_ID_seq"'::regclass);
 <   ALTER TABLE public."Dzielo" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    201    200            I           2604    16783 
   Gatunek ID    DEFAULT     n   ALTER TABLE ONLY public."Gatunek" ALTER COLUMN "ID" SET DEFAULT nextval('public."Gatunek_ID_seq"'::regclass);
 =   ALTER TABLE public."Gatunek" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    207    202            J           2604    16784    GatunekDziela DzieloID    DEFAULT     �   ALTER TABLE ONLY public."GatunekDziela" ALTER COLUMN "DzieloID" SET DEFAULT nextval('public."GatunekDziela_DzieloID_seq"'::regclass);
 I   ALTER TABLE public."GatunekDziela" ALTER COLUMN "DzieloID" DROP DEFAULT;
       public       postgres    false    204    203            K           2604    16785    GatunekDziela GatunekID    DEFAULT     �   ALTER TABLE ONLY public."GatunekDziela" ALTER COLUMN "GatunekID" SET DEFAULT nextval('public."GatunekDziela_GatunekID_seq"'::regclass);
 J   ALTER TABLE public."GatunekDziela" ALTER COLUMN "GatunekID" DROP DEFAULT;
       public       postgres    false    205    203            L           2604    16786    GatunekDziela ID    DEFAULT     z   ALTER TABLE ONLY public."GatunekDziela" ALTER COLUMN "ID" SET DEFAULT nextval('public."GatunekDziela_ID_seq"'::regclass);
 C   ALTER TABLE public."GatunekDziela" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    206    203            M           2604    16787    HistoriaWypozyczen UzytkownikID    DEFAULT     �   ALTER TABLE ONLY public."HistoriaWypozyczen" ALTER COLUMN "UzytkownikID" SET DEFAULT nextval('public."HistoriaWypozyczen_UzytkownikID_seq"'::regclass);
 R   ALTER TABLE public."HistoriaWypozyczen" ALTER COLUMN "UzytkownikID" DROP DEFAULT;
       public       postgres    false    211    208            N           2604    16788     HistoriaWypozyczen KopiaDzielaID    DEFAULT     �   ALTER TABLE ONLY public."HistoriaWypozyczen" ALTER COLUMN "KopiaDzielaID" SET DEFAULT nextval('public."HistoriaWypozyczen_KopiaDzielaID_seq"'::regclass);
 S   ALTER TABLE public."HistoriaWypozyczen" ALTER COLUMN "KopiaDzielaID" DROP DEFAULT;
       public       postgres    false    210    208            O           2604    16789    HistoriaWypozyczen ID    DEFAULT     �   ALTER TABLE ONLY public."HistoriaWypozyczen" ALTER COLUMN "ID" SET DEFAULT nextval('public."HistoriaWypozyczen_ID_seq"'::regclass);
 H   ALTER TABLE public."HistoriaWypozyczen" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    209    208            P           2604    16790    Magazyn DzieloID    DEFAULT     z   ALTER TABLE ONLY public."Magazyn" ALTER COLUMN "DzieloID" SET DEFAULT nextval('public."Magazyn_DzieloID_seq"'::regclass);
 C   ALTER TABLE public."Magazyn" ALTER COLUMN "DzieloID" DROP DEFAULT;
       public       postgres    false    213    212            Q           2604    16791    Magazyn NosnikID    DEFAULT     z   ALTER TABLE ONLY public."Magazyn" ALTER COLUMN "NosnikID" SET DEFAULT nextval('public."Magazyn_NosnikID_seq"'::regclass);
 C   ALTER TABLE public."Magazyn" ALTER COLUMN "NosnikID" DROP DEFAULT;
       public       postgres    false    215    212            R           2604    16792 
   Magazyn ID    DEFAULT     n   ALTER TABLE ONLY public."Magazyn" ALTER COLUMN "ID" SET DEFAULT nextval('public."Magazyn_ID_seq"'::regclass);
 =   ALTER TABLE public."Magazyn" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    214    212            S           2604    16793 	   Nosnik ID    DEFAULT     l   ALTER TABLE ONLY public."Nosnik" ALTER COLUMN "ID" SET DEFAULT nextval('public."Nosnik_ID_seq"'::regclass);
 <   ALTER TABLE public."Nosnik" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    217    216            T           2604    16794    Obsada DzieloID    DEFAULT     x   ALTER TABLE ONLY public."Obsada" ALTER COLUMN "DzieloID" SET DEFAULT nextval('public."Obsada_DzieloID_seq"'::regclass);
 B   ALTER TABLE public."Obsada" ALTER COLUMN "DzieloID" DROP DEFAULT;
       public       postgres    false    220    218            U           2604    16795    Obsada AktorID    DEFAULT     v   ALTER TABLE ONLY public."Obsada" ALTER COLUMN "AktorID" SET DEFAULT nextval('public."Obsada_AktorID_seq"'::regclass);
 A   ALTER TABLE public."Obsada" ALTER COLUMN "AktorID" DROP DEFAULT;
       public       postgres    false    219    218            V           2604    16796 	   Obsada ID    DEFAULT     l   ALTER TABLE ONLY public."Obsada" ALTER COLUMN "ID" SET DEFAULT nextval('public."Obsada_ID_seq"'::regclass);
 <   ALTER TABLE public."Obsada" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    221    218            W           2604    16797    Rezerwacje UzytkownikID    DEFAULT     �   ALTER TABLE ONLY public."Rezerwacje" ALTER COLUMN "UzytkownikID" SET DEFAULT nextval('public."Rezerwacje_UzytkownikID_seq"'::regclass);
 J   ALTER TABLE public."Rezerwacje" ALTER COLUMN "UzytkownikID" DROP DEFAULT;
       public       postgres    false    225    222            X           2604    16798    Rezerwacje KopiaDzielaID    DEFAULT     �   ALTER TABLE ONLY public."Rezerwacje" ALTER COLUMN "KopiaDzielaID" SET DEFAULT nextval('public."Rezerwacje_KopiaDzielaID_seq"'::regclass);
 K   ALTER TABLE public."Rezerwacje" ALTER COLUMN "KopiaDzielaID" DROP DEFAULT;
       public       postgres    false    224    222            Y           2604    16799    Rezerwacje ID    DEFAULT     t   ALTER TABLE ONLY public."Rezerwacje" ALTER COLUMN "ID" SET DEFAULT nextval('public."Rezerwacje_ID_seq"'::regclass);
 @   ALTER TABLE public."Rezerwacje" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    223    222            Z           2604    16800    Role ID    DEFAULT     h   ALTER TABLE ONLY public."Role" ALTER COLUMN "ID" SET DEFAULT nextval('public."Role_ID_seq"'::regclass);
 :   ALTER TABLE public."Role" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    227    226            [           2604    16801 $   UprawnieniaUzytkownikow UzytkownikID    DEFAULT     �   ALTER TABLE ONLY public."UprawnieniaUzytkownikow" ALTER COLUMN "UzytkownikID" SET DEFAULT nextval('public."UprawnieniaUzytkownikow_UzytkownikID_seq"'::regclass);
 W   ALTER TABLE public."UprawnieniaUzytkownikow" ALTER COLUMN "UzytkownikID" DROP DEFAULT;
       public       postgres    false    231    228            \           2604    16802    UprawnieniaUzytkownikow RoleID    DEFAULT     �   ALTER TABLE ONLY public."UprawnieniaUzytkownikow" ALTER COLUMN "RoleID" SET DEFAULT nextval('public."UprawnieniaUzytkownikow_RoleID_seq"'::regclass);
 Q   ALTER TABLE public."UprawnieniaUzytkownikow" ALTER COLUMN "RoleID" DROP DEFAULT;
       public       postgres    false    230    228            ]           2604    16803    UprawnieniaUzytkownikow ID    DEFAULT     �   ALTER TABLE ONLY public."UprawnieniaUzytkownikow" ALTER COLUMN "ID" SET DEFAULT nextval('public."UprawnieniaUzytkownikow_ID_seq"'::regclass);
 M   ALTER TABLE public."UprawnieniaUzytkownikow" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    229    228            ^           2604    16804    Uzytkownik ID    DEFAULT     t   ALTER TABLE ONLY public."Uzytkownik" ALTER COLUMN "ID" SET DEFAULT nextval('public."Uzytkownik_ID_seq"'::regclass);
 @   ALTER TABLE public."Uzytkownik" ALTER COLUMN "ID" DROP DEFAULT;
       public       postgres    false    233    232            	          0    16688    Aktor 
   TABLE DATA               V   COPY public."Aktor" ("ID", "Imie", "Nazwisko", "DataUrodzenia", "Wzrost") FROM stdin;
    public       postgres    false    198   �       	          0    16696    Dzielo 
   TABLE DATA               T   COPY public."Dzielo" ("Tytul", "RokProdukcji", "Rezyser", "Kraj", "ID") FROM stdin;
    public       postgres    false    200   е       	          0    16704    Gatunek 
   TABLE DATA               9   COPY public."Gatunek" ("ID", "NazwaGatunku") FROM stdin;
    public       postgres    false    202   R�       	          0    16707    GatunekDziela 
   TABLE DATA               H   COPY public."GatunekDziela" ("DzieloID", "GatunekID", "ID") FROM stdin;
    public       postgres    false    203   ��       	          0    16718    HistoriaWypozyczen 
   TABLE DATA               w   COPY public."HistoriaWypozyczen" ("UzytkownikID", "KopiaDzielaID", "DataWypozyczenia", "DataZwrotu", "ID") FROM stdin;
    public       postgres    false    208   �       	          0    16727    Magazyn 
   TABLE DATA               M   COPY public."Magazyn" ("DzieloID", "NosnikID", "ID", "CzyWolne") FROM stdin;
    public       postgres    false    212   �       	          0    16736    Nosnik 
   TABLE DATA               /   COPY public."Nosnik" ("ID", "Typ") FROM stdin;
    public       postgres    false    216   z�       	          0    16741    Obsada 
   TABLE DATA               ?   COPY public."Obsada" ("DzieloID", "AktorID", "ID") FROM stdin;
    public       postgres    false    218   ��       	          0    16750 
   Rezerwacje 
   TABLE DATA               M   COPY public."Rezerwacje" ("UzytkownikID", "KopiaDzielaID", "ID") FROM stdin;
    public       postgres    false    222   �       	          0    16759    Role 
   TABLE DATA               .   COPY public."Role" ("ID", "Rola") FROM stdin;
    public       postgres    false    226   5�       !	          0    16764    UprawnieniaUzytkownikow 
   TABLE DATA               S   COPY public."UprawnieniaUzytkownikow" ("UzytkownikID", "RoleID", "ID") FROM stdin;
    public       postgres    false    228   l�       %	          0    16773 
   Uzytkownik 
   TABLE DATA               �   COPY public."Uzytkownik" ("ID", "Imie", "Nazwisko", "Nick", "Haslo", "DataUrodzenia", "PESEL", "Miejscowosc", "Ulica", "NumerDomu") FROM stdin;
    public       postgres    false    232   ��       H	           0    0    Aktor_ID_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Aktor_ID_seq"', 5, true);
            public       postgres    false    199            I	           0    0    Dzielo_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Dzielo_ID_seq"', 2, true);
            public       postgres    false    201            J	           0    0    GatunekDziela_DzieloID_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."GatunekDziela_DzieloID_seq"', 1, false);
            public       postgres    false    204            K	           0    0    GatunekDziela_GatunekID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."GatunekDziela_GatunekID_seq"', 1, false);
            public       postgres    false    205            L	           0    0    GatunekDziela_ID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."GatunekDziela_ID_seq"', 1, true);
            public       postgres    false    206            M	           0    0    Gatunek_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Gatunek_ID_seq"', 3, true);
            public       postgres    false    207            N	           0    0    HistoriaWypozyczen_ID_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."HistoriaWypozyczen_ID_seq"', 1, false);
            public       postgres    false    209            O	           0    0 $   HistoriaWypozyczen_KopiaDzielaID_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."HistoriaWypozyczen_KopiaDzielaID_seq"', 1, false);
            public       postgres    false    210            P	           0    0 #   HistoriaWypozyczen_UzytkownikID_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."HistoriaWypozyczen_UzytkownikID_seq"', 1, false);
            public       postgres    false    211            Q	           0    0    Magazyn_DzieloID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Magazyn_DzieloID_seq"', 5, true);
            public       postgres    false    213            R	           0    0    Magazyn_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Magazyn_ID_seq"', 2, true);
            public       postgres    false    214            S	           0    0    Magazyn_NosnikID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Magazyn_NosnikID_seq"', 5, true);
            public       postgres    false    215            T	           0    0    Nosnik_ID_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Nosnik_ID_seq"', 2, true);
            public       postgres    false    217            U	           0    0    Obsada_AktorID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Obsada_AktorID_seq"', 1, false);
            public       postgres    false    219            V	           0    0    Obsada_DzieloID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Obsada_DzieloID_seq"', 1, false);
            public       postgres    false    220            W	           0    0    Obsada_ID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Obsada_ID_seq"', 1, false);
            public       postgres    false    221            X	           0    0    Rezerwacje_ID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Rezerwacje_ID_seq"', 1, false);
            public       postgres    false    223            Y	           0    0    Rezerwacje_KopiaDzielaID_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."Rezerwacje_KopiaDzielaID_seq"', 1, false);
            public       postgres    false    224            Z	           0    0    Rezerwacje_UzytkownikID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."Rezerwacje_UzytkownikID_seq"', 1, false);
            public       postgres    false    225            [	           0    0    Role_ID_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Role_ID_seq"', 9, true);
            public       postgres    false    227            \	           0    0    UprawnieniaUzytkownikow_ID_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."UprawnieniaUzytkownikow_ID_seq"', 4, true);
            public       postgres    false    229            ]	           0    0 "   UprawnieniaUzytkownikow_RoleID_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."UprawnieniaUzytkownikow_RoleID_seq"', 1, false);
            public       postgres    false    230            ^	           0    0 (   UprawnieniaUzytkownikow_UzytkownikID_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."UprawnieniaUzytkownikow_UzytkownikID_seq"', 1, false);
            public       postgres    false    231            _	           0    0    Uzytkownik_ID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Uzytkownik_ID_seq"', 14, true);
            public       postgres    false    233            `           2606    16806    Aktor Aktor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Aktor"
    ADD CONSTRAINT "Aktor_pkey" PRIMARY KEY ("ID");
 >   ALTER TABLE ONLY public."Aktor" DROP CONSTRAINT "Aktor_pkey";
       public         postgres    false    198            b           2606    16808    Dzielo Dzielo_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Dzielo"
    ADD CONSTRAINT "Dzielo_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Dzielo" DROP CONSTRAINT "Dzielo_pkey";
       public         postgres    false    200            f           2606    16810     GatunekDziela GatunekDziela_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."GatunekDziela"
    ADD CONSTRAINT "GatunekDziela_pkey" PRIMARY KEY ("ID");
 N   ALTER TABLE ONLY public."GatunekDziela" DROP CONSTRAINT "GatunekDziela_pkey";
       public         postgres    false    203            d           2606    16812    Gatunek Gatunek_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Gatunek"
    ADD CONSTRAINT "Gatunek_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."Gatunek" DROP CONSTRAINT "Gatunek_pkey";
       public         postgres    false    202            i           2606    16814 *   HistoriaWypozyczen HistoriaWypozyczen_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."HistoriaWypozyczen"
    ADD CONSTRAINT "HistoriaWypozyczen_pkey" PRIMARY KEY ("ID");
 X   ALTER TABLE ONLY public."HistoriaWypozyczen" DROP CONSTRAINT "HistoriaWypozyczen_pkey";
       public         postgres    false    208            k           2606    16816    Magazyn Magazyn_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Magazyn"
    ADD CONSTRAINT "Magazyn_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."Magazyn" DROP CONSTRAINT "Magazyn_pkey";
       public         postgres    false    212            n           2606    16818    Nosnik Nosnik_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Nosnik"
    ADD CONSTRAINT "Nosnik_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Nosnik" DROP CONSTRAINT "Nosnik_pkey";
       public         postgres    false    216            p           2606    16820    Obsada Obsada_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Obsada"
    ADD CONSTRAINT "Obsada_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Obsada" DROP CONSTRAINT "Obsada_pkey";
       public         postgres    false    218            t           2606    16822    Rezerwacje Rezerwacje_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Rezerwacje"
    ADD CONSTRAINT "Rezerwacje_pkey" PRIMARY KEY ("ID");
 H   ALTER TABLE ONLY public."Rezerwacje" DROP CONSTRAINT "Rezerwacje_pkey";
       public         postgres    false    222            w           2606    16824    Role Role_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("ID");
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public         postgres    false    226            y           2606    16826 4   UprawnieniaUzytkownikow UprawnieniaUzytkownikow_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."UprawnieniaUzytkownikow"
    ADD CONSTRAINT "UprawnieniaUzytkownikow_pkey" PRIMARY KEY ("ID");
 b   ALTER TABLE ONLY public."UprawnieniaUzytkownikow" DROP CONSTRAINT "UprawnieniaUzytkownikow_pkey";
       public         postgres    false    228            }           2606    16828    Uzytkownik Uzytkownik_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Uzytkownik"
    ADD CONSTRAINT "Uzytkownik_pkey" PRIMARY KEY ("ID");
 H   ALTER TABLE ONLY public."Uzytkownik" DROP CONSTRAINT "Uzytkownik_pkey";
       public         postgres    false    232            q           1259    16829    fki_AktorID    INDEX     ^   CREATE INDEX "fki_AktorID" ON public."Obsada" USING btree ("AktorID") WITH (fillfactor='90');
 !   DROP INDEX public."fki_AktorID";
       public         postgres    false    218            r           1259    16830    fki_DzieloID    INDEX     `   CREATE INDEX "fki_DzieloID" ON public."Obsada" USING btree ("DzieloID") WITH (fillfactor='90');
 "   DROP INDEX public."fki_DzieloID";
       public         postgres    false    218            g           1259    16831    fki_GatunekID    INDEX     i   CREATE INDEX "fki_GatunekID" ON public."GatunekDziela" USING btree ("GatunekID") WITH (fillfactor='90');
 #   DROP INDEX public."fki_GatunekID";
       public         postgres    false    203            u           1259    16832    fki_KopiaDzielaID    INDEX     n   CREATE INDEX "fki_KopiaDzielaID" ON public."Rezerwacje" USING btree ("KopiaDzielaID") WITH (fillfactor='90');
 '   DROP INDEX public."fki_KopiaDzielaID";
       public         postgres    false    222            l           1259    16833    fki_NosnikID    INDEX     a   CREATE INDEX "fki_NosnikID" ON public."Magazyn" USING btree ("NosnikID") WITH (fillfactor='90');
 "   DROP INDEX public."fki_NosnikID";
       public         postgres    false    212            z           1259    16834 
   fki_RoleID    INDEX     m   CREATE INDEX "fki_RoleID" ON public."UprawnieniaUzytkownikow" USING btree ("RoleID") WITH (fillfactor='90');
     DROP INDEX public."fki_RoleID";
       public         postgres    false    228            {           1259    16835    fki_UzytkownikID    INDEX     y   CREATE INDEX "fki_UzytkownikID" ON public."UprawnieniaUzytkownikow" USING btree ("UzytkownikID") WITH (fillfactor='90');
 &   DROP INDEX public."fki_UzytkownikID";
       public         postgres    false    228            �           2606    16836    Obsada AktorID    FK CONSTRAINT     w   ALTER TABLE ONLY public."Obsada"
    ADD CONSTRAINT "AktorID" FOREIGN KEY ("AktorID") REFERENCES public."Aktor"("ID");
 <   ALTER TABLE ONLY public."Obsada" DROP CONSTRAINT "AktorID";
       public       postgres    false    2144    198    218            ~           2606    16841    GatunekDziela DzieloID    FK CONSTRAINT     �   ALTER TABLE ONLY public."GatunekDziela"
    ADD CONSTRAINT "DzieloID" FOREIGN KEY ("DzieloID") REFERENCES public."Dzielo"("ID");
 D   ALTER TABLE ONLY public."GatunekDziela" DROP CONSTRAINT "DzieloID";
       public       postgres    false    2146    203    200            �           2606    16846    Magazyn DzieloID    FK CONSTRAINT     {   ALTER TABLE ONLY public."Magazyn"
    ADD CONSTRAINT "DzieloID" FOREIGN KEY ("DzieloID") REFERENCES public."Dzielo"("ID");
 >   ALTER TABLE ONLY public."Magazyn" DROP CONSTRAINT "DzieloID";
       public       postgres    false    200    212    2146            �           2606    16851    Obsada DzieloID    FK CONSTRAINT     z   ALTER TABLE ONLY public."Obsada"
    ADD CONSTRAINT "DzieloID" FOREIGN KEY ("DzieloID") REFERENCES public."Dzielo"("ID");
 =   ALTER TABLE ONLY public."Obsada" DROP CONSTRAINT "DzieloID";
       public       postgres    false    218    2146    200                       2606    16856    GatunekDziela GatunekID    FK CONSTRAINT     �   ALTER TABLE ONLY public."GatunekDziela"
    ADD CONSTRAINT "GatunekID" FOREIGN KEY ("GatunekID") REFERENCES public."Gatunek"("ID");
 E   ALTER TABLE ONLY public."GatunekDziela" DROP CONSTRAINT "GatunekID";
       public       postgres    false    202    2148    203            �           2606    16861     HistoriaWypozyczen KopiaDzielaID    FK CONSTRAINT     �   ALTER TABLE ONLY public."HistoriaWypozyczen"
    ADD CONSTRAINT "KopiaDzielaID" FOREIGN KEY ("KopiaDzielaID") REFERENCES public."Magazyn"("ID");
 N   ALTER TABLE ONLY public."HistoriaWypozyczen" DROP CONSTRAINT "KopiaDzielaID";
       public       postgres    false    212    208    2155            �           2606    16866    Rezerwacje KopiaDzielaID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Rezerwacje"
    ADD CONSTRAINT "KopiaDzielaID" FOREIGN KEY ("KopiaDzielaID") REFERENCES public."Magazyn"("ID");
 F   ALTER TABLE ONLY public."Rezerwacje" DROP CONSTRAINT "KopiaDzielaID";
       public       postgres    false    212    2155    222            �           2606    16871    Magazyn NosnikID    FK CONSTRAINT     {   ALTER TABLE ONLY public."Magazyn"
    ADD CONSTRAINT "NosnikID" FOREIGN KEY ("NosnikID") REFERENCES public."Nosnik"("ID");
 >   ALTER TABLE ONLY public."Magazyn" DROP CONSTRAINT "NosnikID";
       public       postgres    false    2158    216    212            �           2606    16876    UprawnieniaUzytkownikow RoleID    FK CONSTRAINT     �   ALTER TABLE ONLY public."UprawnieniaUzytkownikow"
    ADD CONSTRAINT "RoleID" FOREIGN KEY ("RoleID") REFERENCES public."Role"("ID");
 L   ALTER TABLE ONLY public."UprawnieniaUzytkownikow" DROP CONSTRAINT "RoleID";
       public       postgres    false    226    2167    228            �           2606    16881    HistoriaWypozyczen UzytkownikID    FK CONSTRAINT     �   ALTER TABLE ONLY public."HistoriaWypozyczen"
    ADD CONSTRAINT "UzytkownikID" FOREIGN KEY ("UzytkownikID") REFERENCES public."Uzytkownik"("ID");
 M   ALTER TABLE ONLY public."HistoriaWypozyczen" DROP CONSTRAINT "UzytkownikID";
       public       postgres    false    232    208    2173            �           2606    16886    Rezerwacje UzytkownikID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Rezerwacje"
    ADD CONSTRAINT "UzytkownikID" FOREIGN KEY ("UzytkownikID") REFERENCES public."Uzytkownik"("ID");
 E   ALTER TABLE ONLY public."Rezerwacje" DROP CONSTRAINT "UzytkownikID";
       public       postgres    false    232    222    2173            �           2606    16891 $   UprawnieniaUzytkownikow UzytkownikID    FK CONSTRAINT     �   ALTER TABLE ONLY public."UprawnieniaUzytkownikow"
    ADD CONSTRAINT "UzytkownikID" FOREIGN KEY ("UzytkownikID") REFERENCES public."Uzytkownik"("ID");
 R   ALTER TABLE ONLY public."UprawnieniaUzytkownikow" DROP CONSTRAINT "UzytkownikID";
       public       postgres    false    2173    228    232            	   �   x�e�Ak1�������n����D���剡}�M ������9|��-{�]�	t߷��*=�6S���������U����������ʞ4�fX�Ŝ��|��������Rl��ԚZ�d�!\ħr��!���W��a�wo���ϡ4�S�/qNxo_���^+EZ�l���]��yBDO(H�      	   r  x�5��N�0���S썓Q��sCE������,�6��ؑ�}{6�J9ewf���5�#:�gY���ʵ(��mg�ky/�ܞ1�.�?A�	�����|{9+�Be3��;��=;7J'���c����u}��	�ZM�Δ��Mf�ӻ4
�r�C��ث���3���RH�N������Lx}��LT��}�������oQ<�66(棌s�;[�i�`9��X����{��'��j!u��
x��s1�f������R���:�R��p`��cp*�D_��-�|V5^���݅uU���wA��u��� =Q:Wz!�)1��M䊟�{bt#t&ׁ�o5gV�-EqAǕ�����\~�J)�V�o      	   <   x�3�t�N�J�2����MM�L�2�t)J�M,�2���/*�/�2�t��.�M�+����� ���      	   9   x��� !��q1+G/�_�F�?v,�teM�&_,�;usb7�▫�~�7      	      x������ � �      	   f   x�5�� !��P�FP���el�Y�H<�'����	�j ؄����>%kU��f�Q�BO�pv�1���9���a�뺓,n��Np���Ө �      	   $   x�3�t�)M�J��2�t	s�2������� e!(      	   Z   x����@��T1���zI�u��G��,cJ�e�Ekp��`���9�,n8S�J͎
�v�Q���"3Jh�f�;:�(?/��s���I���      	      x������ � �      	   '   x�3�LL����2�,-N-�2�L�-�ɯLM����� ���      !	   %   x�3�4�4�24�4�4�24R&\��@ʘ+F��� C>      %	   �   x�MNK
1]'w�$iQ��0�2vQ�A[��&L��|_�a��W+0��X��Z,[|BK�� O����q�e��=��Q��l({�j��3	�;��d�ʐ:]�Y�9Q0�1���:�d�倈?^�:     