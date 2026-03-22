# workstation-prep.ps1 — Prepare a new Windows workstation

#Requires -RunAsAdministrator

$ComputerName = Read-Host "Enter new computer name (e.g., WIN-WS-01)"

Write-Host "[INFO] Renaming computer to: $ComputerName"
Rename-Computer -NewName $ComputerName -Force

Write-Host "[INFO] Enabling Remote Desktop..."
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

Write-Host "[INFO] Disabling Sleep on AC power..."
powercfg /change standby-timeout-ac 0

Write-Host "[INFO] Setting timezone to Moscow Standard Time..."
Set-TimeZone -Id "Russian Standard Time"

Write-Host "[INFO] Enabling Windows Update..."
Set-Service -Name wuauserv -StartupType Automatic
Start-Service -Name wuauserv

Write-Host "[INFO] Running Windows Update..."
# Requires PSWindowsUpdate module: Install-Module PSWindowsUpdate
# Install-WindowsUpdate -AcceptAll -AutoReboot

Write-Host ""
Write-Host "[DONE] Workstation preparation complete."
Write-Host "A restart is required to apply the computer name change."
$restart = Read-Host "Restart now? (y/n)"
if ($restart -eq 'y') {
    Restart-Computer -Force
}
