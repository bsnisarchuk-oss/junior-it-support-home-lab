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

- `screenshots/incidents/01-before-incident-share-working.png`
- `screenshots/incidents/02-smbd-stopped-on-server.png`
- `screenshots/incidents/03-windows-cannot-open-share.png`
- `screenshots/incidents/04-ping-server-success.png`
- `screenshots/incidents/05-smbd-running-again.png`
- `screenshots/incidents/06-share-restored-after-fix.png`

### Skills demonstrated

- Incident simulation
- Windows troubleshooting
- Network diagnostics
- Linux service management
- Root cause analysis
- Service restoration

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
