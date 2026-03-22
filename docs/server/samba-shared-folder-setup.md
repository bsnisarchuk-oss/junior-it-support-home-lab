# Samba Shared Folder Setup

> **Status:** Guide written — ⚙️ must be completed manually on the Ubuntu Server.
> **Prerequisite:** Ubuntu Server is installed and accessible via SSH (see `ubuntu-server-setup.md`).

---

## Overview

Samba allows Windows machines to access shared folders on a Linux server
using the standard SMB/CIFS protocol — the same protocol used by Windows network shares.

The shared folder will be accessible at: `\\192.168.1.10\Shared`

---

## 1. Install Samba

> ⚙️ **Run on the server via SSH.**

```bash
sudo apt update
sudo apt install samba -y
```

Verify installation:
```bash
samba --version
```

---

## 2. Create the Shared Directory Structure

You can run the provided script or do it manually.

**Option A — Run the script:**
```bash
sudo bash /path/to/scripts/linux/create-shared-structure.sh
```

**Option B — Manual:**
```bash
sudo mkdir -p /srv/shared
sudo mkdir -p /srv/shared/Documents
sudo mkdir -p /srv/shared/IT/Drivers
sudo mkdir -p /srv/shared/IT/Software
sudo mkdir -p /srv/shared/HR
sudo mkdir -p /srv/shared/Public

sudo chown -R nobody:nogroup /srv/shared
sudo chmod -R 0775 /srv/shared
```

Verify:
```bash
ls -la /srv/shared
```

---

## 3. Configure Samba

Back up the original config file:
```bash
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
```

Open the config file:
```bash
sudo nano /etc/samba/smb.conf
```

Add the following block at the **end** of the file:
```ini
[Shared]
   path = /srv/shared
   comment = Company Shared Folder
   browseable = yes
   read only = no
   guest ok = yes
   create mask = 0664
   directory mask = 0775
   force user = nobody
```

Test the configuration for syntax errors:
```bash
testparm
```

Expected output: `Loaded services file OK.`

---

## 4. Open Firewall for Samba

> ⚙️ **Run on the server.**

```bash
sudo ufw allow samba
sudo ufw status
```

Expected output should include:
```
Samba                      ALLOW       Anywhere
```

---

## 5. Restart and Enable Samba

```bash
sudo systemctl restart smbd
sudo systemctl enable smbd
```

Check status:
```bash
sudo systemctl status smbd
```

Expected: `active (running)`

**⚙️ Screenshot to take:** `systemctl status smbd` showing active → `screenshots/server/samba-status.png`

---

## 6. Access the Share from Windows

> ⚙️ **Complete manually on win-workstation-01.**

**Method 1 — Run dialog:**
Press `Win + R`, type:
```
\\192.168.1.10\Shared
```

**Method 2 — Map as Network Drive:**
1. Open File Explorer
2. Right-click "This PC" → "Map network drive..."
3. Drive letter: `Z:`
4. Folder: `\\192.168.1.10\Shared`
5. Check "Reconnect at sign-in"
6. Click Finish

You should see the shared folders: `Documents`, `HR`, `IT`, `Public`.

**⚙️ Screenshot to take:** Mapped drive `Z:` open in File Explorer → `screenshots/workstation/network-drive-mapped.png`

---

## 7. Verification Checklist

| Check | How to Verify | Expected Result | ⚙️ Result |
|-------|--------------|-----------------|----------|
| Samba installed | `samba --version` | Version printed | |
| Share directory exists | `ls /srv/shared` | Folders visible | |
| Config valid | `testparm` | `Loaded services file OK` | |
| Samba running | `systemctl status smbd` | `active (running)` | |
| Port 445 open | From Windows: `Test-NetConnection -ComputerName 192.168.1.10 -Port 445` | `TcpTestSucceeded: True` | |
| Share accessible from Windows | Browse `\\192.168.1.10\Shared` | Folders visible | |

---

## Troubleshooting

| Problem | Check | Fix |
|---------|-------|-----|
| Cannot reach server at all | `ping 192.168.1.10` from Windows | Check VM network adapter |
| Port 445 blocked | `sudo ufw status` | `sudo ufw allow samba` |
| Samba not running | `sudo systemctl status smbd` | `sudo systemctl start smbd` |
| Config error | `testparm` | Fix syntax in smb.conf, restart smbd |
| Permission denied | `ls -la /srv/shared` | Check ownership and chmod |

See also: `docs/incidents/incident-02-shared-folder-inaccessible.md`
