# Incident 03 — Software Installation Failure

## Details

| Field       | Value                        |
|-------------|------------------------------|
| Date        |                              |
| Reporter    |                              |
| Affected    | win-workstation-02           |
| Priority    | Low                          |
| Status      | Open / Resolved              |

## Description

Software installation fails on workstation. Installer exits with error or does not complete.

## Investigation Steps

1. What is the exact error message?
2. Is the user running installer as Administrator?
3. Is there sufficient disk space? `Get-PSDrive C`
4. Is Windows Installer service running?
   ```powershell
   Get-Service msiserver
   Start-Service msiserver
   ```
5. Check Windows Event Viewer: Application log for MSI errors
6. Try running from PowerShell: `Start-Process installer.exe -Verb RunAs`

## Root Cause

_Fill in after investigation_

## Resolution

_Fill in steps taken to resolve_

## Prevention

_Fill in any preventive measures_

## Time to Resolve

_Fill in_
