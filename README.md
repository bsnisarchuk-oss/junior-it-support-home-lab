# Junior IT Support Home Lab

A practical home lab project built to simulate a small office IT environment and document core junior IT support work.

---

## Project Goal

This repository documents a real two-VM lab built in VirtualBox. The goal is to show hands-on ability in areas such as:

- virtual machine deployment
- VirtualBox networking
- basic Linux administration
- SSH remote access
- Samba file sharing
- Windows-to-Linux connectivity
- troubleshooting and validation

---

## Current Real Lab

### Ubuntu Server VM

- **Hostname:** `office-srv-01`
- **Role:** File server
- **OS:** Ubuntu Server
- **IP Address:** `192.168.56.101`

### Windows Workstation VM

- **Hostname:** `office-pc-01`
- **Role:** Client workstation
- **OS:** Windows 10
- **IP Address:** `192.168.56.102`

### VirtualBox Networking

- **Adapter 1:** NAT
- **Adapter 2:** Host-only

This setup provides outbound internet access through NAT and private VM-to-VM communication through the host-only network.

---

## Services Verified

- SSH is enabled and working on `office-srv-01`
- Samba is configured and working on `office-srv-01`
- The Windows workstation can open `\\192.168.56.101\companydocs`
- A file named `windows-test.txt` was created from Windows inside the shared folder

These checks confirm that the current lab is working.

---

## Incident 01 - Samba service outage

### Summary

A safe incident was simulated in which the Windows workstation lost access to the shared network folder hosted on the Ubuntu server.

### Affected service

Samba shared folder: `\\192.168.56.101\companydocs`

### Lab devices

- `office-srv-01` - Ubuntu Server
- `office-pc-01` - Windows 10

### Issue

The Windows client could no longer open the shared folder and displayed a network access error.

### Troubleshooting

- Confirmed the share was working before the incident
- Reproduced the issue from the Windows workstation
- Verified network connectivity with `ping 192.168.56.101`
- Confirmed the server was reachable
- Checked the Samba service status on Ubuntu

### Root cause

The Samba service (`smbd`) was stopped on `office-srv-01`.

### Resolution

The issue was resolved by starting the Samba service again:

```bash
sudo systemctl start smbd
sudo systemctl status smbd
```

### Outcome

- `smbd` returned to `active (running)`
- The Windows workstation regained access to `\\192.168.56.101\companydocs`

### Evidence

- `screenshots/incidents/incident_01/01-before-incident-share-working.png`
- `screenshots/incidents/incident_01/02-smbd-stopped-on-server.png`
- `screenshots/incidents/incident_01/03-windows-cannot-open-share.png`
- `screenshots/incidents/incident_01/04-ping-server-success.png`
- `screenshots/incidents/incident_01/05-smbd-running-again.png`
- `screenshots/incidents/incident_01/06-share-restored-after-fix.png`

### Skills demonstrated

- Incident simulation
- Windows troubleshooting
- Network diagnostics
- Linux service management
- Root cause analysis
- Service restoration

---

## Incident 02 - Wrong share name in smb.conf

A Samba share configuration issue was simulated by changing the share name in `smb.conf`.

### Scenario

- The original Samba share `[companydocs]` was temporarily renamed to `[companydocs_disabled]`
- Samba service (`smbd`) remained active and running
- The Windows workstation could still reach the server over the network
- However, the expected network path `\\192.168.56.101\companydocs` was no longer available

### Symptoms observed

- `ping 192.168.56.101` succeeded
- Samba service was running normally
- Windows could not open `\\192.168.56.101\companydocs`
- The issue was not caused by network failure or service outage

### Root cause

The expected share name was changed in Samba configuration, so the Windows workstation was trying to access a share path that no longer existed.

### Diagnosis steps

- Verified server connectivity from Windows
- Confirmed `smbd` was active using `systemctl status smbd`
- Reviewed Samba configuration
- Identified that the share name had been changed from `[companydocs]` to `[companydocs_disabled]`

### Fix applied

The original share name `[companydocs]` was restored in `smb.conf`, and Samba configuration returned to the expected baseline.

### Result

- `\\192.168.56.101\companydocs` became accessible again
- Normal shared-folder access was restored from the Windows workstation

---

## Incident 03 - Shared folder permissions issue

A permissions issue was simulated on the Samba-backed shared folder `/srv/companydocs/Shared`.

### Scenario

