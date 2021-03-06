--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19 (Ubuntu 10.19-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.19 (Ubuntu 10.19-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: mikeokoth
--

CREATE TABLE public.addresses (
    id uuid NOT NULL,
    street character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    zip character varying(255) NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO mikeokoth;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: mikeokoth
--

CREATE TABLE public.blogs (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    body character varying(255) NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO mikeokoth;

--
-- Name: blogs_tags; Type: TABLE; Schema: public; Owner: mikeokoth
--

CREATE TABLE public.blogs_tags (
    id uuid NOT NULL,
    blog_id uuid NOT NULL,
    tag_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.blogs_tags OWNER TO mikeokoth;

--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: mikeokoth
--

CREATE TABLE public.schema_migration (
    version character varying(14) NOT NULL
);


ALTER TABLE public.schema_migration OWNER TO mikeokoth;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: mikeokoth
--

CREATE TABLE public.tags (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO mikeokoth;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mikeokoth
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    age integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO mikeokoth;

--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: mikeokoth
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: mikeokoth
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: blogs_tags blogs_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: mikeokoth
--

ALTER TABLE ONLY public.blogs_tags
    ADD CONSTRAINT blogs_tags_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: mikeokoth
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mikeokoth
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: schema_migration_version_idx; Type: INDEX; Schema: public; Owner: mikeokoth
--

CREATE UNIQUE INDEX schema_migration_version_idx ON public.schema_migration USING btree (version);


--
-- Name: addresses addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikeokoth
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: blogs_tags blogs_tags_blog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikeokoth
--

ALTER TABLE ONLY public.blogs_tags
    ADD CONSTRAINT blogs_tags_blog_id_fkey FOREIGN KEY (blog_id) REFERENCES public.blogs(id);


--
-- Name: blogs_tags blogs_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikeokoth
--

ALTER TABLE ONLY public.blogs_tags
    ADD CONSTRAINT blogs_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: blogs blogs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mikeokoth
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

