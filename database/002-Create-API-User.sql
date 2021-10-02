-- Name should contains the dot, don't ask me why 
set cred.name to :username;
show cred.name; -- Check that the value was assigned

DO
$body$
DECLARE
  name text := current_setting('cred.name');
BEGIN
  IF NOT EXISTS (
    SELECT * FROM pg_catalog.pg_user WHERE usename = name)
  THEN
    CREATE USER name WITH PASSWORD 'MXEPqkpBEBSfD8RrjZchxDj7FwRy9qc8';
  RAISE INFO 'Created User name';
END
IF;
END
$body$
