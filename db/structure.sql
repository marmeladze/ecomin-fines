--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: classifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE classifications (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE classifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE classifications_id_seq OWNED BY classifications.id;


--
-- Name: compensation_rates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE compensation_rates (
    id integer NOT NULL,
    tree_id integer,
    large_price numeric(5,2) DEFAULT 0.0,
    mid_price numeric(5,2) DEFAULT 0.0,
    small_price numeric(5,2) DEFAULT 0.0,
    combustible_price numeric(5,2) DEFAULT 0.0,
    garbage_price numeric(5,2) DEFAULT 0.0,
    umbrella_price numeric(5,2) DEFAULT 0.0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tariff_id integer
);


--
-- Name: compensation_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE compensation_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: compensation_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE compensation_rates_id_seq OWNED BY compensation_rates.id;


--
-- Name: detours; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE detours (
    id integer NOT NULL,
    name character varying,
    description text,
    forestry_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: detours_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE detours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE detours_id_seq OWNED BY detours.id;


--
-- Name: forestries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE forestries (
    id integer NOT NULL,
    name character varying,
    description text,
    region_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: forestries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE forestries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: forestries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE forestries_id_seq OWNED BY forestries.id;


--
-- Name: height_ranges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE height_ranges (
    id integer NOT NULL,
    classification_id integer,
    tree_id integer,
    h_range numrange,
    diameter integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: height_ranges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE height_ranges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: height_ranges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE height_ranges_id_seq OWNED BY height_ranges.id;


--
-- Name: material_volumes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE material_volumes (
    id integer NOT NULL,
    classification_id integer,
    tree_id integer,
    diameter integer,
    large numeric(5,3) DEFAULT 0.0,
    mid numeric(5,3) DEFAULT 0.0,
    small numeric(5,3) DEFAULT 0.0,
    combustible numeric(5,3) DEFAULT 0.0,
    garbage numeric(5,3) DEFAULT 0.0,
    umbrella numeric(5,3) DEFAULT 0.0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: material_volumes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE material_volumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: material_volumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE material_volumes_id_seq OWNED BY material_volumes.id;


--
-- Name: quarters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE quarters (
    id integer NOT NULL,
    name character varying,
    lat character varying,
    lng character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    detour_id integer
);


--
-- Name: quarters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quarters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quarters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE quarters_id_seq OWNED BY quarters.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE regions (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: tariffs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tariffs (
    id integer NOT NULL,
    name character varying,
    distance numrange,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trees (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: searches; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW searches AS
 SELECT trees.name AS tree_name,
    trees.id AS tree_id,
    classifications.name AS classification_name,
    classifications.id AS classification_id,
    tariffs.name AS tariff_rate,
    tariffs.id AS tariff_id,
    material_volumes.diameter,
    material_volumes.large,
    material_volumes.mid,
    material_volumes.small,
    ((material_volumes.large + material_volumes.mid) + material_volumes.small) AS tech_sum,
    material_volumes.combustible,
    material_volumes.umbrella,
    material_volumes.garbage,
    compensation_rates.large_price,
    compensation_rates.mid_price,
    compensation_rates.small_price,
    compensation_rates.combustible_price,
    compensation_rates.garbage_price,
    compensation_rates.umbrella_price,
    (compensation_rates.large_price * material_volumes.large) AS material_large,
    (compensation_rates.mid_price * material_volumes.mid) AS material_mid,
    (compensation_rates.small_price * material_volumes.small) AS material_small,
    (compensation_rates.combustible_price * material_volumes.combustible) AS material_combustible,
    (compensation_rates.garbage_price * material_volumes.garbage) AS material_garbage,
    (compensation_rates.umbrella_price * material_volumes.umbrella) AS material_umbrella
   FROM ((((material_volumes
     JOIN trees ON ((material_volumes.tree_id = trees.id)))
     JOIN classifications ON ((material_volumes.classification_id = classifications.id)))
     JOIN compensation_rates ON ((compensation_rates.tree_id = trees.id)))
     JOIN tariffs ON ((compensation_rates.tariff_id = tariffs.id)));


--
-- Name: tariffs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tariffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tariffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tariffs_id_seq OWNED BY tariffs.id;


--
-- Name: trees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trees_id_seq OWNED BY trees.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY classifications ALTER COLUMN id SET DEFAULT nextval('classifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY compensation_rates ALTER COLUMN id SET DEFAULT nextval('compensation_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY detours ALTER COLUMN id SET DEFAULT nextval('detours_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY forestries ALTER COLUMN id SET DEFAULT nextval('forestries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY height_ranges ALTER COLUMN id SET DEFAULT nextval('height_ranges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_volumes ALTER COLUMN id SET DEFAULT nextval('material_volumes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY quarters ALTER COLUMN id SET DEFAULT nextval('quarters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tariffs ALTER COLUMN id SET DEFAULT nextval('tariffs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY trees ALTER COLUMN id SET DEFAULT nextval('trees_id_seq'::regclass);


--
-- Name: classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY classifications
    ADD CONSTRAINT classifications_pkey PRIMARY KEY (id);


--
-- Name: compensation_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compensation_rates
    ADD CONSTRAINT compensation_rates_pkey PRIMARY KEY (id);


--
-- Name: detours_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detours
    ADD CONSTRAINT detours_pkey PRIMARY KEY (id);


--
-- Name: forestries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forestries
    ADD CONSTRAINT forestries_pkey PRIMARY KEY (id);


--
-- Name: height_ranges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY height_ranges
    ADD CONSTRAINT height_ranges_pkey PRIMARY KEY (id);


--
-- Name: material_volumes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_volumes
    ADD CONSTRAINT material_volumes_pkey PRIMARY KEY (id);


--
-- Name: quarters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quarters
    ADD CONSTRAINT quarters_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: tariffs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tariffs
    ADD CONSTRAINT tariffs_pkey PRIMARY KEY (id);


--
-- Name: trees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trees
    ADD CONSTRAINT trees_pkey PRIMARY KEY (id);


--
-- Name: index_compensation_rates_on_tariff_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_compensation_rates_on_tariff_id ON compensation_rates USING btree (tariff_id);


--
-- Name: index_compensation_rates_on_tree_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_compensation_rates_on_tree_id ON compensation_rates USING btree (tree_id);


--
-- Name: index_detours_on_forestry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detours_on_forestry_id ON detours USING btree (forestry_id);


--
-- Name: index_forestries_on_region_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_forestries_on_region_id ON forestries USING btree (region_id);


--
-- Name: index_height_ranges_on_classification_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_height_ranges_on_classification_id ON height_ranges USING btree (classification_id);


--
-- Name: index_height_ranges_on_tree_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_height_ranges_on_tree_id ON height_ranges USING btree (tree_id);


--
-- Name: index_material_volumes_on_classification_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_material_volumes_on_classification_id ON material_volumes USING btree (classification_id);


--
-- Name: index_material_volumes_on_tree_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_material_volumes_on_tree_id ON material_volumes USING btree (tree_id);


--
-- Name: index_quarters_on_detour_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quarters_on_detour_id ON quarters USING btree (detour_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_2ce8d43673; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY height_ranges
    ADD CONSTRAINT fk_rails_2ce8d43673 FOREIGN KEY (tree_id) REFERENCES trees(id);


--
-- Name: fk_rails_3338fc3b75; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_volumes
    ADD CONSTRAINT fk_rails_3338fc3b75 FOREIGN KEY (tree_id) REFERENCES trees(id);


--
-- Name: fk_rails_4e97d4c24c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY height_ranges
    ADD CONSTRAINT fk_rails_4e97d4c24c FOREIGN KEY (classification_id) REFERENCES classifications(id);


--
-- Name: fk_rails_5f9f2389e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compensation_rates
    ADD CONSTRAINT fk_rails_5f9f2389e4 FOREIGN KEY (tree_id) REFERENCES trees(id);


--
-- Name: fk_rails_71ce1babf4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_volumes
    ADD CONSTRAINT fk_rails_71ce1babf4 FOREIGN KEY (classification_id) REFERENCES classifications(id);


--
-- Name: fk_rails_96fee696bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detours
    ADD CONSTRAINT fk_rails_96fee696bd FOREIGN KEY (forestry_id) REFERENCES forestries(id);


--
-- Name: fk_rails_c9209bd54c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quarters
    ADD CONSTRAINT fk_rails_c9209bd54c FOREIGN KEY (detour_id) REFERENCES detours(id);


--
-- Name: fk_rails_e472ea8693; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forestries
    ADD CONSTRAINT fk_rails_e472ea8693 FOREIGN KEY (region_id) REFERENCES regions(id);


--
-- Name: fk_rails_fc72f3e9e8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compensation_rates
    ADD CONSTRAINT fk_rails_fc72f3e9e8 FOREIGN KEY (tariff_id) REFERENCES tariffs(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20171008122122');

INSERT INTO schema_migrations (version) VALUES ('20171008122321');

INSERT INTO schema_migrations (version) VALUES ('20171008122349');

INSERT INTO schema_migrations (version) VALUES ('20171008122543');

INSERT INTO schema_migrations (version) VALUES ('20171008122620');

INSERT INTO schema_migrations (version) VALUES ('20171008125633');

INSERT INTO schema_migrations (version) VALUES ('20171008130003');

INSERT INTO schema_migrations (version) VALUES ('20171008130543');

INSERT INTO schema_migrations (version) VALUES ('20171009134749');

INSERT INTO schema_migrations (version) VALUES ('20171010171526');

INSERT INTO schema_migrations (version) VALUES ('20171010173452');

INSERT INTO schema_migrations (version) VALUES ('20171026163952');

INSERT INTO schema_migrations (version) VALUES ('20171026164034');

INSERT INTO schema_migrations (version) VALUES ('20171113095158');
