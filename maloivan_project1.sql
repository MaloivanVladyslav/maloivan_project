--
-- PostgreSQL database dump
--

\restrict DxPiP76vis9hbXeXeaFXm1BRPYTauJvaSCLf7kQgaU0ppCUtqykQtUYxsM6p3GG

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-20 04:02:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 16786)
-- Name: friendship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendship (
    "user_id1,user_id2" integer NOT NULL,
    status character varying(20) NOT NULL,
    date date NOT NULL,
    user_id1 integer NOT NULL,
    user_id2 integer NOT NULL
);


ALTER TABLE public.friendship OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16796)
-- Name: health metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."health metrics" (
    metrics_id integer NOT NULL,
    steps integer NOT NULL,
    pulse integer NOT NULL,
    calories integer NOT NULL,
    measurement_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    workout_id integer NOT NULL
);


ALTER TABLE public."health metrics" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16781)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    date_registration timestamp with time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16791)
-- Name: workout; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workout (
    workout_id integer NOT NULL,
    type_workout character varying(50) NOT NULL,
    date date NOT NULL,
    "time" time with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.workout OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 16786)
-- Dependencies: 218
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendship ("user_id1,user_id2", status, date, user_id1, user_id2) FROM stdin;
3	confirmed	2024-02-18	2	3
2	wait	2024-02-15	1	3
1	confirmed	2024-02-10	1	2
\.


--
-- TOC entry 4919 (class 0 OID 16796)
-- Dependencies: 220
-- Data for Name: health metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."health metrics" (metrics_id, steps, pulse, calories, measurement_date, user_id, workout_id) FROM stdin;
3	4000	100	200	2024-02-23 09:00:00+03	1	3
2	7500	140	450	2024-02-22 19:10:00+03	2	2
1	5000	120	300	2024-02-21 08:15:00+03	1	1
\.


--
-- TOC entry 4916 (class 0 OID 16781)
-- Dependencies: 217
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (user_id, first_name, last_name, email, phone, date_registration) FROM stdin;
3	Oleg	Sydorenko	oleg.sydorenko@gmail.com	+380991234111	2024-02-20 20:00:00+03
2	Maria	Kovalenko	maria.kovalenko@gmail.com	+380631112233	2024-02-01 09:15:00+03
1	Ivan	Petrenko	ivan.petrenko@gmail.com	+380671234567	2024-01-15 10:30:00+03
\.


--
-- TOC entry 4918 (class 0 OID 16791)
-- Dependencies: 219
-- Data for Name: workout; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workout (workout_id, type_workout, date, "time", user_id) FROM stdin;
3	Yoga	2024-02-23	08:15:00+03	1
2	Strength exercises	2024-02-22	18:00:00+03	2
1	Run	2024-02-21	07:30:00+03	1
\.


--
-- TOC entry 4756 (class 2606 OID 16790)
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY ("user_id1,user_id2");


--
-- TOC entry 4760 (class 2606 OID 16800)
-- Name: health metrics health metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."health metrics"
    ADD CONSTRAINT "health metrics_pkey" PRIMARY KEY (metrics_id);


--
-- TOC entry 4754 (class 2606 OID 16785)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4758 (class 2606 OID 16795)
-- Name: workout workout_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workout
    ADD CONSTRAINT workout_pkey PRIMARY KEY (workout_id);


--
-- TOC entry 4761 (class 2606 OID 16801)
-- Name: friendship friendship_user_id1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_user_id1_fkey FOREIGN KEY (user_id1) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 4762 (class 2606 OID 16826)
-- Name: friendship friendship_user_id1_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_user_id1_fkey1 FOREIGN KEY (user_id1) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 4763 (class 2606 OID 16806)
-- Name: friendship friendship_user_id2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_user_id2_fkey FOREIGN KEY (user_id2) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 4764 (class 2606 OID 16831)
-- Name: friendship friendship_user_id2_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_user_id2_fkey1 FOREIGN KEY (user_id2) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 4767 (class 2606 OID 16816)
-- Name: health metrics health metrics_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."health metrics"
    ADD CONSTRAINT "health metrics_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 4768 (class 2606 OID 16841)
-- Name: health metrics health metrics_user_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."health metrics"
    ADD CONSTRAINT "health metrics_user_id_fkey1" FOREIGN KEY (user_id) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 4769 (class 2606 OID 16821)
-- Name: health metrics health metrics_workout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."health metrics"
    ADD CONSTRAINT "health metrics_workout_id_fkey" FOREIGN KEY (workout_id) REFERENCES public.workout(workout_id) NOT VALID;


--
-- TOC entry 4770 (class 2606 OID 16846)
-- Name: health metrics health metrics_workout_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."health metrics"
    ADD CONSTRAINT "health metrics_workout_id_fkey1" FOREIGN KEY (workout_id) REFERENCES public.workout(workout_id) NOT VALID;


--
-- TOC entry 4765 (class 2606 OID 16811)
-- Name: workout workout_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workout
    ADD CONSTRAINT workout_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 4766 (class 2606 OID 16836)
-- Name: workout workout_user_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workout
    ADD CONSTRAINT workout_user_id_fkey1 FOREIGN KEY (user_id) REFERENCES public."user"(user_id) NOT VALID;


-- Completed on 2025-09-20 04:02:58

--
-- PostgreSQL database dump complete
--

\unrestrict DxPiP76vis9hbXeXeaFXm1BRPYTauJvaSCLf7kQgaU0ppCUtqykQtUYxsM6p3GG

