# Project Overview

---

## Overview

This project is a small home lab built to show practical junior IT support work in a believable office-style environment.

The current lab uses two VirtualBox VMs:

- an **Ubuntu Server** VM acting as a file server
- a **Windows 10 workstation** VM acting as a client PC

The focus is on hands-on validation, troubleshooting, and evidence-backed documentation rather than theory alone.

---

## What Employers Can Verify Quickly

- a working two-VM lab in VirtualBox
- SSH and Samba configured on the Ubuntu server
- Windows access to the `companydocs` share
- completed incidents covering service failure, config error, permissions, and firewall filtering
- screenshot evidence that supports the documented fixes

---

## Current Verified Environment

### Ubuntu Server VM

- **Hostname:** `office-srv-01`
- **Role:** File server
- **IP Address:** `192.168.56.101`

### Windows Workstation VM

- **Hostname:** `office-pc-01`
- **Role:** Client workstation
- **IP Address:** `192.168.56.102`

### VirtualBox Networking

- **Adapter 1:** NAT
- **Adapter 2:** Host-only

This allows the lab to keep outbound internet access while also keeping a dedicated internal connection between the server and workstation.

---

## Services in Use

### SSH

SSH is enabled on the Ubuntu server and working correctly.

### Samba

Samba is configured on the Ubuntu server and is accessible from Windows at:

- `\\192.168.56.101\companydocs`

---

## Verified Results

The following results are already confirmed in the live lab:

- both VMs are running
- both systems can communicate over the host-only network
- SSH access to the Ubuntu server works
- the Samba share opens from Windows
- `windows-test.txt` was created from Windows inside the shared folder

These checks show that the lab is not just planned on paper. The core environment is running, reachable, and tested from both sides.

---

## Completed Troubleshooting Scope

- Incident 01: Samba service outage
- Incident 02: wrong share name in `smb.conf`
- Incident 03: Linux permissions removed from `Shared`
- Incident 04: SMB blocked by a temporary firewall rule

Each completed incident has its own report under `docs/incidents/completed/` and supporting screenshots under `screenshots/incidents/`.

---

## Technologies Used

- VirtualBox
- Ubuntu Server
- Windows 10
- SSH
- Samba
- NAT networking
- Host-only networking

---

## Skills Practiced

- virtual machine management
- network verification
- Linux administration
- Windows workstation support
- remote access validation
- file sharing basics
- troubleshooting
- technical documentation

---

## Why This Helps in Applications

This project is suitable for a junior IT support portfolio because it demonstrates:

- initiative in building a working lab independently
- practical experience across Windows and Linux
- ability to configure and verify core services
- ability to document technical work clearly and honestly

It is especially relevant to entry-level roles such as desktop support, helpdesk, junior IT support, and junior systems support.

---

## Current Gaps and Next Steps

The next planned phase of the lab includes:

- a Windows software-installation incident with evidence capture
- documenting the live Samba configuration in more detail
- recording verified software versions and host hardware details
- backup automation after it is configured and tested
- stronger pre-fix evidence if Incident 03 is reproduced again safely

---

## Summary

The **Junior IT Support Home Lab** already demonstrates a working small-office-style support environment with real troubleshooting history behind it.

It is strongest when reviewed through the completed incident reports and the screenshot evidence that shows the fixes were actually tested.
