# LAB_SETUP.md

## Junior IT Support Home Lab

This document describes the current lab environment, completed setup steps, and the verified working state of the project.

---

## Lab Overview

The lab simulates a small office environment with:

- **Ubuntu Server VM** acting as a file server
- **Windows 10 VM** acting as a workstation
- **VirtualBox networking** configured to allow both internet access and internal lab communication
- **SSH** enabled on the server for remote administration
- **Samba** configured to provide a shared folder accessible from Windows

---

## Virtual Machines

### 1. Ubuntu Server
- **Hostname:** `office-srv-01`
- **Role:** File server / administration target
- **Operating System:** Ubuntu Server
- **IP Address:** `192.168.56.101`

### 2. Windows Workstation
- **Hostname:** `office-pc-01`
- **Role:** Client workstation
- **Operating System:** Windows 10
- **IP Address:** `192.168.56.102`

---

## Network Configuration

Both virtual machines use the following VirtualBox network setup:

### Adapter 1: NAT
Used for:
- Internet access
- Package installation
- System updates

### Adapter 2: Host-only Adapter
Used for:
- Communication between lab machines
- Internal testing without relying on external network infrastructure

### Current Lab IP Addresses
- `office-srv-01` → `192.168.56.101`
- `office-pc-01` → `192.168.56.102`

This allows direct connectivity between the server and workstation inside the home lab.

---

## Services Configured

### SSH on Ubuntu Server
SSH has been enabled and verified on `office-srv-01`.

**Status:** Working

Purpose:
- Remote administration of the Ubuntu server
- Basic IT support / sysadmin practice
- Secure command-line access

---

### Samba File Share
Samba has been configured on `office-srv-01` to simulate a shared company folder.

**Share name:** `companydocs`  
**Network path:** `\\192.168.56.101\companydocs`

**Status:** Working

Purpose:
- File sharing between Linux server and Windows workstation
- Practice with network shares and permissions
- Simulate a real office shared folder

---

## Validation Completed

The following tests have already been completed successfully:

### 1. Network Communication
- Ubuntu Server and Windows 10 workstation are on the same host-only network
- Both systems have assigned IP addresses in the `192.168.56.x` range

### 2. SSH Access
- SSH is enabled on Ubuntu
- Remote access to the server is working

### 3. Samba Access from Windows
- The Windows workstation can access the shared folder:
  - `\\192.168.56.101\companydocs`

### 4. File Write Test from Windows
- A test file was successfully created from Windows inside the shared folder:
  - `windows-test.txt`

This confirms:
- Windows can reach the Samba share
- Permissions are functioning correctly for basic file creation
- The lab file-sharing setup is operational

---

## Current Lab State

At this stage, the lab environment is functional and includes:

- Ubuntu Server VM deployed and configured
- Windows 10 VM deployed and configured
- Dual VirtualBox networking in place:
  - NAT
  - Host-only
- Internal IP addressing working correctly
- SSH enabled on Ubuntu
- Samba configured and accessible from Windows
- Successful file creation test completed through the network share

---

## Shared Folder Details

| Item | Value |
|------|-------|
| Server Hostname | `office-srv-01` |
| Server IP | `192.168.56.101` |
| Client Hostname | `office-pc-01` |
| Client IP | `192.168.56.102` |
| Share Name | `companydocs` |
| Share Path | `\\192.168.56.101\companydocs` |
| Test File Created | `windows-test.txt` |

---

## Practical Skills Demonstrated So Far

This lab already demonstrates basic junior IT support skills in the following areas:

- Virtual machine setup
- Host-only and NAT networking in VirtualBox
- Basic IP-based connectivity
- Linux server administration
- Enabling and using SSH
- Configuring Samba shares
- Accessing Linux-hosted shares from Windows
- Basic file access validation across systems

---

## Next Possible Steps

Suggested next improvements for the lab:

1. Add screenshots for each completed step
2. Document Samba configuration details
3. Test folder permissions more deeply
4. Add a second Windows user or permission scenario
5. Simulate common IT support incidents:
   - network issue
   - share access denied
   - incorrect IP configuration
   - service down / restart test

---

## Status

**Lab setup status:** Completed for the current phase  
**Environment status:** Working and validated

---