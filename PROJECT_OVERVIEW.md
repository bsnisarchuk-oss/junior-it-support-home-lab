
---

# `PROJECT_OVERVIEW.md`

```md id="7fa4px"
# PROJECT_OVERVIEW.md

## Project Title

**Junior IT Support Home Lab**

---

## Overview

This project is a small home lab designed to simulate a basic office IT environment.

It uses two virtual machines:

- an **Ubuntu Server** acting as a file server
- a **Windows 10 workstation** acting as a client PC

The lab is built in **VirtualBox** and is intended to demonstrate practical junior IT support skills through real system configuration, connectivity testing, file sharing, and documentation.

---

## Main Objective

The objective of this project is to build and verify a working support lab that reflects common beginner-level IT tasks, including:

- creating and configuring virtual machines
- setting up internal lab networking
- enabling remote administration with SSH
- configuring file sharing with Samba
- connecting a Windows workstation to a Linux-hosted network share
- validating access and functionality

---

## What the Project Does

The project creates a small office-style environment where:

1. the Ubuntu Server provides shared resources
2. the Windows workstation connects to those resources
3. both machines communicate over an isolated internal lab network
4. the server can be remotely managed using SSH
5. shared folder access can be tested from the Windows client

This setup allows practice with basic support tasks that are common in real IT environments.

---

## Current Environment

### Ubuntu Server VM
- **Hostname:** `office-srv-01`
- **Role:** File server
- **IP Address:** `192.168.56.101`

### Windows 10 VM
- **Hostname:** `office-pc-01`
- **Role:** Workstation
- **IP Address:** `192.168.56.102`

### VirtualBox Networking
- **Adapter 1:** NAT
- **Adapter 2:** Host-only

This configuration allows:
- internet access through NAT
- internal communication through Host-only networking

---

## Configured Services

### 1. SSH
SSH is enabled on the Ubuntu server for remote terminal access and administration.

### 2. Samba
Samba is configured on the Ubuntu server to provide a shared folder to the Windows workstation.

- **Share name:** `companydocs`
- **Windows path:** `\\192.168.56.101\companydocs`

---

## Verified Results

The following results have been confirmed:

- both VMs are running correctly
- both systems have working IP addresses on the host-only network
- SSH access to Ubuntu is working
- the Samba share is accessible from Windows
- a file named `windows-test.txt` was successfully created from Windows in the shared folder

These tests confirm that the core lab setup is functional.

---

## Technologies Used

- **VirtualBox**
- **Ubuntu Server**
- **Windows 10**
- **SSH**
- **Samba**
- **Host-only networking**
- **NAT networking**

---

## Skills Practiced

This project helps build practical experience in:

- virtual machine management
- basic network setup
- Linux administration
- Windows client support
- remote access tools
- file sharing and permissions basics
- connectivity validation
- technical documentation

---

## Portfolio Value

This project is suitable for a junior IT support portfolio because it demonstrates:

- initiative in building a lab independently
- understanding of both Windows and Linux environments
- ability to configure and test core services
- ability to document technical work in a clear and structured way

It is especially useful for entry-level roles involving:
- desktop support
- IT support technician work
- helpdesk
- junior systems support

---

## Possible Future Improvements

Planned future additions may include:

- user account and permission testing
- mapped network drives in Windows
- service restart and recovery scenarios
- network troubleshooting tasks
- incident simulation and documentation
- screenshot-based validation evidence
- step-by-step troubleshooting guides

---

## Conclusion

The **Junior IT Support Home Lab** is a practical project focused on real setup and verification rather than theory alone.

It shows the ability to build a small but functional support environment and forms a strong foundation for further expansion into more advanced IT support scenarios.

---