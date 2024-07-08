Script Beginning:

@echo off
echo Choose:
echo [A] Set Static IP
echo [B] Set DHCP
echo.
:choice
SET /P C=[A,B]?
for %%? in (A) do if /I "%C%"=="%%?" goto A
for %%? in (B) do if /I "%C%"=="%%?" goto B
goto choice
:A
@echo off
echo "Please enter Static IP Address Information"
echo "Static IP Address:"
set /p IP_Addr=

echo "Default Gateway:"
set /p D_Gate=

echo "Subnet Mask:"
set /p Sub_Mask=

echo "DNS Server preferred:"
set /p DNS1=

echo "DNS Server Alternate:"
set /p DNS2=

echo "Setting Static IP Information"
netsh interface ip set address "Wireless Network Connection" static %IP_Addr% %Sub_Mask% %D_Gate%
netsh interface ip set dns "Wireless Network Connection" static %DNS1%
netsh interface ip add dns name="Wireless Network Connection" %DNS2% index=2

netsh int ip show config
pause
goto end

:B
@ECHO OFF
ECHO Resetting IP Address and Subnet Mask For DHCP
netsh int ip set address name = "Wireless Network Connection" source = dhcp
netsh interface ip set dns "Wireless Network Connection" dhcp

ipconfig /renew

ECHO Here are the new settings for %computername%:
netsh int ip show config

pause
goto end
:end

Script END!