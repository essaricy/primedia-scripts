@echo off

set DB_NAME=%1
set API_PORT=%2
set UI_PORT=%3

if [%DB_NAME%]==[] goto usage
if [%API_PORT%]==[] goto usage
if [%UI_PORT%]==[] goto usage

set API_PROCESS_NAME=PrimediaAPI_%DB_NAME%
set UI_PROCESS_NAME=PrimediaUI_%DB_NAME%
set APP_BASE=G:\Apps\Primedia
set API_DIR=%APP_BASE%\primedia-api
set UI_DIR=%APP_BASE%\primedia-ui
set DATASOURCE=jdbc:postgresql://localhost:5432/%DB_NAME%

FOR /F "tokens=4 delims= " %%i in ('route print ^| find " 0.0.0.0"') do set IP_ADDRESS=%%i
echo IP Address of the machine is %IP_ADDRESS%

:: Start the API
::mvn install -DskipTests
echo Starting API with a window title "%API_PROCESS_NAME%"
start "%API_PROCESS_NAME%" /D %API_DIR% java -jar target\primedia-api-1.0.jar --server.port=%API_PORT% --spring.datasource.url=%DATASOURCE%
for /F "tokens=2" %%a in ('tasklist /NH /FI "WindowTitle eq %API_PROCESS_NAME%"') do set API_PID=%%a
echo Started API process successfully. PID=%API_PID%
echo %API_PID% > %UserProfile%\"%API_PROCESS_NAME%.pid"

:: Start the UI
set PORT=%UI_PORT%
set REACT_APP_API_URL=http://%IP_ADDRESS%:%API_PORT%/
echo Setting the API_URL to %REACT_APP_API_URL%

echo Starting UI with a window title "%UI_PROCESS_NAME%"
start "%UI_PROCESS_NAME%" /D %UI_DIR% npm start
for /F "tokens=2" %%a in ('tasklist /NH /FI "WindowTitle eq Windows PowerShell"') do set UI_PID=%%a
echo Started UI process successfully. PID=%UI_PID%
echo %UI_PID% > %UserProfile%\"%UI_PROCESS_NAME%.pid"

exit /B 0

:usage
@echo Usage: %0 [DB_NAME] [API_PORT] [UI_PORT]
exit /B 1
