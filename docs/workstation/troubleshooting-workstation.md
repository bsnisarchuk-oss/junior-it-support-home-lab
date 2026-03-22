# Workstation Troubleshooting Guide

Common Windows workstation issues and how to diagnose them.
Reference this guide during incident investigation.

---

## Quick Diagnostic Checklist

When a user reports a problem, collect this information first:

- [ ] What exactly is not working? (error message if any)
- [ ] Since when? (after an update, after restart, always?)
- [ ] Is it just this user or all users on this PC?
- [ ] Is it just this PC or all PCs?
- [ ] What changed recently? (new software, Windows update, moved network cable?)

---

## 1. No Internet Access

**Symptoms:** Cannot open websites, browser shows "No Internet" or "DNS_PROBE_FINISHED_NXDOMAIN"

```cmd
REM Step 1 - Check IP config
ipconfig /all

REM Step 2 - Test gateway
ping 192.168.1.1

REM Step 3 - Test internet by IP (bypasses DNS)
ping 8.8.8.8

REM Step 4 - Test DNS
nslookup google.com

REM Step 5 - Flush DNS cache
ipconfig /flushdns
```

| Ping Result | DNS Result | Likely Cause |
|-------------|-----------|--------------|
| Gateway fails | — | Wrong gateway or adapter issue |
| Gateway OK, 8.8.8.8 fails | — | Routing/firewall issue |
| 8.8.8.8 OK, DNS fails | Fails | Wrong DNS server |
| All pings OK | Browser fails | Browser or proxy issue |

See also: `docs/incidents/incident-01-no-internet.md`

---

## 2. Shared Network Drive Not Accessible

**Symptoms:** Z: drive shows as disconnected, error "network path not found"

```powershell
# Test server reachability
ping 192.168.1.10

# Test SMB port
Test-NetConnection -ComputerName 192.168.1.10 -Port 445

# Try to reconnect drive
net use Z: \\192.168.1.10\Shared

# List currently mapped drives
net use
```

If the server is reachable but port 445 is closed → Samba is down on the server.
Log into the server and check: `sudo systemctl status smbd`

See also: `docs/incidents/incident-02-shared-folder-inaccessible.md`

---

## 3. Software Installation Fails

**Symptoms:** Installer closes immediately, shows permission error, or hangs

```powershell
# Check current user's admin status
whoami /groups | findstr "Administrators"

# Check disk space
Get-PSDrive C

# Check Windows Installer service
Get-Service msiserver

# Check recent install errors in Event Log
Get-EventLog -LogName Application -Source MsiInstaller -EntryType Error -Newest 5
```

Common fixes:
- Right-click installer → "Run as administrator"
- Free disk space if under 2 GB
- `Start-Service msiserver` if the Windows Installer service is stopped

See also: `docs/incidents/incident-03-software-installation-failure.md`

---

## 4. Computer Running Slowly

**Symptoms:** Programs open slowly, general sluggishness, high CPU/disk in Task Manager

```powershell
# Check top CPU processes
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 Name, CPU, WorkingSet

# Check disk usage
Get-PSDrive C

# Check for Windows Update activity
Get-Service wuauserv | Select-Object Status
```

Common fixes:
- Wait for Windows Update to finish (check Task Manager for `TiWorker.exe` or `WUDFHost.exe`)
- Restart the computer
- Check for malware (run Windows Defender scan)
- If disk is full: clear temp files → `cleanmgr` or `%temp%` folder

---

## 5. Cannot Log In

**Symptoms:** Incorrect password, account locked, profile fails to load

```cmd
REM Check if account is locked (run as administrator)
net user labuser
```

Look for: `Account active: No` → account is disabled or locked

```cmd
REM Unlock/re-enable account
net user labuser /active:yes

REM Reset password
net user labuser NewPassword123!
```

---

## 6. Useful Windows Diagnostic Commands Reference

| Task | Command |
|------|---------|
| IP configuration | `ipconfig /all` |
| Release and renew DHCP | `ipconfig /release` then `ipconfig /renew` |
| Flush DNS cache | `ipconfig /flushdns` |
| Test connectivity + port | `Test-NetConnection -ComputerName IP -Port PORT` |
| Traceroute | `tracert 8.8.8.8` |
| Current user | `whoami` |
| List local users | `net user` |
| Check service status | `Get-Service ServiceName` |
| Running processes | `tasklist` |
| System info | `systeminfo` |
| Event log errors | `Get-EventLog -LogName System -EntryType Error -Newest 20` |
| Check open ports | `netstat -an` |
| Run as admin | Right-click → Run as administrator |
