# Controleer de status van Windows Defender
$defenderStatus = Get-MpComputerStatus

# Controleer of dreigingen zijn gedetecteerd
if ($defenderStatus.AntivirusSignatureStatus -eq "Up to date" -and $defenderStatus.AntispywareSignatureStatus -eq "Up to date") {
    Write-Host "Geen dreiging gedetecteerd. Exit code: 0"
    exit 0
} else {
    Write-Host "Dreiging gedetecteerd. Exit code: 1"

    # Haal informatie op over de gedetecteerde dreigingen
    $threatInfo = Get-MpThreatDetection

    # Toon informatie over elke gedetecteerde dreiging
    foreach ($threat in $threatInfo) {
        Write-Host "Dreiging gevonden:"
        Write-Host " - Naam: $($threat.ThreatName)"
        Write-Host " - Type: $($threat.ThreatType)"
        Write-Host " - Actie: $($threat.ActionTaken)"
        Write-Host " - Status: $($threat.ThreatStatus)"
        Write-Host " - Locatie: $($threat.FullPath)"
        Write-Host " - Verwijderbaar: $($threat.IsRemovable)"
        Write-Host " - Remediation: $($threat.RemediationPath)"
        Write-Host ""
    }

    exit 1
}
