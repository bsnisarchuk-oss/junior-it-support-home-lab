# Incident 02 — Shared Folder Inaccessible

> **Type:** Lab simulation — this incident is reproduced intentionally to practice troubleshooting.
> **⚙️ Status:** Scenario defined — must be reproduced and resolved manually in the lab.

---

## Incident Details

| Field | Value |
|-------|-------|
| Incident ID | INC-002 |
| Date reported | _(fill in during lab session)_ |
| Reported by | labuser (win-workstation-01 and win-workstation-02) |
| Affected device | Both workstations — cannot access `\\192.168.1.10\Shared` |
| Priority | High — affects all users |
| Status | ⚙️ To be completed in lab |

---

## Description

Both users report that the mapped network drive (Z:) is showing as disconnected.
When they try to open it, they get: **"Network path not found"** or **"Windows cannot access \\192.168.1.10\Shared"**.
The issue appeared suddenly — the share was working yesterday.

---

## How to Reproduce This Incident in the Lab

> ⚙️ **Choose one of the methods below to break the share:**

**Method A — Stop the Samba service (most common real-world scenario):**
```bash
# On the Ubuntu Server
sudo systemctl stop smbd
```

**Method B — Block Samba in the firewall:**
```bash
# On the Ubuntu Server
sudo ufw deny samba
```

**Method C — Misconfigure smb.conf:**
```bash
# On the Ubuntu Server — add an invalid line to break config
echo "invalid_option = yes" | sudo tee -a /etc/samba/smb.conf
sudo systemctl restart smbd
```

---

## Investigation Steps

### Step 1 — Can the workstation reach the server at all?

> Run on WIN-WS-01:
```cmd
ping 192.168.1.10
```

- If ping fails → network connectivity issue (check VM network, check if server is running)
- If ping succeeds → server is reachable, problem is specific to Samba

### Step 2 — Is the SMB port open?

```powershell
Test-NetConnection -ComputerName 192.168.1.10 -Port 445
```

Expected (working): `TcpTestSucceeded: True`
Expected (broken): `TcpTestSucceeded: False` — Samba is not listening or is blocked

### Step 3 — Check Samba service on the server

> Run on the Ubuntu Server (via SSH):
```bash
sudo systemctl status smbd
```

Look for:
- `active (running)` → service is up, problem is elsewhere (config, firewall, permissions)
- `inactive (dead)` or `failed` → service is not running → start it

```bash
# If service is stopped:
sudo systemctl start smbd
```

### Step 4 — Check UFW firewall

```bash
sudo ufw status
```

Check if Samba is listed as ALLOW. If it shows DENY or is missing:
```bash
sudo ufw allow samba
```

### Step 5 — Check Samba configuration

```bash
testparm
```

- `Loaded services file OK` → config is valid
- Any error output → there is a syntax error in smb.conf — review and fix

### Step 6 — Check Samba logs

```bash
sudo tail -30 /var/log/samba/log.smbd
```

Look for error messages that indicate the reason for failure.

---

## Root Cause

> ⚙️ Fill in after completing the lab investigation.

**Expected root cause (Method A):** Samba service (`smbd`) was stopped. This immediately makes all shares inaccessible, even though the server is reachable by ping. Port 445 is not listening when smbd is not running.

_Actual finding during lab:_
```
[fill in]
```

---

## Resolution

> ⚙️ Fill in after completing the lab resolution.

**Expected resolution (Method A):**
```bash
# Start Samba
sudo systemctl start smbd

# Confirm it's running
sudo systemctl status smbd

# Enable auto-start on boot (prevent recurrence)
sudo systemctl enable smbd
```

Then from Windows, reconnect the mapped drive:
```powershell
net use Z: \\192.168.1.10\Shared
```
Or disconnect and remap through File Explorer.

_Actual steps taken during lab:_
```
[fill in]
```

---

## Screenshots to Take

- [ ] `screenshots/incidents/inc-002-drive-error.png` — Windows error when accessing Z: drive
- [ ] `screenshots/incidents/inc-002-port-check.png` — Test-NetConnection showing port 445 closed
- [ ] `screenshots/incidents/inc-002-smbd-stopped.png` — systemctl status smbd showing stopped
- [ ] `screenshots/incidents/inc-002-resolved.png` — Z: drive accessible after fix

---

## Prevention

- Enable Samba to start automatically on boot: `sudo systemctl enable smbd`
- Monitor server uptime
- In a real environment: set up alerting for service failures (e.g., Nagios, Zabbix, or a simple cron health check)

---

## Time to Resolve

| Stage | Time |
|-------|------|
| Time reported → first investigation | _(fill in)_ |
| First investigation → root cause identified | _(fill in)_ |
| Root cause → resolved | _(fill in)_ |
| **Total** | _(fill in)_ |
