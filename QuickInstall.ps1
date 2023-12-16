# A portion of this script is (inspired by)/(copied from) dougwaldron's project.
# Found here: https://gist.github.com/dougwaldron/d510f2d67a922da169aca1aeff7e4c4d

# Sett skript til å bruke UTF-8 koding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$installOk = $true

Write-Host "Sjekker Windows-versjon"
$osVersion = [System.Environment]::OSVersion.Version
if ($osVersion.Major -lt 10) {
    Write-Host "Dette scriptet krever Windows 10 eller nyere."
    $installOk = $false
} else {
    Write-Host "Windows-versjon ok."
}

Write-Host "Sjekker om Microsoft App Installer er installert"
$appInstaller = Get-AppxPackage -Name "*AppInstaller*"
if (-not $appInstaller) {
    Write-Host "Microsoft App Installer er ikke installert. Vennligst installer den fra Microsoft Store:"
    Write-Host "https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1"
    $installOk = $false
} else {
    Write-Host "Microsoft App Installer er allerede installert."
}

Write-Host "Sjekker visual-c versjon"
$vcLibs = Get-AppxPackage -Name "Microsoft.VCLibs.140.00.UWPDesktop"
if (-not $vcLibs) {
    Write-Host "Microsoft.VCLibs.140.00.UWPDesktop er ikke installert."
    $installOk = $false
} else {
    Write-Host "Microsoft.VCLibs.140.00.UWPDesktop er allerede installert."
}

Write-Host "Sjekker om winget er installert"
if (-not (Get-Command "winget" -ErrorAction SilentlyContinue)) {
    Write-Host "Winget er ikke installert."
    $userChoice = Read-Host "Ønsker du å installere Winget? (Y/N)"
    if ($userChoice -eq 'Y') {
        Write-Host "Installerer Winget..."
        $wingetLink = "https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
        Invoke-WebRequest -Uri $wingetLink -OutFile "$env:TEMP\winget-installer.msixbundle"
        Add-AppxPackage -Path "$env:TEMP\winget-installer.msixbundle" -ForceUpdateFromAnyVersion -ForceTargetApplicationShutdown
        winget source reset --force
        winget source update
        winget upgrade --all
        Write-Host "Winget installert."
    } else {
        $installOk = $false
    }
} else {
    Write-Host "Winget installert."
}

# Sjekker at all krav er møtt
if ($installOk -eq $true) {
    # Spør brukeren om å fortsette med installasjonen
    Write-Host "Alt i orden. Alle krav er møtt"
    $userChoice = Read-Host "Ønsker du å fortsette med installasjonen av programmene? (Y/N)"
    if ($userChoice -ne 'Y') {
        exit
    }

    Write-Host "Fortsetter med installasjon..."
    Write-Host "Installerer programmer"

    $apps = @(
        @{name = "Google.Chrome" },
        @{name = "Microsoft.VisualStudioCode" },
        @{name = "TIDALMusicAS.TIDAL" }
        # ,@{name = "OpenJS.NodeJS" }
        # ,@{name = "Git.Git" }
        # ,@{name = "Python.Python.3.11" }

        # ,@{name = "RARLab.WinRAR" }
        # ,@{name = "VideoLAN.VLC" }
        # ,@{name = "EclipseAdoptium.Temurin.21.JDK" }
        # ,@{name = "EclipseAdoptium.Temurin.21.JDK" }
        # ,@{name = "EclipseAdoptium.Temurin.21.JDK" }

        # Legg til dine apper her
    )

    Foreach ($app in $apps) {
        $listApp = winget list --exact -q $app.name
        if (![String]::Join("", $listApp).Contains($app.name)) {
            Write-host "Installerer: " $app.name
            winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
        }
        else {
            Write-host "Hopper over: " $app.name " (allerede installert)"
        }
    }

    Write-Host "Ferdig med installasjonen!"
} else {
    Write-Host "Avslutter scriptet."
}
