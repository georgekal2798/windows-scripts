@echo off

set source=%HOMEPATH%
set target="D:\Windows Backup"
set foldersList=Documents Music Pictures Videos
set timestamp=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%__%TIME:~0,2%-%TIME:~3,2%
set timestamp=%timestamp: =0%
if not exist %target%\Logs mkdir %target%\Logs > nul
set logFile=%target%\Logs\backup_log_%timestamp%.txt

echo Backup started at %DATE% %TIME%
echo Backup started at %DATE% %TIME% >> %logFile%
for %%f in (%foldersList%) do (
    echo Backing up %%f
    echo Backing up %%f >> %logFile%
    xcopy %source%\%%f %target%\%%f /e /s /i /d /y
)
echo Backup finished successfully at %DATE% %TIME%
echo Backup finished successfully at %DATE% %TIME% >> %logFile%
pause