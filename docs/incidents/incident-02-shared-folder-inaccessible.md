# Incident 02 - Shared Folder Inaccessible

**Type:** planned lab simulation for future troubleshooting practice  
**Status:** not yet reproduced in the live lab

---

## Incident Details

| Field | Value |
|-------|-------|
| Incident ID | `INC-002` |
| Reported by | user on `office-pc-01` |
| Affected device | `office-pc-01` cannot access `\\192.168.56.101\companydocs` |
| Priority | High |
| Current repo state | Scenario prepared, evidence not captured yet |

---

## Description

The Windows workstation can no longer open the `companydocs` share on `office-srv-01`.

Typical user symptom:

- File Explorer cannot open `\\192.168.56.101\companydocs`
- Windows reports that the network path cannot be found or that the share is unavailable

---

## Planned Reproduction

Choose one method when you are ready to perform the simulation:

### Method A - Stop Samba

```bash
sudo systemctl stop smbd
```

### Method B - Break the Samba config

```bash
echo "invalid_option = yes" | sudo tee -a /etc/samba/smb.conf
sudo systemctl restart smbd
```

### Method C - Change firewall state after UFW is actually configured

Only use this method later if firewall rules have been implemented and tested in the live lab.

---

## Investigation Steps

### On `office-pc-01`

```powershell
ping 192.168.56.101
Test-NetConnection -ComputerName 192.168.56.101 -Port 445
```

Then try to open:

```text
\\192.168.56.101\companydocs
```

### On `office-srv-01`

```bash
sudo systemctl status smbd
testparm
sudo tail -30 /var/log/samba/log.smbd
```

Interpretation:

- if ping fails, start with host-only networking
- if ping works but port 445 is closed, focus on Samba service state
- if `testparm` fails, fix the Samba config before restarting the service

---

## Expected Root Cause

Record the real finding after the live test.

Most likely causes for this lab:

- `smbd` was stopped
- the Samba config became invalid
- firewall rules blocked SMB after firewall hardening is added

---

## Expected Resolution

Typical fixes:

```bash
sudo systemctl start smbd
sudo systemctl status smbd
testparm
```

After the server-side fix, re-test from Windows:

```powershell
Test-NetConnection -ComputerName 192.168.56.101 -Port 445
```

Then open `\\192.168.56.101\companydocs` again in File Explorer.

---

## Screenshots to Capture Later

- [ ] `screenshots/incidents/inc-002-drive-error.png`
- [ ] `screenshots/incidents/inc-002-port-check.png`
- [ ] `screenshots/incidents/inc-002-smbd-status.png`
- [ ] `screenshots/incidents/inc-002-resolved.png`

---

## Prevention

- keep a known-good copy of the Samba config before editing it
- verify `smbd` after changes with `systemctl status smbd`
- validate config changes with `testparm`
