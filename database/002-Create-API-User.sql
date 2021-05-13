DO
$body$
BEGIN
  IF NOT EXISTS (
    SELECT *
  FROM pg_catalog.pg_user
  WHERE  usename = 'myvid_api')
  THEN
  CREATE USER myvid_api
  WITH PASSWORD 'MXEPqkpBEBSfD8RrjZchxDj7FwRy9qc8';
RAISE INFO 'Created User "quasared_api"';
END
IF;
END
$body$
