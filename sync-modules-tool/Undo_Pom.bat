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
set last-logon-war=C:\Users\C20573\BEWorkspace\bck-portal-security\last-logon-war
set portal-logon-war=C:\Users\C20573\BEWorkspace\bck-portal-security\portal-logon-war
REM set unread-messages-war=C:\Users\C20573\BEWorkspace\bck-portal-security\unread-messages-war
REM set logon-bac-security-war=C:\Users\C20573\BEWorkspace\bck-portal-security\logon-bac-security-war

echo ===================================START====================================================


ECHO Do You want to undo the modifications to the pom files.
set UndoPom=n
set /p UndoPom=Undo the pom's [y/n] (default - n) ?:

IF "%UndoPom%" == "y" (GOTO :YES_UNDO_POM) else (GOTO :NO_DONT_UNDO_POM)

:YES_UNDO_POM
echo Yes Boss, here you go..
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-portal-logging%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-configurations%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-accounts%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-bbs-common%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-consent-app%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-data-account%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-data-common%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-data-connector%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-data-consent-app%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-data-portfolio%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-data-signing%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-data-stub%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-investments%
REM call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-pbi-cxp-portal%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-portal-security%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-signing-service%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-userid-translator%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %last-logon-war%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %portal-logon-war%
REM call :FUNCTION_UNDO_POM_LOCAL_CHANGES %unread-messages-war%
REM call :FUNCTION_UNDO_POM_LOCAL_CHANGES %logon-bac-security-war%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-data-onlineuser%
call :FUNCTION_UNDO_POM_LOCAL_CHANGES %bck-auth-filter%

set ERRORLEVEL=99
if "%ERRORLEVEL%" == "99" GOTO :END

:FUNCTION_UNDO_POM_LOCAL_CHANGES
cd %~1
git checkout -- %~1\pom.xml
echo Done :: %~1
exit /B 0


GOTO :END

:NO_DONT_UNDO_POM
echo Okay boss! Leaving pom's as it is

:END
if "%ERRORLEVEL%" == "99" (set ERRORLEVEL=0) else (set ERRORLEVEL=%ERRORLEVEL%)
echo =======================================FINISH================================================
