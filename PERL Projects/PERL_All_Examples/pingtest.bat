@echo off
FOR /F %%i IN (hostnames.txt) DO (
	echo Checking %%i
	ping -n 4 %%i | find "TTL"
	if not errorlevel 1 set error=success
	if errorlevel 1 set error=FAIL
	echo Result: %error%
	echo -----------------------------------------------
)