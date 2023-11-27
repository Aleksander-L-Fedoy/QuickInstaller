SETLOCAL

echo Husk å kjøre scriptet som administrator

REM Be brukeren om å angi brukernavn
set /p TargetUsername="Ditt brukernavn?: "

REM Lagrer den nåværende Execution Policy
FOR /F "tokens=*" %%G IN ('powershell -Command "Get-ExecutionPolicy"') DO SET OldPolicy=%%G

REM Endrer Execution Policy til RemoteSigned
powershell -Command "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force"

REM Viser den fullstendige stien til PowerShell-scriptet
echo C:\Users\%TargetUsername%\Desktop\QuickInstall.ps1

REM Kjører PowerShell-scriptet
powershell -File "C:\Users\%TargetUsername%\Desktop\QuickInstall.ps1"

REM Tilbakestiller Execution Policy til den opprinnelige verdien
powershell -Command "Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy %OldPolicy% -Force"

ENDLOCAL