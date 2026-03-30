# install-common-software.ps1 - Install common workstation software using winget
# Helper for future workstation follow-up work. Do not mark software as verified
# in the portfolio until it has been installed and checked manually on office-pc-01.

#Requires -RunAsAdministrator

$software = @(
    @{ Name = "Google Chrome";    Id = "Google.Chrome" },
    @{ Name = "7-Zip";            Id = "7zip.7zip" },
    @{ Name = "Notepad++";        Id = "Notepad++.Notepad++" },
    @{ Name = "VLC Media Player"; Id = "VideoLAN.VLC" },
    @{ Name = "PuTTY";            Id = "PuTTY.PuTTY" },
    @{ Name = "WinSCP";           Id = "WinSCP.WinSCP" }
)

Write-Host "[INFO] Installing standard software via winget..."
Write-Host ""

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    throw "winget is not available on this workstation."
}

foreach ($app in $software) {
    Write-Host "[INFO] Installing $($app.Name)..."
    winget install --id $app.Id --exact --silent --accept-source-agreements --accept-package-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK]   $($app.Name) installed." -ForegroundColor Green
    } else {
        Write-Host "[WARN] $($app.Name) may have failed. Exit code: $LASTEXITCODE" -ForegroundColor Yellow
    }
    Write-Host ""
}

Write-Host "[DONE] Software installation complete."
