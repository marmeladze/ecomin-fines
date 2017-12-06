--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
    AS integer
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
    AS integer
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
    AS integer
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
    AS integer
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
    AS integer
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
    AS integer
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
    AS integer
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
    AS integer
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
-- Name: reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE reports (
    id integer NOT NULL,
    tree_id integer,
    classification_id integer,
    region_id integer,
    forestry_id integer,
    detour_id integer,
    quarter_id integer,
    tariff_id integer,
    diameter integer,
    material_count integer,
    semi_material_count integer,
    combustible_count integer,
    material_large_volume numeric(5,3) DEFAULT 0.0,
    material_mid_volume numeric(5,3) DEFAULT 0.0,
    material_small_volume numeric(5,3) DEFAULT 0.0,
    combustible_volume numeric(5,3) DEFAULT 0.0,
    garbage_volume numeric(5,3) DEFAULT 0.0,
    umbrella_volume numeric(5,3) DEFAULT 0.0,
    material_large_price numeric(5,2) DEFAULT 0.0,
    material_mid_price numeric(5,2) DEFAULT 0.0,
    material_small_price numeric(5,3) DEFAULT 0.0,
    combustible_price numeric(5,3) DEFAULT 0.0,
    garbage_price numeric(5,3) DEFAULT 0.0,
    umbrella_price numeric(5,3) DEFAULT 0.0,
    user_id integer,
    verbatim character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reports_id_seq OWNED BY reports.id;


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
    AS integer
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
    AS integer
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
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: classifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY classifications ALTER COLUMN id SET DEFAULT nextval('classifications_id_seq'::regclass);


--
-- Name: compensation_rates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY compensation_rates ALTER COLUMN id SET DEFAULT nextval('compensation_rates_id_seq'::regclass);


--
-- Name: detours id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY detours ALTER COLUMN id SET DEFAULT nextval('detours_id_seq'::regclass);


--
-- Name: forestries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY forestries ALTER COLUMN id SET DEFAULT nextval('forestries_id_seq'::regclass);


--
-- Name: height_ranges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY height_ranges ALTER COLUMN id SET DEFAULT nextval('height_ranges_id_seq'::regclass);


--
-- Name: material_volumes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_volumes ALTER COLUMN id SET DEFAULT nextval('material_volumes_id_seq'::regclass);


--
-- Name: quarters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY quarters ALTER COLUMN id SET DEFAULT nextval('quarters_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq'::regclass);


--
-- Name: tariffs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tariffs ALTER COLUMN id SET DEFAULT nextval('tariffs_id_seq'::regclass);


--
-- Name: trees id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY trees ALTER COLUMN id SET DEFAULT nextval('trees_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: classifications classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY classifications
    ADD CONSTRAINT classifications_pkey PRIMARY KEY (id);


--
-- Name: compensation_rates compensation_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compensation_rates
    ADD CONSTRAINT compensation_rates_pkey PRIMARY KEY (id);


--
-- Name: detours detours_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detours
    ADD CONSTRAINT detours_pkey PRIMARY KEY (id);


--
-- Name: forestries forestries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forestries
    ADD CONSTRAINT forestries_pkey PRIMARY KEY (id);


--
-- Name: height_ranges height_ranges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY height_ranges
    ADD CONSTRAINT height_ranges_pkey PRIMARY KEY (id);


--
-- Name: material_volumes material_volumes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_volumes
    ADD CONSTRAINT material_volumes_pkey PRIMARY KEY (id);


--
-- Name: quarters quarters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quarters
    ADD CONSTRAINT quarters_pkey PRIMARY KEY (id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: tariffs tariffs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tariffs
    ADD CONSTRAINT tariffs_pkey PRIMARY KEY (id);


--
-- Name: trees trees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trees
    ADD CONSTRAINT trees_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


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
-- Name: index_reports_on_classification_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_classification_id ON reports USING btree (classification_id);


--
-- Name: index_reports_on_detour_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_detour_id ON reports USING btree (detour_id);


--
-- Name: index_reports_on_forestry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_forestry_id ON reports USING btree (forestry_id);


--
-- Name: index_reports_on_quarter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_quarter_id ON reports USING btree (quarter_id);


--
-- Name: index_reports_on_region_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_region_id ON reports USING btree (region_id);


--
-- Name: index_reports_on_tariff_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_tariff_id ON reports USING btree (tariff_id);


--
-- Name: index_reports_on_tree_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_tree_id ON reports USING btree (tree_id);


--
-- Name: index_reports_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_user_id ON reports USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: height_ranges fk_rails_2ce8d43673; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY height_ranges
    ADD CONSTRAINT fk_rails_2ce8d43673 FOREIGN KEY (tree_id) REFERENCES trees(id);


--
-- Name: material_volumes fk_rails_3338fc3b75; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_volumes
    ADD CONSTRAINT fk_rails_3338fc3b75 FOREIGN KEY (tree_id) REFERENCES trees(id);


--
-- Name: reports fk_rails_346ee1561c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_rails_346ee1561c FOREIGN KEY (region_id) REFERENCES regions(id);


--
-- Name: reports fk_rails_3ea264fed8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_rails_3ea264fed8 FOREIGN KEY (detour_id) REFERENCES detours(id);


--
-- Name: reports fk_rails_45f21ffa46; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_rails_45f21ffa46 FOREIGN KEY (forestry_id) REFERENCES forestries(id);


--
-- Name: reports fk_rails_4d3c12c92a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_rails_4d3c12c92a FOREIGN KEY (quarter_id) REFERENCES quarters(id);


--
-- Name: height_ranges fk_rails_4e97d4c24c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY height_ranges
    ADD CONSTRAINT fk_rails_4e97d4c24c FOREIGN KEY (classification_id) REFERENCES classifications(id);


--
-- Name: reports fk_rails_557560b62e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_rails_557560b62e FOREIGN KEY (tariff_id) REFERENCES tariffs(id);


--
-- Name: compensation_rates fk_rails_5f9f2389e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY compensation_rates
    ADD CONSTRAINT fk_rails_5f9f2389e4 FOREIGN KEY (tree_id) REFERENCES trees(id);


--
-- Name: material_volumes fk_rails_71ce1babf4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material_volumes
    ADD CONSTRAINT fk_rails_71ce1babf4 FOREIGN KEY (classification_id) REFERENCES classifications(id);


--
-- Name: detours fk_rails_96fee696bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detours
    ADD CONSTRAINT fk_rails_96fee696bd FOREIGN KEY (forestry_id) REFERENCES forestries(id);


--
-- Name: reports fk_rails_ba266b8108; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_rails_ba266b8108 FOREIGN KEY (classification_id) REFERENCES classifications(id);


--
-- Name: reports fk_rails_c7699d537d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_rails_c7699d537d FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: quarters fk_rails_c9209bd54c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quarters
    ADD CONSTRAINT fk_rails_c9209bd54c FOREIGN KEY (detour_id) REFERENCES detours(id);


--
-- Name: forestries fk_rails_e472ea8693; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY forestries
    ADD CONSTRAINT fk_rails_e472ea8693 FOREIGN KEY (region_id) REFERENCES regions(id);


--
-- Name: reports fk_rails_eef933989f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY reports
    ADD CONSTRAINT fk_rails_eef933989f FOREIGN KEY (tree_id) REFERENCES trees(id);


--
-- Name: compensation_rates fk_rails_fc72f3e9e8; Type: FK CONSTRAINT; Schema: public; Owner: -
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

INSERT INTO schema_migrations (version) VALUES ('20171205132252');

INSERT INTO schema_migrations (version) VALUES ('20171205132355');

INSERT INTO schema_migrations (version) VALUES ('20171205182627');

INSERT INTO schema_migrations (version) VALUES ('20171205183204');

