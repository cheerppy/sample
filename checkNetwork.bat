@echo off
echo.
echo Please wait for checking network...


:loop
echo.
ping yahoo.co.jp>nul && goto CONNECT
ping google.co.jp>nul && goto CONNECT

echo Network is unnavailable. Wi-Fi will be rebooted soon.
goto :reboot


:reboot
powershell Restart-NetAdapter -Name Wi-Fi
echo "reconnected"
echo wait a minute.

timeout /t 7 /nobreak >nul
timeout /t 15
goto :loop


:CONNECT
echo network is already available.
echo.
choice /T 10 /D n /M "force to reboot?"
if "%errorlevel%"=="1" goto :reboot

exit



