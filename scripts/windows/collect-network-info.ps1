param(
    [string]$ServerIp = "192.168.56.101",
    [string]$ShareName = "companydocs"
)

# collect-network-info.ps1 - Collect and display network information for the current lab

$outputFile = "$env:TEMP\network-info-$(Get-Date -Format 'yyyy-MM-dd_HHmm').txt"
$SharePath = "\\$ServerIp\$ShareName"

function Write-Section {
    param([string]$Title)
    $separator = "=" * 50
    Write-Output ""
    Write-Output $separator
    Write-Output "  $Title"
    Write-Output $separator
}

$results = {
    param($ServerIp, $SharePath)

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

    Write-Section "PING LAB SERVER ($ServerIp)"
    ping -n 4 $ServerIp

    Write-Section "TEST SMB PORT 445 ($ServerIp)"
    Test-NetConnection -ComputerName $ServerIp -Port 445

    Write-Section "TEST SSH PORT 22 ($ServerIp)"
    Test-NetConnection -ComputerName $ServerIp -Port 22

    Write-Section "EXPECTED SHARE PATH"
    Write-Output $SharePath
}

Write-Host "[INFO] Collecting network information..."
& $results $ServerIp $SharePath | Tee-Object -FilePath $outputFile

Write-Host ""
Write-Host "[DONE] Output saved to: $outputFile"
