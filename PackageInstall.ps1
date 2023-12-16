# Spør brukeren om de ønsker å installere npm-pakker
$userChoice = Read-Host "Ønsker du å installere npm-pakker (f.eks. Google Clasp)? (Y/N)"
if ($userChoice -eq 'Y') {
    Write-Host "Installerer npm-pakker..."

    # Installerer Google Clasp
    Write-Host "Installerer Google Clasp..."
    npm install -g @google/clasp

    # Legg til flere npm installasjonskommandoer her om nødvendig
} else {
    Write-Host "Hopper over installasjon av npm-pakker."
}
