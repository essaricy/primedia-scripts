DO
$body$
BEGIN
  IF NOT EXISTS (
    SELECT *
  FROM pg_catalog.pg_user
  WHERE usename = 'java_webservice_user')
  THEN
  CREATE USER java_webservice_user
  WITH PASSWORD 'MXEPqkpBEBSfD8RrjZchxDj7FwRy9qc8';
RAISE INFO 'Created User "java_webservice_user"';
END
IF;
END
$body$
