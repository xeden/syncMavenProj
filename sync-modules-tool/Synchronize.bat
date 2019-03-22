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


xml sel -t -v "/_:project/_:version" %bck-portal-logging%\pom.xml>result.txt
set /p bck-portal-logging-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-configurations%\pom.xml>result.txt
set /p bck-configurations-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-accounts%\pom.xml>result.txt
set /p bck-accounts-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-bbs-common%\pom.xml>result.txt
set /p bck-bbs-common-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-consent-app%\pom.xml>result.txt
set /p bck-consentapp-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-data-account%\pom.xml>result.txt
set /p bck-data-account-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-data-common%\pom.xml>result.txt
set /p bck-data-common-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-data-connector%\pom.xml>result.txt
set /p bck-data-connector-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-data-consent-app%\pom.xml>result.txt
set /p bck-data-consent-app-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-data-portfolio%\pom.xml>result.txt
set /p bck-data-portfolio-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-data-signing%\pom.xml>result.txt
set /p bck-data-signing-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-data-stub%\pom.xml>result.txt
set /p bck-data-stub-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-investments%\pom.xml>result.txt
set /p bck-investments-version=<result.txt

REM xml sel -t -v "/_:project/_:version" %bck-pbi-cxp-portal%\pom.xml>result.txt
REM set /p bck-pbi-cxp-portal-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-portal-security%\pom.xml>result.txt
set /p bck-portal-security-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-signing-service%\pom.xml>result.txt
set /p bck-signing-service-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-userid-translator%\pom.xml>result.txt
set /p bck-userid-translator-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-data-onlineuser%\pom.xml>result.txt
set /p bck-data-onlineuser-version=<result.txt

xml sel -t -v "/_:project/_:version" %bck-auth-filter%\pom.xml>result.txt
set /p bck-auth-filter-version=<result.txt

echo SYNCHRONIZING :: STARTS

call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:portal.logging.version" %bck-portal-logging-version% %bck-data-common%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:data-common.version" %bck-data-common-version% %bck-userid-translator%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:IntRESTUseridTranslator.version" %bck-userid-translator-version% %bck-data-connector%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:data-connector.version" %bck-data-connector-version% %bck-data-consent-app%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:data-connector.version" %bck-data-connector-version% %bck-data-signing%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:data-connector.version" %bck-data-connector-version% %bck-signing-service%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:bbs-configurations.version" %bck-configurations-version% %bck-signing-service%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:data-connector.version" %bck-data-connector-version% %bck-data-account%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:data-signing.version" %bck-data-signing-version% %bck-consent-app%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:data-consentapp.version" %bck-data-consent-app-version% %bck-consent-app%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:portal-logging.version" %bck-portal-logging-version% %bck-data-stub%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:IntRESTUseridTranslator.version" %bck-userid-translator-version% %bck-data-stub%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:bbs-common.version" %bck-bbs-common-version% %bck-data-stub%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:configurations.version" %bck-configurations-version% %bck-portal-security%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:data-connector.version" %bck-data-connector-version% %bck-portal-security%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:data-common.version" %bck-data-common-version% %bck-portal-security%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:PBIAuthorisationFilter.version" %bck-auth-filter-version% %bck-portal-security%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:signing-service.version" %bck-signing-service-version% %bck-portal-security%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:PBIDataConnector.version" %bck-data-connector-version% %bck-data-onlineuser%
call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:PBIDataOnlineuser.version" %bck-data-onlineuser-version% %bck-auth-filter%





set ERRORLEVEL=99
if "%ERRORLEVEL%" == "99" GOTO :END

:FUNCTION_CHANGE_POM_VERSION


xml ed -S -O -u %~1 -v %~2 %~3\pom.xml>result.txt
break>%~3\pom.xml
type result.txt>>%~3\pom.xml
break>result.txt
echo SYNCHRONIZED: %~3
exit /B 0


:END
if "%ERRORLEVEL%" == "99" (set ERRORLEVEL=0) else (set ERRORLEVEL=%ERRORLEVEL%)

echo SYNCHRONIZING :: DONE

