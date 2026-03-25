# Samba Share Reference

**Status:** the Samba service is working in the current live lab.

This file records the share as it is validated today. It does not assume any extra permissions work, mapped drive letters, or undocumented server-side paths.

---

## Current Verified Share

| Item | Value |
|------|-------|
| Server hostname | `office-srv-01` |
| Server IP | `192.168.56.101` |
| Windows client | `office-pc-01` |
| Share name | `companydocs` |
| Windows path | `\\192.168.56.101\companydocs` |
| Validation evidence | `windows-test.txt` was created from Windows in the share |

---

## Validation Commands

### On the Ubuntu Server

```bash
sudo systemctl status smbd
testparm
```

### On the Windows Workstation

```powershell
Test-NetConnection -ComputerName 192.168.56.101 -Port 445
```

Then open the share in File Explorer:

```text
\\192.168.56.101\companydocs
```

---

## Expected Results

- `smbd` is active
- `testparm` reports a valid configuration
- port 445 is reachable from `office-pc-01`
- the share opens from Windows
- the existing validation history shows that `windows-test.txt` was created from Windows inside the shared folder

---

## Documentation Gap to Fill Later

The repository currently documents the **Windows-visible** share path, which is already verified.

The exact **server-side filesystem path** for the live `companydocs` share should be captured directly from the current server configuration in a later documentation pass. It is intentionally not guessed here.

---

## Quick Troubleshooting

| Problem | Check | Fix Direction |
|---------|-------|---------------|
| Cannot reach the server | `ping 192.168.56.101` from Windows | Check host-only networking |
| Port 445 closed | `Test-NetConnection -ComputerName 192.168.56.101 -Port 445` | Check Samba and firewall state |
| Samba not running | `sudo systemctl status smbd` | Start `smbd` and review logs |
| Config error | `testparm` | Fix the Samba config before restarting |

See also: `docs/incidents/incident-02-shared-folder-inaccessible.md`
