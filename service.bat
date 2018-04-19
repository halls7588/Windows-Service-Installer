@echo OFF
echo %t1
echo Stopping old ServiceName version...
net stop "ServiceName"
echo Uninstalling old ServiceName version...
sc delete "ServiceName"

echo Installing new ServiceName...
rem DO NOT remove the space after "binpath="!
sc create "ServiceName" binpath= "C:\path\to\service.exe" start= auto

echo Configring ServiceName
sc config "ServiceName"  start= auto 
sc config "ServiceName" obj= user@logindomain.com password= userPassword
sc description "ServiceName" "Description of service activities"
net start ServiceName
echo Starting ServiceName complete
pause