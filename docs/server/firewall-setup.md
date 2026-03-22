# Firewall Setup (UFW)

> **Status:** Guide written — ⚙️ must be applied manually on the Ubuntu Server.
> **Prerequisite:** Ubuntu Server is installed and SSH is working.

---

## Overview

Ubuntu Server uses **UFW (Uncomplicated Firewall)** as a front-end for iptables.
This guide covers the minimum firewall rules needed for this lab environment.

> ⚠️ **Important:** Always allow SSH **before** enabling UFW to avoid locking yourself out.

---

## 1. Allow SSH (Before Enabling UFW)

> ⚙️ **Run on the server.**

```bash
sudo ufw allow ssh
```

This is equivalent to: `sudo ufw allow 22/tcp`

---

## 2. Allow Samba

```bash
sudo ufw allow samba
```

This opens ports 137, 138 (UDP) and 139, 445 (TCP) for file sharing.

---

## 3. Enable UFW

```bash
sudo ufw enable
```

You will see a warning: "Command may disrupt existing ssh connections."
Type `y` to confirm.

---

## 4. Verify Status

```bash
sudo ufw status verbose
```

Expected output for this lab:
```
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW IN    Anywhere
Samba                      ALLOW IN    Anywhere
```

**⚙️ Screenshot to take:** `ufw status verbose` output → `screenshots/server/ufw-status.png`

---

## 5. Useful UFW Commands

```bash
# List all rules with numbers
sudo ufw status numbered

# Delete a rule by number
sudo ufw delete 3

# Deny a specific IP
sudo ufw deny from 192.168.1.99

# Reset all rules (WARNING: disables firewall, removes all rules)
sudo ufw reset

# Disable firewall temporarily
sudo ufw disable
```

---

## 6. Firewall Rules Reference for This Lab

| Service | Port(s) | Protocol | Rule |
|---------|---------|----------|------|
| SSH | 22 | TCP | ALLOW |
| Samba (SMB) | 445 | TCP | ALLOW |
| Samba (NetBIOS) | 137–139 | UDP/TCP | ALLOW |
| All other incoming | — | — | DENY (default) |

---

## 7. Verification Checklist

| Check | Command | Expected | ⚙️ Result |
|-------|---------|----------|----------|
| SSH allowed | `sudo ufw status` | Port 22 in rules | |
| Samba allowed | `sudo ufw status` | Samba in rules | |
| UFW active | `sudo ufw status` | `Status: active` | |
| SSH still works after enabling | Re-connect via SSH | Connected | |
