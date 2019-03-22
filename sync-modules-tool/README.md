# sync-modules-tool

This extremely simple command line tool synchronizes the version of different internal project dependencies.
It comes in handy for me every morning when I have to take pull from different project and then interweave their dependencies OR whenever I need to start afresh.


###### HOW TO USE
If you are using this tool make sure that path of various project in synchronize.bat is as per your structure.

For ex in synchronize.bat the below line signifies....

call :FUNCTION_CHANGE_POM_VERSION "/_:project/_:properties/_:portal.logging.version" %bck-portal-logging-version% %bck-data-common%

call :{     Name of function    } "{path of property in pom.xml you want to change}" %{   value of property    }% %{path of pom.xml}%


To use this tool run Open command prompt and run the following bat file.
```
>Undo-Pom.bat            // undoes all the changes in pom.xml files of all projects
>Git_Pull.bat            // Takes pull from all projects. In case of conflict during pull, it stashes your changes with timestamp and takes pull from remote repository
>synchronize.bat         // interweave the dependency across different projects.
>Build_Consent_App.bat   // a script to build my project with all the latest dependencies.
```


###### DEPENDENCIES
Project uses xml starlet 1.6.1 for xml parsing.

XMLStarlet is a command line XML toolkit which can be used to transform, 
query, validate, and edit XML documents and files using  simple set of shell 
commands in similar way it is done for plain text files  using grep/sed/awk/
tr/diff/patch.

###### IMPROVEMENTS
A lot of improvement can be don on top of this. For now it serves my basic purpose. So I have stopped here.

###### CONTACT
Mail to akhil.kumar@nl.abnamro.com for queries.
