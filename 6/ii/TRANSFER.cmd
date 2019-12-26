for /F %%F in ('dir C:\OS\6\ii\cd /B') do (
  xcopy C:\OS\6\ii\cd\%%F \\srv-x\cd /YZ
)