# Ubuntu Server Setup

> **Status:** Guide written — ⚙️ installation must be completed manually in the VM.

---

## 1. Create the Virtual Machine

> ⚙️ **Complete manually in VirtualBox / VMware.**

Settings:
- Name: `ubuntu-server`
- OS type: Linux — Ubuntu 64-bit
- RAM: 2048 MB
- Disk: 20 GB (VDI, dynamically allocated)
- Network: Host-only adapter

Attach the Ubuntu Server 22.04 LTS ISO to the VM before starting.

---

## 2. OS Installation

> ⚙️ **Complete manually — follow the Ubuntu installer wizard.**

Key choices during installation:

| Step | Setting |
|------|---------|
| Language | English |
| Keyboard layout | Your preference |
| Install type | Ubuntu Server (not minimized) |
| Network | Leave as DHCP for now — static IP is set after install |
| Storage | Use entire disk (guided) |
| Hostname | `ubuntu-server` |
| Username | `admin` |
| Password | _(set a strong password, record in local password manager)_ |
| OpenSSH | **Enable — check "Install OpenSSH server"** |
| Snaps | Skip all |

Installation takes approximately 10–15 minutes.
After reboot, log in with the credentials you created.

---

## 3. First Boot — System Update

> ⚙️ **Run on the server after first login.**

```bash
sudo apt update && sudo apt upgrade -y
```

This updates all packages to the latest versions.
Expected output: list of upgraded packages, no errors.

**⚙️ Screenshot to take:** Terminal showing update completion → save as `screenshots/server/first-update.png`

---

## 4. Configure Static IP

Ubuntu Server 22.04 uses **Netplan** to manage network configuration.

> ⚙️ **Complete manually on the server.**

Find the network interface name:
```bash
ip addr show
```
Look for the interface name (typically `ens33`, `ens3`, or `eth0`).

Edit the Netplan configuration file:
```bash
sudo nano /etc/netplan/00-installer-config.yaml
```

Replace the contents with:
```yaml
network:
  version: 2
  ethernets:
    ens33:                          # replace with your actual interface name
      dhcp4: no
      addresses:
        - 192.168.1.10/24
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

Apply the configuration:
```bash
sudo netplan apply
```

Verify the static IP is set:
```bash
ip addr show
```

Expected output: interface shows `192.168.1.10/24`.

**⚙️ Screenshot to take:** `ip addr show` output confirming static IP → `screenshots/server/static-ip.png`

---

## 5. Test Network Connectivity

> ⚙️ **Run on the server.**

```bash
# Test gateway
ping -c 4 192.168.1.1

# Test internet
ping -c 4 8.8.8.8

# Test DNS
ping -c 4 google.com
```

All three should succeed. If `8.8.8.8` works but `google.com` does not, there is a DNS issue — check the nameservers in the Netplan config.

---

## 6. Test SSH Access from Host Machine

> ⚙️ **Run on your host machine (Windows 11).**

Open PowerShell or Windows Terminal:
```powershell
ssh admin@192.168.1.10
```

Accept the host key fingerprint when prompted.
Log in with the `admin` password.

**⚙️ Screenshot to take:** Successful SSH session from host → `screenshots/server/ssh-login.png`

---

## 7. Configure UFW Firewall

> ⚙️ **Run on the server.**

```bash
# Allow SSH (do this BEFORE enabling UFW or you will lock yourself out)
sudo ufw allow ssh

# Enable firewall
sudo ufw enable

# Check status
sudo ufw status
```

Expected output:
```
Status: active
To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere
```

---

## 8. Verification Checklist

> Fill in after completing the steps above.

| Check | Command | Expected Result | ⚙️ Result |
|-------|---------|-----------------|----------|
| Static IP configured | `ip addr show` | 192.168.1.10/24 | |
| SSH accessible | `ssh admin@192.168.1.10` | Login prompt | |
| Internet access | `ping -c 4 8.8.8.8` | 0% packet loss | |
| DNS working | `ping -c 4 google.com` | Resolves and replies | |
| UFW enabled | `sudo ufw status` | Status: active | |

---

## Next Steps

- Configure Samba file sharing → `samba-shared-folder-setup.md`
- Configure automated backups → `backup-strategy.md`
- Configure remote access hardening → `remote-access.md`
