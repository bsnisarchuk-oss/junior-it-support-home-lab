# collect-network-info.ps1 — Collect and display network information for troubleshooting

$outputFile = "$env:TEMP\network-info-$(Get-Date -Format 'yyyy-MM-dd_HHmm').txt"

function Write-Section {
    param([string]$Title)
    $separator = "=" * 50
    Write-Output ""
    Write-Output $separator
    Write-Output "  $Title"
    Write-Output $separator
}

$results = {
    Write-Section "HOSTNAME"
    hostname

    Write-Section "IP CONFIGURATION"
    ipconfig /all

    Write-Section "ROUTING TABLE"
    route print

    Write-Section "DNS CACHE"
    ipconfig /displaydns | Select-Object -First 40

    Write-Section "ACTIVE CONNECTIONS"
    netstat -an | Select-Object -First 30

    Write-Section "PING GATEWAY"
    $gateway = (Get-NetRoute -DestinationPrefix "0.0.0.0/0" | Select-Object -First 1).NextHop
    if ($gateway) {
        ping -n 4 $gateway
    } else {
        Write-Output "No default gateway found."
    }

    Write-Section "PING DNS (8.8.8.8)"
    ping -n 4 8.8.8.8

    Write-Section "DNS LOOKUP (google.com)"
    nslookup google.com
}

Write-Host "[INFO] Collecting network information..."
& $results | Tee-Object -FilePath $outputFile

Write-Host ""
Write-Host "[DONE] Output saved to: $outputFile"
