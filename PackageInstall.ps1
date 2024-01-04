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


# Spør brukeren om de ønsker å installere npm-pakker
$userChoice = Read-Host "Ønsker du å installere pip-pakker (f.eks. Tensorflow)? (Y/N)"
if ($userChoice -eq 'Y') {
    Write-Host "Installerer pip-pakker..."

    pip install keras
    pip install matplotlib
    pip install numpy
    pip install pandas
    pip install torch
    pip install scikit-learn
    pip install tensorflow

    # Legg til flere pip installasjonskommandoer her om nødvendig
} else {
    Write-Host "Hopper over installasjon av pip-pakker."
}
