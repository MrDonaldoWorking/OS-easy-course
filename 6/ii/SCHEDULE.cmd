rem echo %time%
set h=%time:~0,2%
rem echo %h%
set /a m=%time:~3,2%+1
rem echo %m%
set /a to_add=%m%/60
rem echo %to_add%
set /a m=%m%%%60
rem echo %m%
set /a h=(h+to_add)%%24
rem echo %h%

at %h%":"%m%":"%time:~6,2% /INTERACTIVE cmd /C start C:\OS\6\ii\TRANSFER.cmd
