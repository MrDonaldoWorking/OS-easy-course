mkdir C:\OS\6
ver > C:\OS\6\ver.txt

wmic os get FreePhysicalMemory, TotalVisibleMemorySize > C:\OS\6\memory.txt

fsutil fsinfo drives > C:\OS\6\drivers.txt

mkdir C:\TEST
xcopy C:\OS\6 C:\TEST /I /Y
copy C:\OS\6\ver.txt + C:\OS\6\memory.txt + C:\OS\6\drivers.txt info.log /Y

rd /Q /S C:\TEST
erase *.txt

find /V "" C:\OS\6\i.bat