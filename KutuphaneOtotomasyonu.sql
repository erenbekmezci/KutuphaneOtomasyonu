--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.0

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
-- Name: SilinenKitapArsiv(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."SilinenKitapArsiv"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    
    INSERT INTO "silinenKitaplar"("kitapNo", "kitapAdi", "basimYili", "stok","yayinEvi","ISBN","sayfaSayisi")
    VALUES(OLD."kitapNo", OLD."kitapAdi", OLD."basimYili",OLD."stok",OLD."yayinEvi",OLD."ISBN",OLD."sayfaSayisi" );
    

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."SilinenKitapArsiv"() OWNER TO postgres;

--
-- Name: kisiEkleTR1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."kisiEkleTR1"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."ad" = UPPER(NEW."ad");
    NEW."soyad" = UPPER(NEW."soyad"); 
    NEW."ad" = LTRIM(NEW."ad");
    NEW."soyad" = LTRIM(NEW."soyad"); 
    IF NEW."ad" IS NULL THEN
            RAISE EXCEPTION 'ad ve soyad alanı boş olamaz';  
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."kisiEkleTR1"() OWNER TO postgres;

--
-- Name: kitapEkleTR1(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."kitapEkleTR1"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."kitapAdi" = UPPER(NEW."kitapAdi");
    NEW."kitapAdi" = LTRIM(NEW."kitapAdi");
    
    IF NEW."kitapAdi" IS NULL THEN
            RAISE EXCEPTION 'kitapAdi alanı boş olamaz';  
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."kitapEkleTR1"() OWNER TO postgres;

--
-- Name: kitapKayitGetir(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."kitapKayitGetir"(deger integer) RETURNS TABLE(kitapad character varying, basimyili date, stok integer, yazarad character varying, turad character varying, yayinevi integer)
    LANGUAGE plpgsql
    AS $$
begin
return QUERY SELECT "public"."tbkitap"."kitapAdi",
         "public"."tbkitap"."basimYili",
         "public"."tbkitap"."stok",
         "public"."tbyazar"."yazarAd",
         "public"."tbtur"."turAd",
         "public"."tbkitap"."yayinEvi"
FROM     "public"."tbkitap" 
INNER JOIN "public"."kitap_yazar"  ON "public"."tbkitap"."kitapNo" = "public"."kitap_yazar"."kitap" 
INNER JOIN "public"."tbyazar"  ON "public"."tbyazar"."yazarNo" = "public"."kitap_yazar"."yazar" 
INNER JOIN "public"."kitap_tur"  ON "public"."tbkitap"."kitapNo" = "public"."kitap_tur"."kitap" 
INNER JOIN "public"."tbtur"  ON "public"."tbtur"."turNo" = "public"."kitap_tur"."tur" WHERE "tbkitap"."kitapNo" = deger;

              
end;
$$;


ALTER FUNCTION public."kitapKayitGetir"(deger integer) OWNER TO postgres;

--
-- Name: kitapStok(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."kitapStok"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    
    UPDATE "tbkitap" SET "stok" = "stok" - 1 
    WHERE "kitapNo" = NEW.kitap;
    

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."kitapStok"() OWNER TO postgres;

--
-- Name: maasDegisikligiIzle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."maasDegisikligiIzle"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."maas" <> OLD."maas" THEN
        INSERT INTO "maasDegisimi"("kisiNo", "eskiMaas", "yeniMaas", "degisiklikTarihi")
        VALUES(OLD."kisiNo", OLD."maas", NEW."maas", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."maasDegisikligiIzle"() OWNER TO postgres;

--
-- Name: oduncAlan(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."oduncAlan"(kitapid integer) RETURNS TABLE(adi character varying, soyadi character varying, kitapad character varying)
    LANGUAGE plpgsql
    AS $$
begin
return QUERY SELECT   "public"."tbkitap"."kitapAdi",
         "public"."tbkisi"."ad",
         "public"."tbkisi"."soyad"
FROM     "public"."tbkitap" 
INNER JOIN "public"."tbodunc"  ON "public"."tbkitap"."kitapNo" = "public"."tbodunc"."kitap" 
INNER JOIN "public"."tbuye"  ON "public"."tbuye"."kisiNo" = "public"."tbodunc"."uye" 
INNER JOIN "public"."tbkisi"  ON "public"."tbkisi"."kisiNo" = "public"."tbuye"."kisiNo" where "tbkitap"."kitapNo" = kitapid;
end;
$$;


ALTER FUNCTION public."oduncAlan"(kitapid integer) OWNER TO postgres;

--
-- Name: personelKayitGetir(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."personelKayitGetir"(deger integer) RETURNS TABLE(ad character varying, soyad character varying, gorevadi character varying, silicno character varying, baslamatarihi date)
    LANGUAGE plpgsql
    AS $$
begin
return QUERY SELECT "tbkisi"."ad","tbkisi"."soyad","tbgorev"."gorevAdi","tbpersonel"."sicilNo","tbpersonel"."baslamaTarihi" FROM "tbkisi" 
join "tbpersonel" on "tbkisi"."kisiNo" = "tbpersonel"."kisiNo"
join "tbgorev" on "tbgorev"."gorevNo" = "tbpersonel"."gorev" 
where "tbpersonel"."kisiNo" = deger;

              
end;
$$;


ALTER FUNCTION public."personelKayitGetir"(deger integer) OWNER TO postgres;

--
-- Name: stokBilgi(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."stokBilgi"(kitapid integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE BEGIN

return (select "stok" 
from "public"."tbkitap"
where "kitapNo" = kitapid);
	END;
$$;


ALTER FUNCTION public."stokBilgi"(kitapid integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tbgorev; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbgorev (
    "gorevNo" integer NOT NULL,
    "gorevAdi" character varying(40) NOT NULL
);


ALTER TABLE public.tbgorev OWNER TO postgres;

--
-- Name: Gorev_gorevNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Gorev_gorevNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Gorev_gorevNo_seq" OWNER TO postgres;

--
-- Name: Gorev_gorevNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Gorev_gorevNo_seq" OWNED BY public.tbgorev."gorevNo";


--
-- Name: tbkisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbkisi (
    "kisiNo" integer NOT NULL,
    ad character varying(40) NOT NULL,
    soyad character varying(40) NOT NULL,
    cinsiyet character(1) NOT NULL,
    "medeniDurumu" integer NOT NULL,
    "kisiTur" character varying(40) NOT NULL
);


ALTER TABLE public.tbkisi OWNER TO postgres;

--
-- Name: Kisi_kisiNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kisi_kisiNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Kisi_kisiNo_seq" OWNER TO postgres;

--
-- Name: Kisi_kisiNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kisi_kisiNo_seq" OWNED BY public.tbkisi."kisiNo";


--
-- Name: tbkitap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbkitap (
    "kitapNo" integer NOT NULL,
    "kitapAdi" character varying(40) NOT NULL,
    "yayinEvi" integer NOT NULL,
    "basimYili" date,
    stok integer NOT NULL,
    "sayfaSayisi" integer NOT NULL,
    "ISBN" character varying(40) NOT NULL,
    CONSTRAINT stokcheck CHECK ((stok >= 0))
);


ALTER TABLE public.tbkitap OWNER TO postgres;

--
-- Name: Kitap_kitapNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kitap_kitapNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Kitap_kitapNo_seq" OWNER TO postgres;

--
-- Name: Kitap_kitapNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kitap_kitapNo_seq" OWNED BY public.tbkitap."kitapNo";


--
-- Name: tbodunc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbodunc (
    "oduncNo" integer NOT NULL,
    uye integer NOT NULL,
    kitap integer NOT NULL,
    "oduncAlmaTarihi" date NOT NULL,
    "geriVermeTarihi" date NOT NULL
);


ALTER TABLE public.tbodunc OWNER TO postgres;

--
-- Name: Odunc_oduncNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Odunc_oduncNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Odunc_oduncNo_seq" OWNER TO postgres;

--
-- Name: Odunc_oduncNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Odunc_oduncNo_seq" OWNED BY public.tbodunc."oduncNo";


--
-- Name: tbtur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbtur (
    "turNo" integer NOT NULL,
    "turAd" character varying(40) NOT NULL
);


ALTER TABLE public.tbtur OWNER TO postgres;

--
-- Name: Tur_turNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tur_turNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tur_turNo_seq" OWNER TO postgres;

--
-- Name: Tur_turNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tur_turNo_seq" OWNED BY public.tbtur."turNo";


--
-- Name: tbyayinevi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbyayinevi (
    "yayinEviNo" integer NOT NULL,
    adres character varying(40) NOT NULL,
    "yayinEviAdi" character varying(40) NOT NULL
);


ALTER TABLE public.tbyayinevi OWNER TO postgres;

--
-- Name: Yayinevi_yayinEviNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Yayinevi_yayinEviNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Yayinevi_yayinEviNo_seq" OWNER TO postgres;

--
-- Name: Yayinevi_yayinEviNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Yayinevi_yayinEviNo_seq" OWNED BY public.tbyayinevi."yayinEviNo";


--
-- Name: tbyazar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbyazar (
    "yazarNo" integer NOT NULL,
    "yazarAd" character varying(40) NOT NULL
);


ALTER TABLE public.tbyazar OWNER TO postgres;

--
-- Name: Yazar_yazarNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Yazar_yazarNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Yazar_yazarNo_seq" OWNER TO postgres;

--
-- Name: Yazar_yazarNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Yazar_yazarNo_seq" OWNED BY public.tbyazar."yazarNo";


--
-- Name: il; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.il (
    "ilNo" integer NOT NULL,
    "ilAd" character varying(40) NOT NULL
);


ALTER TABLE public.il OWNER TO postgres;

--
-- Name: ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilce (
    "ilceNo" integer NOT NULL,
    "ilceAd" character varying(40) NOT NULL,
    "ilNo" integer NOT NULL
);


ALTER TABLE public.ilce OWNER TO postgres;

--
-- Name: ilce_ilceNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ilce_ilceNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ilce_ilceNo_seq" OWNER TO postgres;

--
-- Name: ilce_ilceNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ilce_ilceNo_seq" OWNED BY public.ilce."ilceNo";


--
-- Name: iletisim_bilgileri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iletisim_bilgileri (
    "iletisimNo" integer NOT NULL,
    telefon character(11) NOT NULL,
    adres character varying(40) NOT NULL,
    "kisiNo" integer NOT NULL,
    ilce integer NOT NULL
);


ALTER TABLE public.iletisim_bilgileri OWNER TO postgres;

--
-- Name: iletisimBilgileri_iletisimNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."iletisimBilgileri_iletisimNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."iletisimBilgileri_iletisimNo_seq" OWNER TO postgres;

--
-- Name: iletisimBilgileri_iletisimNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."iletisimBilgileri_iletisimNo_seq" OWNED BY public.iletisim_bilgileri."iletisimNo";


--
-- Name: kitap_tur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitap_tur (
    "kitap_turNo" integer NOT NULL,
    tur integer NOT NULL,
    kitap integer NOT NULL
);


ALTER TABLE public.kitap_tur OWNER TO postgres;

--
-- Name: kitap_tur_kitap_turNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."kitap_tur_kitap_turNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."kitap_tur_kitap_turNo_seq" OWNER TO postgres;

--
-- Name: kitap_tur_kitap_turNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."kitap_tur_kitap_turNo_seq" OWNED BY public.kitap_tur."kitap_turNo";


--
-- Name: kitap_yazar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitap_yazar (
    "kitap_yazarNo" integer NOT NULL,
    yazar integer NOT NULL,
    kitap integer NOT NULL
);


ALTER TABLE public.kitap_yazar OWNER TO postgres;

--
-- Name: kitap_yazar_kitap_yazarNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."kitap_yazar_kitap_yazarNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."kitap_yazar_kitap_yazarNo_seq" OWNER TO postgres;

--
-- Name: kitap_yazar_kitap_yazarNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."kitap_yazar_kitap_yazarNo_seq" OWNED BY public.kitap_yazar."kitap_yazarNo";


--
-- Name: maasDegisimi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."maasDegisimi" (
    "kayitNo" integer NOT NULL,
    "kisiNo" integer NOT NULL,
    "eskiMaas" real NOT NULL,
    "yeniMaas" real NOT NULL,
    "degisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."maasDegisimi" OWNER TO postgres;

--
-- Name: maasDegisimi_kayitNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."maasDegisimi_kayitNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."maasDegisimi_kayitNo_seq" OWNER TO postgres;

--
-- Name: maasDegisimi_kayitNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."maasDegisimi_kayitNo_seq" OWNED BY public."maasDegisimi"."kayitNo";


--
-- Name: medenidurum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medenidurum (
    "durumNo" integer NOT NULL,
    "durumAdi" character varying(40) NOT NULL
);


ALTER TABLE public.medenidurum OWNER TO postgres;

--
-- Name: silinenKitaplar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."silinenKitaplar" (
    "kitapNo" integer NOT NULL,
    "kitapAdi" character varying(40) NOT NULL,
    "yayinEvi" integer NOT NULL,
    "basimYili" date,
    stok integer NOT NULL,
    "sayfaSayisi" integer NOT NULL,
    "ISBN" character varying(40) NOT NULL
);


ALTER TABLE public."silinenKitaplar" OWNER TO postgres;

--
-- Name: tbpersonel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbpersonel (
    "kisiNo" integer NOT NULL,
    "baslamaTarihi" date NOT NULL,
    maas integer NOT NULL,
    "sicilNo" character varying(40) NOT NULL,
    gorev integer NOT NULL
);


ALTER TABLE public.tbpersonel OWNER TO postgres;

--
-- Name: tbuye; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbuye (
    "kisiNo" integer NOT NULL,
    "kimlikNo" character varying(11) NOT NULL
);


ALTER TABLE public.tbuye OWNER TO postgres;

--
-- Name: ilce ilceNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce ALTER COLUMN "ilceNo" SET DEFAULT nextval('public."ilce_ilceNo_seq"'::regclass);


--
-- Name: iletisim_bilgileri iletisimNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iletisim_bilgileri ALTER COLUMN "iletisimNo" SET DEFAULT nextval('public."iletisimBilgileri_iletisimNo_seq"'::regclass);


--
-- Name: kitap_tur kitap_turNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_tur ALTER COLUMN "kitap_turNo" SET DEFAULT nextval('public."kitap_tur_kitap_turNo_seq"'::regclass);


--
-- Name: kitap_yazar kitap_yazarNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_yazar ALTER COLUMN "kitap_yazarNo" SET DEFAULT nextval('public."kitap_yazar_kitap_yazarNo_seq"'::regclass);


--
-- Name: maasDegisimi kayitNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."maasDegisimi" ALTER COLUMN "kayitNo" SET DEFAULT nextval('public."maasDegisimi_kayitNo_seq"'::regclass);


--
-- Name: tbgorev gorevNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbgorev ALTER COLUMN "gorevNo" SET DEFAULT nextval('public."Gorev_gorevNo_seq"'::regclass);


--
-- Name: tbkisi kisiNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbkisi ALTER COLUMN "kisiNo" SET DEFAULT nextval('public."Kisi_kisiNo_seq"'::regclass);


--
-- Name: tbkitap kitapNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbkitap ALTER COLUMN "kitapNo" SET DEFAULT nextval('public."Kitap_kitapNo_seq"'::regclass);


--
-- Name: tbodunc oduncNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbodunc ALTER COLUMN "oduncNo" SET DEFAULT nextval('public."Odunc_oduncNo_seq"'::regclass);


--
-- Name: tbtur turNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbtur ALTER COLUMN "turNo" SET DEFAULT nextval('public."Tur_turNo_seq"'::regclass);


--
-- Name: tbyayinevi yayinEviNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbyayinevi ALTER COLUMN "yayinEviNo" SET DEFAULT nextval('public."Yayinevi_yayinEviNo_seq"'::regclass);


--
-- Name: tbyazar yazarNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbyazar ALTER COLUMN "yazarNo" SET DEFAULT nextval('public."Yazar_yazarNo_seq"'::regclass);


--
-- Data for Name: il; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.il VALUES
	(16, 'Bursa'),
	(6, 'Ankara'),
	(1, 'Adana'),
	(34, 'İstanbul'),
	(67, 'Zonguldak');


--
-- Data for Name: ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ilce VALUES
	(1, 'Devrek', 67),
	(2, 'Çaycuma', 67),
	(3, 'Kozlu', 67),
	(4, 'Alaplı', 67),
	(5, 'Ereğli', 67),
	(6, 'Seyhan', 1),
	(7, 'Ceyhan', 1),
	(8, 'Feke', 1),
	(9, 'Kozludağ', 1),
	(10, 'Kozan', 1),
	(11, 'Pozantı', 1),
	(12, 'Osmangazi', 16),
	(13, 'İnegöl', 16),
	(14, 'Nilüfer', 16),
	(15, 'Orhangazi', 16),
	(16, 'Gemlik', 16),
	(17, 'Yenişehir', 16),
	(18, 'Kızılay', 6),
	(19, 'Mamak', 6),
	(20, 'Altındağ', 6),
	(21, 'Çankaya', 6),
	(22, 'Sincan', 6),
	(23, 'Keçiören', 6),
	(24, 'Küçükçekmece', 34),
	(25, 'Büyükçekmece', 34),
	(26, 'Beylikdüzü', 34),
	(27, 'Avcılar', 34),
	(28, 'Arnavutköy', 34),
	(29, 'Fatih', 34),
	(30, 'Kadıköy', 34),
	(31, 'Esenler', 34),
	(32, 'Pendik', 34);


--
-- Data for Name: iletisim_bilgileri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.iletisim_bilgileri VALUES
	(14, '65465456565', 'karşıyaka mah.', 26, 1),
	(17, '12312412313', 'serdivan', 32, 29),
	(16, '23423523423', 'CAMİLİ MAH', 28, 8),
	(22, '56565656565', 'kozlu mah', 38, 20);


--
-- Data for Name: kitap_tur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kitap_tur VALUES
	(6, 8, 19),
	(7, 9, 20),
	(8, 10, 21),
	(9, 11, 22),
	(10, 12, 23);


--
-- Data for Name: kitap_yazar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kitap_yazar VALUES
	(6, 6, 19),
	(7, 7, 20),
	(8, 8, 21),
	(9, 9, 22),
	(10, 10, 23);


--
-- Data for Name: maasDegisimi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."maasDegisimi" VALUES
	(2, 30, 2900, 3700, '2021-12-16 11:59:01.828145');


--
-- Data for Name: medenidurum; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medenidurum VALUES
	(1, 'Evli'),
	(2, 'Bekar');


--
-- Data for Name: silinenKitaplar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."silinenKitaplar" VALUES
	(12, 'korsanlar', 4, '2021-01-01', 31, 233, '56565'),
	(10, 'ruh', 2, '2019-11-11', 3, 123, '123'),
	(13, 'ASFASF', 4, NULL, 3, 233, '122'),
	(14, '', 2, NULL, 2, 212, '1212'),
	(15, 'KAŞAĞI', 2, NULL, 5, 565, '556'),
	(16, 'OSMAN', 2, '2021-12-15', 5, 656, '464'),
	(17, 'KÜÇÜK PRENS', 4, '2021-12-16', 5, 120, 'B1325'),
	(18, 'CEHENNEM', 2, '1990-12-12', 5, 500, 'R545');


--
-- Data for Name: tbgorev; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbgorev VALUES
	(1, 'Hademe'),
	(2, 'Danışman'),
	(3, 'Müdür');


--
-- Data for Name: tbkisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbkisi VALUES
	(26, 'EREN', 'BEKMEZCI', 'E', 2, 'Üye'),
	(29, 'MEHMET', 'ALI', 'E', 1, 'Personel'),
	(30, 'HAYDAR', 'ALICAN', 'E', 1, 'Personel'),
	(32, 'RABIA NUR', 'ÇAĞLı', 'K', 2, 'Üye'),
	(31, 'SAKINE', 'CAN', 'K', 1, 'Personel'),
	(28, 'ŞEVIN SENA', 'DERE', 'K', 2, 'Üye'),
	(38, 'BURAK', 'KOZLUCA', 'E', 2, 'Üye');


--
-- Data for Name: tbkitap; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbkitap VALUES
	(21, 'KARAMAZOV KARDEŞLER', 4, '1890-12-12', 5, 400, 'R54'),
	(19, 'CEHENNEM', 2, '1990-12-12', 3, 500, 'R546'),
	(22, 'SEFILLER', 4, '1880-12-12', 3, 800, 'R456'),
	(23, 'KÜÇÜK PRENS', 3, '1880-12-12', 5, 200, 'r45645'),
	(20, 'KAŞAĞı', 3, '1987-12-12', 3, 400, 'H54');


--
-- Data for Name: tbodunc; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbodunc VALUES
	(17, 32, 19, '2021-12-16', '2021-12-30'),
	(19, 32, 22, '2021-12-20', '2022-01-05'),
	(20, 38, 20, '2021-12-20', '2022-01-05');


--
-- Data for Name: tbpersonel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbpersonel VALUES
	(29, '2021-12-16', 5000, '65465', 3),
	(31, '2021-12-16', 4000, '46541', 2),
	(30, '2021-12-16', 3700, '46565', 1);


--
-- Data for Name: tbtur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbtur VALUES
	(8, 'roman'),
	(9, 'hkaye'),
	(10, 'prsikiloji-roman'),
	(11, 'Roman'),
	(12, 'hikaye');


--
-- Data for Name: tbuye; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbuye VALUES
	(26, '11111111111'),
	(32, '12312312332'),
	(28, '23423423443'),
	(38, '77777777777');


--
-- Data for Name: tbyayinevi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbyayinevi VALUES
	(2, 'karsiyaka mah.', 'seckin kitabevi'),
	(3, 'serdivan mah.', 'işler kitabevi'),
	(4, 'kızılay', 'ahmet kitabevi');


--
-- Data for Name: tbyazar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbyazar VALUES
	(5, 'dan brown'),
	(6, 'Dan Brown'),
	(7, 'Ömer Seyfettin'),
	(8, 'dostoyevski'),
	(9, 'victor hugo'),
	(10, 'mehmet');


--
-- Name: Gorev_gorevNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Gorev_gorevNo_seq"', 4, true);


--
-- Name: Kisi_kisiNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kisi_kisiNo_seq"', 40, true);


--
-- Name: Kitap_kitapNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kitap_kitapNo_seq"', 23, true);


--
-- Name: Odunc_oduncNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Odunc_oduncNo_seq"', 20, true);


--
-- Name: Tur_turNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tur_turNo_seq"', 12, true);


--
-- Name: Yayinevi_yayinEviNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Yayinevi_yayinEviNo_seq"', 4, true);


--
-- Name: Yazar_yazarNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Yazar_yazarNo_seq"', 10, true);


--
-- Name: ilce_ilceNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ilce_ilceNo_seq"', 32, true);


--
-- Name: iletisimBilgileri_iletisimNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."iletisimBilgileri_iletisimNo_seq"', 24, true);


--
-- Name: kitap_tur_kitap_turNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."kitap_tur_kitap_turNo_seq"', 10, true);


--
-- Name: kitap_yazar_kitap_yazarNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."kitap_yazar_kitap_yazarNo_seq"', 10, true);


--
-- Name: maasDegisimi_kayitNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."maasDegisimi_kayitNo_seq"', 2, true);


--
-- Name: tbkisi KisiPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbkisi
    ADD CONSTRAINT "KisiPK" PRIMARY KEY ("kisiNo");


--
-- Name: tbpersonel PersonelPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbpersonel
    ADD CONSTRAINT "PersonelPK" PRIMARY KEY ("kisiNo");


--
-- Name: tbgorev gorevPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbgorev
    ADD CONSTRAINT "gorevPK" PRIMARY KEY ("gorevNo");


--
-- Name: il ilPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.il
    ADD CONSTRAINT "ilPK" PRIMARY KEY ("ilNo");


--
-- Name: ilce ilcePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT "ilcePK" PRIMARY KEY ("ilceNo");


--
-- Name: iletisim_bilgileri iletisimBilgileriPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iletisim_bilgileri
    ADD CONSTRAINT "iletisimBilgileriPK" PRIMARY KEY ("iletisimNo");


--
-- Name: tbkitap kitapPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbkitap
    ADD CONSTRAINT "kitapPK" PRIMARY KEY ("kitapNo");


--
-- Name: kitap_tur kitap_turPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_tur
    ADD CONSTRAINT "kitap_turPK" PRIMARY KEY ("kitap_turNo");


--
-- Name: kitap_yazar kitap_yazarPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_yazar
    ADD CONSTRAINT "kitap_yazarPK" PRIMARY KEY ("kitap_yazarNo");


--
-- Name: maasDegisimi maasDegisimİPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."maasDegisimi"
    ADD CONSTRAINT "maasDegisimİPK" PRIMARY KEY ("kayitNo");


--
-- Name: medenidurum medeniDurumPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medenidurum
    ADD CONSTRAINT "medeniDurumPK" PRIMARY KEY ("durumNo");


--
-- Name: tbodunc oduncPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbodunc
    ADD CONSTRAINT "oduncPK" PRIMARY KEY ("oduncNo");


--
-- Name: silinenKitaplar silinenKitaplar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."silinenKitaplar"
    ADD CONSTRAINT "silinenKitaplar_pkey" PRIMARY KEY ("kitapNo");


--
-- Name: tbtur turPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbtur
    ADD CONSTRAINT "turPK" PRIMARY KEY ("turNo");


--
-- Name: tbuye unique_tbuye_kimlikNo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbuye
    ADD CONSTRAINT "unique_tbuye_kimlikNo" UNIQUE ("kimlikNo");


--
-- Name: tbuye uyePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbuye
    ADD CONSTRAINT "uyePK" PRIMARY KEY ("kisiNo");


--
-- Name: tbyayinevi yayineviPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbyayinevi
    ADD CONSTRAINT "yayineviPK" PRIMARY KEY ("yayinEviNo");


--
-- Name: tbyazar yazarPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbyazar
    ADD CONSTRAINT "yazarPK" PRIMARY KEY ("yazarNo");


--
-- Name: tbkisi kisiKontrol; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kisiKontrol" BEFORE INSERT OR UPDATE ON public.tbkisi FOR EACH ROW EXECUTE FUNCTION public."kisiEkleTR1"();


--
-- Name: tbkitap kitapKontrol; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kitapKontrol" BEFORE INSERT OR UPDATE ON public.tbkitap FOR EACH ROW EXECUTE FUNCTION public."kitapEkleTR1"();


--
-- Name: tbkitap kitapSilindiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kitapSilindiginde" AFTER DELETE ON public.tbkitap FOR EACH ROW EXECUTE FUNCTION public."SilinenKitapArsiv"();


--
-- Name: tbodunc kitapStokAzalt; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kitapStokAzalt" AFTER INSERT ON public.tbodunc FOR EACH ROW EXECUTE FUNCTION public."kitapStok"();


--
-- Name: tbpersonel maasDegisikligi; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "maasDegisikligi" BEFORE UPDATE ON public.tbpersonel FOR EACH ROW EXECUTE FUNCTION public."maasDegisikligiIzle"();


--
-- Name: tbpersonel PersonelFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbpersonel
    ADD CONSTRAINT "PersonelFK" FOREIGN KEY ("kisiNo") REFERENCES public.tbkisi("kisiNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: iletisim_bilgileri iletisimBilgileriFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iletisim_bilgileri
    ADD CONSTRAINT "iletisimBilgileriFK1" FOREIGN KEY ("kisiNo") REFERENCES public.tbkisi("kisiNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: iletisim_bilgileri iletisimBilgileriFK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iletisim_bilgileri
    ADD CONSTRAINT "iletisimBilgileriFK2" FOREIGN KEY (ilce) REFERENCES public.ilce("ilceNo");


--
-- Name: tbkitap kitapFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbkitap
    ADD CONSTRAINT "kitapFK" FOREIGN KEY ("yayinEvi") REFERENCES public.tbyayinevi("yayinEviNo");


--
-- Name: kitap_yazar kitapFK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_yazar
    ADD CONSTRAINT "kitapFK2" FOREIGN KEY (kitap) REFERENCES public.tbkitap("kitapNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kitap_tur kitapFK3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_tur
    ADD CONSTRAINT "kitapFK3" FOREIGN KEY (kitap) REFERENCES public.tbkitap("kitapNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tbodunc oduncFK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbodunc
    ADD CONSTRAINT "oduncFK1" FOREIGN KEY (uye) REFERENCES public.tbuye("kisiNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tbodunc oduncFK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbodunc
    ADD CONSTRAINT "oduncFK2" FOREIGN KEY (kitap) REFERENCES public.tbkitap("kitapNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tbkisi tbkisiFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbkisi
    ADD CONSTRAINT "tbkisiFK" FOREIGN KEY ("medeniDurumu") REFERENCES public.medenidurum("durumNo");


--
-- Name: kitap_tur turFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_tur
    ADD CONSTRAINT "turFK" FOREIGN KEY (tur) REFERENCES public.tbtur("turNo");


--
-- Name: tbuye uyeFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbuye
    ADD CONSTRAINT "uyeFK" FOREIGN KEY ("kisiNo") REFERENCES public.tbkisi("kisiNo") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kitap_yazar yazarFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_yazar
    ADD CONSTRAINT "yazarFK" FOREIGN KEY (yazar) REFERENCES public.tbyazar("yazarNo");


--
-- PostgreSQL database dump complete
--

