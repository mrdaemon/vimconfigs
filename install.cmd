@echo off
:: Install script for win32 vim files, creates symlinks
:: in the relevant places. Will only work for Windows 6.1 and above
:: (2008, Windows 7) for now. Will tweak it so it may use union
:: or raw file copies later on.

setlocal

set PWD=%~dp0

:: Detect NT-level OS
echo Determining windows version
ver | find "2003" > NUL
IF %ERRORLEVEL% == 0 GOTO copywarn

ver | find "XP" > NUL
IF %ERRORLEVEL% == 0 GOTO copywarn

ver | find "NT" > NUL
IF %ERRORLEVEL% == 0 GOTO copywarn

ver | find "6.1" > NUL 
IF %ERRORLEVEL% == 0 GOTO ver_2008

echo Unkown/unsupported platform. Aborting.
goto DONE

:: Check for existence of a file
:: and ask for deletion if it exists.
:filecheck
echo Checking for existence of %1
if exist %1 CALL :delprompt %1
GOTO :EOF

:: Prompts for deletion, determines if
:: it is a directory or a file, and acts
:: accordingly.
:: Subroutines are easier to do here than
:: branched logic.
:delprompt
echo %1 already exists.
echo Do you wish to delete %1? You won't ever get it back if you modified it.
echo Also, be wary -- if it's a link you may end up deleting the source.
echo If in doubt, abort and delete %1 manually.
set /p ans=[Y/N]
IF /i NOT %ans% EQU Y GOTO :EOF

:: The dirtiest, ugliest cmd scripting hack ever.
:: Devices exist in directories.
if exist %1\NUL (rmdir /q /s %1) else (del /q %1)
echo Deleted %i.
GOTO :EOF

:ver_2008
echo Found windows 7/2008.
echo Checking for mklink availablily...
mklink 2> NUL
if %ERRORLEVEL% == 1 (GOTO do_mklink) else (GOTO copywarn)

:mklinkerr
echo Encoutered error during mklink:
echo %~1
GOTO :EOF

:do_mklink
call :filecheck %USERPROFILE%\vimfiles
call :filecheck %USERPROFILE%\_vimrc

mklink /D %USERPROFILE%\vimfiles %PWD%\.vim
IF %ERRORLEVEL% GEQ 1 CALL :mklinkerr "Unable to link vimfiles directory!"
mklink %USERPROFILE%\_vimrc %PWD%\.vimrc
IF %ERRORLEVEL% GEQ 1 CALL :mklinkerr "Unable to link _vimrc!"
GOTO :DONE

:copywarn
echo mklink not supported on your platform:
ver
echo Copies currently unimplemented. Sorry.
GOTO :DONE

:DONE
echo So long and thanks for all the shoes.
pause

endlocal













