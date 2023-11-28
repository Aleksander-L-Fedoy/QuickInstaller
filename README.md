# QuickInstaller

## Beskrivelse
QuickInstaller er et sett med skript utviklet for å automatisere installasjonen (og avinstellasjon) av ønsket programvare på Windows-maskiner. Dette prosjektet inneholder to hovedskript: `RunQuickInstall.bat` og `QuickInstall.ps1`, som sammen sørger for en effektiv og brukervennlig installasjonsprosess. Prosjektet inneholder også et avinstellasjons-skript: `CleanUninstall.bat` som kan brukes for å raskt og effektiv avinstallere samme eller ønskete programvare.

## Hvordan Bruke `QuickInstall`-skriptene
1. Last ned begge skriptene (`RunQuickInstall.bat` og `QuickInstall.ps1`) til samme mappe.
2. Åpne `QuickInstall.ps1` i en teksteditor og legg til ønskete programmer i listen over `$apps`:
```ps1
    $apps = @(
        @{name = "Google.Chrome" },
        @{name = "Microsoft.VisualStudioCode" },
        @{name = "TIDALMusicAS.TIDAL" }
        # Legg til dine apper her
    )
```
3. Kjør `RunQuickInstall.bat` (muligens som administrator).
4. Skriv inn ditt brukernavn når du blir bedt om det og svar `Y` når du blir bedt om det.
5. Skriptet vil automatisk sjekke systemkrav og installere valgte programmer.

## Hvordan Bruke `CleanUninstall`-skriptet
1. Last ned skripet til din datamaskin
2. Åpne `CleanUninstall.bat` i en teksteditor og legg til "winget unistall" + progammene du ønsker å avinstallere
3. Kjør `CleanUninstall.bat`  (muligens som administrator).
4. Svar `Y` når du blir bedt om det.
5. Skriptet vil automatisk avinstallere valgte programmer.

## Advarsel
Bruk av disse skriptene skjer på eget ansvar. Selv om skriptene er utviklet med sikkerhet og effektivitet i tankene, er det alltid lurt å ta sikkerhetskopi av viktige data og systemkonfigurasjoner før du kjører dem. Forfatteren tar ikke ansvar for eventuelle skader eller tap forårsaket av bruk av disse skriptene.

## Krav
- Windows 10 eller nyere.
- Administratorrettigheter for å kjøre skriptene.

## Lisens
Dette prosjektet er lisensiert under Apache 2.0 med "Commons Clause" tillegg. Detaljer finner du i [LICENSE](LICENSE.md) filen.

## Kontakt
For spørsmål eller tilbakemeldinger, kontakt [Aleksander L. Fedøy](mailto:aleksander.fedoy@gmail.com).

---

*Denne README.md er generert for GitHub og kan kreve tilpasninger basert på ditt prosjektets spesifikke behov.*
