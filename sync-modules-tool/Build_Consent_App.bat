@echo off

set STATUS=FAILURE
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

call :BUILD_PBI_PROJECT %bck-configurations%
call :BUILD_PBI_PROJECT %bck-portal-logging%
call :BUILD_PBI_PROJECT %bck-data-common%
call :BUILD_PBI_PROJECT %bck-userid-translator%
call :BUILD_PBI_PROJECT %bck-data-connector%
call :BUILD_PBI_PROJECT %bck-data-signing%
call :BUILD_PBI_PROJECT %bck-data-consent-app%
call :BUILD_PBI_PROJECT %bck-consent-app%



set ERRORLEVEL=99
if "%ERRORLEVEL%" == "99" GOTO :END


:BUILD_PBI_PROJECT
set STATUS=FAILURE
echo Build Project:  %~1 :: STARTS
cd %~1
call mvn clean install
echo Build Project:  %~1 :: DONE
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
exit /B 0


:END
if "%ERRORLEVEL%" == "99" (set ERRORLEVEL=0) else (set ERRORLEVEL=%ERRORLEVEL%)

echo COMPLETE CHAIN :: DONE





















REM :BUILD_PBI_PROJECT
REM set STATUS=FAILURE
REM echo Build Project:  %~1 :: STARTS
REM cd %~1
REM call mvn clean install
REM echo error=%ERRORLEVEL% status=%STATUS%
REM if "%ERRORLEVEL%" == "0" (set STATUS=SUCCESSFUL)
REM if "%STATUS%" == "FAILURE" (GOTO :END) else (echo Build Project: %~1 :: ENDS)
REM exit /B 0
REM
REM
REM :END
REM if "%ERRORLEVEL%" == "99" (set ERRORLEVEL=0) else (set ERRORLEVEL=%ERRORLEVEL%)
REM
REM echo BUILDING PROJECT :: DONE
