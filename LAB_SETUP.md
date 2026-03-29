# LAB Setup

## Junior IT Support Home Lab

This document describes the current live lab environment, the verified baseline, and the next manual steps that still remain.

---

## Lab Overview

The lab simulates a small office environment with:

- an Ubuntu Server VM acting as a file server
- a Windows 10 VM acting as a workstation
- VirtualBox networking using NAT plus Host-only
- SSH enabled on the server for remote administration
- Samba configured for Windows-to-Linux file sharing

---

## Current Virtual Machines

### Ubuntu Server

- **Hostname:** `office-srv-01`
- **Role:** file server
- **Operating System:** Ubuntu Server
- **Host-only IP:** `192.168.56.101`

### Windows Workstation

- **Hostname:** `office-pc-01`
- **Role:** client workstation
- **Operating System:** Windows 10
- **Host-only IP:** `192.168.56.102`

---

## Network Configuration

Both virtual machines use the same VirtualBox layout:

- **Adapter 1:** NAT
- **Adapter 2:** Host-only

This provides:

- outbound internet access through NAT
- direct VM-to-VM communication through the Host-only network

### Current Lab IP Addresses

- `office-srv-01` -> `192.168.56.101`
- `office-pc-01` -> `192.168.56.102`

---

## Services Configured

### SSH on Ubuntu Server

**Status:** working

Purpose:

- remote administration of the Ubuntu server
- basic IT support and sysadmin practice
- secure command-line access

### Samba File Share

**Share name:** `companydocs`  
**Network path:** `\\192.168.56.101\companydocs`  
**Status:** working

Purpose:

- file sharing between Linux and Windows
- practice with network shares and troubleshooting
- simulating a small office shared folder

---

## Validation Completed

The following checks have already been completed successfully:

### 1. Network Communication

- Ubuntu Server and Windows 10 workstation can communicate over the Host-only network
- both systems have assigned IP addresses in the `192.168.56.x` range

### 2. SSH Access

- SSH is enabled on Ubuntu
- remote access to the server is working

### 3. Samba Access from Windows

- the Windows workstation can open `\\192.168.56.101\companydocs`

### 4. File Write Test from Windows

- `windows-test.txt` was created successfully from Windows inside the share

### 5. Completed Incident Testing

- Incident 01 tested service outage recovery
- Incident 02 tested share-name configuration mismatch
- Incident 03 tested Linux permissions on `/srv/companydocs/Shared`
- Incident 04 tested firewall filtering of SMB traffic

---

## Shared Folder Notes

| Item | Value |
|------|-------|
| Server Hostname | `office-srv-01` |
| Server IP | `192.168.56.101` |
| Client Hostname | `office-pc-01` |
| Client IP | `192.168.56.102` |
| Share Name | `companydocs` |
| Share Path | `\\192.168.56.101\companydocs` |
| Documented Linux subfolder | `/srv/companydocs/Shared` |
| Validation file | `windows-test.txt` |

---

## Current Lab State

At this stage, the lab includes:

- Ubuntu Server VM deployed and configured
- Windows 10 VM deployed and configured
- NAT and Host-only networking in place
- SSH enabled on Ubuntu
- Samba configured and accessible from Windows
- successful file creation through the network share
- four completed incident scenarios with screenshot evidence

---

## Next Possible Steps

Suggested next improvements for the lab:

1. Document the live Samba configuration block in more detail
2. Add a Windows software-installation incident with evidence
3. Record host hardware details and verified software versions
4. Configure and verify backup automation
5. Add a second Windows user or onboarding scenario

---

## Status

**Lab setup status:** completed for the current phase  
**Environment status:** working and validated
