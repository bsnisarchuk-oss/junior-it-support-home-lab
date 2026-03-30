# workstation-prep.ps1 - Prepare a Windows workstation

#Requires -RunAsAdministrator

$SuggestedComputerName = "office-pc-01"
$ServerIp = "192.168.56.101"
$ShareName = "companydocs"
$SharePath = "\\$ServerIp\$ShareName"

$EnteredComputerName = Read-Host "Enter new computer name [$SuggestedComputerName]"
if ([string]::IsNullOrWhiteSpace($EnteredComputerName)) {
    $ComputerName = $SuggestedComputerName
} else {
    $ComputerName = $EnteredComputerName
}

Write-Host "[INFO] Renaming computer to: $ComputerName"
Rename-Computer -NewName $ComputerName -Force

Write-Host "[INFO] Enabling Remote Desktop..."
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

Write-Host "[INFO] Disabling Sleep on AC power..."
powercfg /change standby-timeout-ac 0

Write-Host "[INFO] Leaving timezone unchanged. Set it manually if needed for your lab."

Write-Host "[INFO] Enabling Windows Update..."
Set-Service -Name wuauserv -StartupType Automatic
Start-Service -Name wuauserv

Write-Host "[INFO] Running Windows Update..."
# Requires PSWindowsUpdate module: Install-Module PSWindowsUpdate
# Install-WindowsUpdate -AcceptAll -AutoReboot

Write-Host ""
Write-Host "[DONE] Workstation preparation complete."
Write-Host "[INFO] After restart, verify host-only access to $ServerIp and open $SharePath"
Write-Host "A restart is required to apply the computer name change."
$restart = Read-Host "Restart now? (y/n)"
if ($restart -eq 'y') {
    Restart-Computer -Force
}
