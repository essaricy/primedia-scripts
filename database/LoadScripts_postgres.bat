echo off

set PGSQL_PATH=F:\Program Files\PostgreSQL\13\bin

:: postgres path and options
set PATH=%PATH%;%PGSQL_PATH%
set DB_NAME=%1
set DB_HOST=localhost
set DB_PORT=5432
set POSTGRES_USER=postgres
set API_USER_NAME=java_webservice_user

if "%DB_NAME%"=="" exit /b 1;

::echo -----------------------------------------------------------------------------------
::echo CREATING DATABASE '%DB_NAME%'
::echo -----------------------------------------------------------------------------------
::dropdb --echo --force 	--host=%DB_HOST% --port=%DB_PORT% --username=%POSTGRES_USER% "%DB_NAME%"
::createdb --echo 		--host=%DB_HOST% --port=%DB_PORT% --username=%POSTGRES_USER% "%DB_NAME%"
::echo Database '%DB_NAME%' is created.

echo -----------------------------------------------------------------------------------
echo CREATING USER '%API_USER_NAME%'
echo -----------------------------------------------------------------------------------
psql -v username=%API_USER_NAME% -f 002-Create-API-User.sql --host=%DB_HOST% --port=%DB_PORT% --username=%POSTGRES_USER% "%DB_NAME%"

echo -----------------------------------------------------------------------------------
echo CREATING USER '%API_USER_NAME%'
echo -----------------------------------------------------------------------------------

echo ----------------------------------------------------------
echo DATABASE CREATION SCRIPTS FOR '%DB_NAME%' HAVE BEEN COMPLETED SUCCESSFULLY.
