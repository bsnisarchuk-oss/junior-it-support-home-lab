# Workstation Troubleshooting Guide

Common Windows workstation issues and how to diagnose them in the current lab.

---

## Quick Diagnostic Checklist

When a user reports a problem, collect this information first:

- what exactly is not working
- when the issue started
- whether the issue affects only this workstation or the whole lab
- what changed recently

---

## 1. No Internet Access

**Symptoms:** websites fail to load, but the workstation may still be able to reach the lab server.

```cmd
ipconfig /all
route print
ping 192.168.56.101
ping 8.8.8.8
nslookup google.com
ipconfig /flushdns
```

| Result | Likely Cause |
|--------|--------------|
| Can reach `192.168.56.101` but not `8.8.8.8` | NAT/internet-side adapter issue |
| Can reach `8.8.8.8` but not `google.com` | DNS issue |
| Cannot reach server or internet | broader adapter or routing issue |

See also: `docs/incidents/planned/no-internet-on-workstation.md`

---

## 2. Shared Folder Not Accessible

**Symptoms:** `\\192.168.56.101\companydocs` does not open, or Windows reports that the network path cannot be found.

```powershell
ping 192.168.56.101
Test-NetConnection -ComputerName 192.168.56.101 -Port 445
net use
```

Then try to open:

```text
\\192.168.56.101\companydocs
```

If the server is reachable but port 445 is closed, check `smbd` on the server.

See also: `docs/incidents/completed/incident-01-samba-service-outage.md`, `docs/incidents/completed/incident-02-wrong-share-name-in-smb-conf.md`, `docs/incidents/completed/incident-04-firewall-blocks-smb-access.md`

---

## 3. Software Installation Fails

**Symptoms:** an installer closes immediately, shows a permission error, or never completes.

```powershell
whoami
whoami /groups
Get-PSDrive C
Get-Service msiserver
Get-EventLog -LogName Application -Source MsiInstaller -EntryType Error -Newest 5
```

Common fix directions:

- rerun the installer with administrative approval if required
- confirm enough free disk space exists
- confirm the Windows Installer service is available

See also: `docs/incidents/planned/software-installation-failure.md`

---

## 4. Useful Windows Diagnostic Commands

| Task | Command |
|------|---------|
| IP configuration | `ipconfig /all` |
| Routing table | `route print` |
| Flush DNS cache | `ipconfig /flushdns` |
| Test connectivity and ports | `Test-NetConnection -ComputerName IP -Port PORT` |
| Current user | `whoami` |
| Local groups for current user | `whoami /groups` |
| Check service status | `Get-Service ServiceName` |
| Running processes | `tasklist` |
| System info | `systeminfo` |
