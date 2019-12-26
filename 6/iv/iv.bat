@echo off

driverquery /FO table /NH > "DRIVERS"

sort /+14 /R "DRIVERS"

find /V "rem" iv.bat | findstr /virc:"^$"