- The network path `\\192.168.56.101\companydocs\Shared` remained reachable from the Windows workstation
- Samba service (`smbd`) remained active and running
- The user could open the shared folder and view existing files
- However, write operations failed due to incorrect Linux permissions on the `Shared` directory

### Symptoms observed

- Windows could browse the share successfully
- Creating a new file in `Shared` returned a permissions error
- Server connectivity remained healthy
- Samba service was not down

### Root cause

Incorrect Linux permissions were applied to `/srv/companydocs/Shared`, removing write access while keeping the share available over the network.

### Diagnosis steps

- Verified that `smbd` was active (`systemctl status smbd`)
- Confirmed the shared folder path still existed
- Checked directory permissions with `ls -ld /srv/companydocs/Shared`
- Checked directory metadata with `stat /srv/companydocs/Shared`
- Identified that permissions had changed from `0775` to `0555`

### Fix applied

Write permissions were restored on the shared folder using:

```bash
sudo chmod 0775 /srv/companydocs/Shared
```

### Result

- Write access to `\\192.168.56.101\companydocs\Shared` was restored
- A new file was successfully created from the Windows workstation
- Baseline functionality was fully recovered

---

## Incident 04 - Firewall blocks SMB access

This incident simulated a network-level access problem where the Samba service stayed healthy, but SMB traffic from the Windows client was blocked by a temporary firewall rule on the Ubuntu server.

### Scenario

- Ubuntu Server (`office-srv-01`) continued running normally
- `smbd` remained `active (running)`
- TCP port `445` was listening
- Windows 10 client (`office-pc-01`) could still reach the server by network
- Access to `\\192.168.56.101\companydocs` failed during the incident

### Root cause

A temporary `iptables` rule was added on the Ubuntu server to drop inbound TCP traffic on port `445` from the Windows client IP (`192.168.56.102`).

### Troubleshooting logic

- Verified Samba service status on Ubuntu
- Verified SMB port `445` was listening before the incident
- Confirmed the share opened normally before the change
- Added a firewall rule blocking SMB traffic from the Windows VM
- Reproduced the access failure from Windows
- Confirmed `smbd` was still `active (running)` during the failure
- Removed the firewall rule
- Verified the share opened again
- Confirmed write access was restored by creating `incident04-restart.txt` in `Shared`

### Commands used

```bash
sudo systemctl status smbd --no-pager
sudo ss -tulpn | grep :445
sudo iptables -I INPUT 1 -s 192.168.56.102 -p tcp --dport 445 -j DROP
sudo iptables -L INPUT -n --line-numbers
sudo iptables -D INPUT -s 192.168.56.102 -p tcp --dport 445 -j DROP
```

### Result

The incident demonstrated that share access problems can be caused by firewall filtering even when:

- the server is reachable
- Samba is running
- the share configuration itself has not changed

This scenario helped reinforce the difference between:

- service availability
- share configuration
- file permissions
- network/firewall access control

---

## Skills Demonstrated

- VirtualBox VM setup
- internal network verification
- IP-based connectivity testing
- Ubuntu Server administration
- SSH validation
- Samba share validation
- Windows access to Linux-hosted file shares
- clear technical documentation

---

## Repository Structure

```text
junior-it-support-home-lab/
|-- README.md
|-- PROJECT_OVERVIEW.md
|-- LAB_SETUP.md
|-- PROGRESS.md
|-- REQUIREMENTS.md
|-- NETWORK_DIAGRAM.md
|-- docs/
|   |-- incidents/
|   |-- inventory/
|   |-- network/
|   |-- server/
|   `-- workstation/
|-- screenshots/
|   |-- incidents/
|   |-- network/
|   |-- server/
|   `-- workstation/
|-- scripts/
|   |-- linux/
|   `-- windows/
`-- templates/
```

---

## Current Status

Completed and verified:

- Ubuntu Server VM deployed
- Windows 10 VM deployed
- NAT and Host-only networking in place
- Host-only connectivity working between the VMs
- SSH working on the server
- Samba working on the server
- Windows access to `\\192.168.56.101\companydocs`
- Incident 01 documented with troubleshooting evidence
- initial screenshot evidence captured

Planned next steps:

- document additional incident scenarios in `screenshots/incidents/`
- document the live Samba configuration in more detail
- test permissions more deeply
- document backup automation after it is configured on the live server

---

## Why This Project Matters

This lab is designed as a portfolio project for junior IT support roles. It demonstrates the ability to:

- build a working lab from scratch
- work across Windows and Linux
- verify services and connectivity
- document real technical work clearly

The focus is practical fundamentals rather than enterprise-scale tooling.
