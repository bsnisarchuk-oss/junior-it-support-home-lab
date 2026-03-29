# Samba Share Reference

**Status:** the Samba service is working in the current live lab.

This file records the share as it is validated today. The Windows-visible share path is verified, and the repository also documents the `Shared` subfolder path used in completed permissions testing.

---

## Current Verified Share

| Item | Value |
|------|-------|
| Server hostname | `office-srv-01` |
| Server IP | `192.168.56.101` |
| Windows client | `office-pc-01` |
| Share name | `companydocs` |
| Windows path | `\\192.168.56.101\companydocs` |
| Documented Linux subfolder | `/srv/companydocs/Shared` |
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

## Documentation Note

The repository now documents:

- the verified Windows path `\\192.168.56.101\companydocs`
- the Linux subfolder path `/srv/companydocs/Shared` used in completed Incident 03 testing

A later documentation pass can still capture the exact live `smb.conf` share block and confirm the full server-side mapping for the share root.

---

## Quick Troubleshooting

| Problem | Check | Fix Direction |
|---------|-------|---------------|
| Cannot reach the server | `ping 192.168.56.101` from Windows | Check host-only networking |
| Port 445 closed | `Test-NetConnection -ComputerName 192.168.56.101 -Port 445` | Check Samba and firewall state |
| Samba not running | `sudo systemctl status smbd` | Start `smbd` and review logs |
| Config error | `testparm` | Fix the Samba config before restarting |

See also: `docs/incidents/README.md`
