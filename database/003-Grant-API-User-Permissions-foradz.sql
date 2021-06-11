-- ###############################################################################################
-- REMOVE ALL PUBLIC ACCCESS
-- ###############################################################################################
REVOKE CONNECT ON DATABASE foradz FROM public;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM public;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM public;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA public FROM public;

-- ###############################################################################################
-- REMOVE ALL USER ACCCESS
-- ###############################################################################################
REVOKE CONNECT ON DATABASE foradz FROM java_webservice_user;
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM java_webservice_user;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA public FROM java_webservice_user;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA public FROM java_webservice_user;

-- ###############################################################################################
-- CHANGE OWNER TO POSTGRES
-- ###############################################################################################
ALTER DATABASE foradz OWNER TO postgres;
GRANT ALL ON DATABASE foradz TO postgres
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
GRANT CONNECT ON DATABASE foradz TO java_webservice_user;

GRANT TRIGGER, REFERENCES, DELETE, UPDATE, SELECT, INSERT ON ALL TABLES IN SCHEMA public TO java_webservice_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO java_webservice_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO java_webservice_user;

ALTER DEFAULT PRIVILEGES
GRANT TRIGGER, REFERENCES, DELETE, UPDATE, SELECT, INSERT ON TABLES TO java_webservice_user;
ALTER DEFAULT PRIVILEGES
GRANT USAGE, SELECT ON SEQUENCES TO java_webservice_user;
ALTER DEFAULT PRIVILEGES
GRANT EXECUTE ON FUNCTIONS TO java_webservice_user;
