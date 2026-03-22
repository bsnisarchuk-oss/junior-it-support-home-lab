# Incident 02 — Shared Folder Inaccessible

## Details

| Field       | Value                        |
|-------------|------------------------------|
| Date        |                              |
| Reporter    |                              |
| Affected    | win-workstation-01, win-workstation-02 |
| Priority    | High                         |
| Status      | Open / Resolved              |

## Description

Users cannot access the shared folder at `\\192.168.1.10\Shared`.

## Investigation Steps

1. Can workstation ping server? `ping 192.168.1.10`
2. Is port 445 open? `Test-NetConnection -ComputerName 192.168.1.10 -Port 445`
3. Is Samba running on server? `sudo systemctl status smbd`
4. Is UFW blocking SMB? `sudo ufw status`
5. Check Samba config: `testparm`

## Root Cause

_Fill in after investigation_

## Resolution

_Fill in steps taken to resolve_

## Prevention

_Fill in any preventive measures_

## Time to Resolve

_Fill in_
