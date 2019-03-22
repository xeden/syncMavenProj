@echo off

set bck-portal-logging=C:\Users\C20573\BEWorkspace\bck-portal-logging
set bck-configurations=C:\Users\C20573\BEWorkspace\bck-configurations
set bck-accounts=C:\Users\C20573\BEWorkspace\bck-accounts
set bck-bbs-common=C:\Users\C20573\BEWorkspace\bck-bbs-common
set bck-consent-app=C:\Users\C20573\BEWorkspace\bck-consent-app
set bck-data-account=C:\Users\C20573\BEWorkspace\bck-data-account
set bck-data-common=C:\Users\C20573\BEWorkspace\bck-data-common
set bck-data-connector=C:\Users\C20573\BEWorkspace\bck-data-connector
set bck-data-consent-app=C:\Users\C20573\BEWorkspace\bck-data-consent-app
set bck-data-portfolio=C:\Users\C20573\BEWorkspace\bck-data-portfolio
set bck-data-signing=C:\Users\C20573\BEWorkspace\bck-data-signing
set bck-data-stub=C:\Users\C20573\BEWorkspace\bck-data-stub
set bck-investments=C:\Users\C20573\BEWorkspace\bck-investments
REM set bck-pbi-cxp-portal=C:\Users\C20573\BEWorkspace\bck-pbi-cxp-portal
set bck-portal-security=C:\Users\C20573\BEWorkspace\bck-portal-security
set bck-signing-service=C:\Users\C20573\BEWorkspace\bck-signing-service
set bck-userid-translator=C:\Users\C20573\BEWorkspace\bck-userid-translator
set bck-data-onlineuser=C:\Users\C20573\BEWorkspace\bck-data-onlineuser
set bck-auth-filter=C:\Users\C20573\BEWorkspace\bck-auth-filter

echo ====================================START===================================================

set DO_GIT_PULL=n
set /p DO_GIT_PULL=Take the GIT Pull [y/n] (default - n) ?:

IF "%DO_GIT_PULL%" == "y" (GOTO :YES_DO_GIT_PULL) else (GOTO :NO_DONT_DO_GIT_PULL)

:YES_DO_GIT_PULL
echo Yes Boss, here you go..
call :FUNCTION_GIT_PULL %bck-portal-logging%
call :FUNCTION_GIT_PULL %bck-configurations%
call :FUNCTION_GIT_PULL %bck-accounts%
call :FUNCTION_GIT_PULL %bck-bbs-common%
call :FUNCTION_GIT_PULL %bck-consent-app%
call :FUNCTION_GIT_PULL %bck-data-account%
call :FUNCTION_GIT_PULL %bck-data-common%
call :FUNCTION_GIT_PULL %bck-data-connector%
call :FUNCTION_GIT_PULL %bck-data-consent-app%
call :FUNCTION_GIT_PULL %bck-data-portfolio%
call :FUNCTION_GIT_PULL %bck-data-signing%
call :FUNCTION_GIT_PULL %bck-data-stub%
call :FUNCTION_GIT_PULL %bck-investments%
REM call :FUNCTION_GIT_PULL %bck-pbi-cxp-portal%
call :FUNCTION_GIT_PULL %bck-portal-security%
call :FUNCTION_GIT_PULL %bck-signing-service%
call :FUNCTION_GIT_PULL %bck-userid-translator%
call :FUNCTION_GIT_PULL %bck-auth-filter%
call :FUNCTION_GIT_PULL %bck-data-onlineuser%

set ERRORLEVEL=99
if "%ERRORLEVEL%" == "99" GOTO :END

:FUNCTION_GIT_PULL
echo ______________________________________________________________________
echo Checking out:: %~1
cd %~1
git pull
if "%ERRORLEVEL%" == "0" GOTO :FUNCTION_END
echo Conflict found. Hence, stashing your changes with timestamp.
git stash save "%DATE:~6,4%_%DATE:~3,2%_%DATE:~0,2%_%TIME:~0,2%_%TIME:~3,2%"
git pull
:FUNCTION_END
echo Done :: %~1
exit /B 0


GOTO :END
:NO_DONT_DO_GIT_PULL
echo Okay boss! Leaving projects as it is


:END
if "%ERRORLEVEL%" == "99" (set ERRORLEVEL=0) else (set ERRORLEVEL=%ERRORLEVEL%)

echo ================================FINISH=======================================================
