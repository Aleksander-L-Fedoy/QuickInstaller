echo Ønsker du å avinstallere de valgte programmene? (Y/N)
choice /C YN /M "Enter your choice: "
if %ERRORLEVEL% equ 2 exit /b

echo Avinstallerer programmer...

winget uninstall Google.Chrome
winget uninstall Microsoft.VisualStudioCode
winget uninstall TIDAL
REM winget uninstall OpenJS.NodeJS


REM Legg til "winget unistall" + progammene du ønsker å avinstallere her

echo Ferdig med avinstallasjonen!
