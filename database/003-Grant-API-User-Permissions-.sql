-- ###############################################################################################
-- REMOVE ALL PUBLIC ACCCESS
-- ###############################################################################################
REVOKE CONNECT ON DATABASE myvid FROM public;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM public;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM public;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA public FROM public;

-- ###############################################################################################
-- REMOVE ALL USER ACCCESS
-- ###############################################################################################
REVOKE CONNECT ON DATABASE myvid FROM myvid_api;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM myvid_api;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM myvid_api;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA public FROM myvid_api;

-- ###############################################################################################
-- CHANGE OWNER TO POSTGRES
-- ###############################################################################################
ALTER DATABASE myvid OWNER TO postgres;
GRANT ALL ON DATABASE myvid TO postgres
WITH
GRANT OPTION;

GRANT ALL ON ALL TABLES IN SCHEMA public TO postgres
WITH
GRANT OPTION;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO postgres
WITH
GRANT OPTION;
GRANT ALL ON ALL FUNCTIONS IN SCHEMA public TO postgres
WITH
GRANT OPTION;

ALTER DEFAULT PRIVILEGES
GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES
GRANT USAGE, SELECT ON SEQUENCES TO postgres WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES
GRANT EXECUTE ON FUNCTIONS TO postgres WITH GRANT OPTION;

-- ###############################################################################################
-- GRANTS TO APPLICATION USER
-- ###############################################################################################
GRANT CONNECT ON DATABASE myvid TO myvid_api;

GRANT TRIGGER, REFERENCES, DELETE, UPDATE, SELECT, INSERT ON ALL TABLES IN SCHEMA public TO myvid_api;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO myvid_api;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO myvid_api;

ALTER DEFAULT PRIVILEGES
GRANT TRIGGER, REFERENCES, DELETE, UPDATE, SELECT, INSERT ON TABLES TO myvid_api;
ALTER DEFAULT PRIVILEGES
GRANT USAGE, SELECT ON SEQUENCES TO myvid_api;
ALTER DEFAULT PRIVILEGES
GRANT EXECUTE ON FUNCTIONS TO myvid_api;
