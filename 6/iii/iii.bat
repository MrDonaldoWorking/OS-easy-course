@echo off
rem NET: https://ab57.ru/cmdlist/net.html
rem SC: https://ab57.ru/cmdlist/sc.html

SC QUERY type= service > "oldServices.log"

SC STOP dnscache
timeout 5

SC QUERY type= service > "newServices.log"
rem /A - Вывод только первой и последней строк для каждой группы различий.
FC "newServices.log" "oldServices.log"

SC START dnscache
rem net stop DNS-client

find /V "rem" C:\OS\6\iii.bat | findstr /virc:"^$"