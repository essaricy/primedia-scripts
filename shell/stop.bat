@echo off

set DB_NAME=%1

if [%DB_NAME%]==[] goto usage

echo Stopping UI process with PID %UI_PID%
set /p UI_PID=<%UserProfile%\"PrimediaUI_%DB_NAME%.pid"
taskkill /F /PID %UI_PID%
echo Stopped UI process successfully

echo Stopping API process with PID %API_PID%
set /p API_PID=<%UserProfile%\"PrimediaAPI_%DB_NAME%.pid"
taskkill /F /PID %API_PID%
echo Stopped API process successfully

:usage
@echo Usage: %0 [DB_NAME]
exit /B 1
