# Project Overview

---

## Overview

This project is a small home lab designed to simulate a basic office IT environment.

The current real lab uses two virtual machines in VirtualBox:

- an **Ubuntu Server** VM acting as a file server
- a **Windows 10 workstation** VM acting as a client PC

The project is intended to demonstrate practical junior IT support skills through real system configuration, connectivity testing, file sharing, validation, and documentation.

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

## Services Configured

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

These checks confirm that the core lab is functional.

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

## Portfolio Value

This project is suitable for a junior IT support portfolio because it demonstrates:

- initiative in building a working lab independently
- practical experience across Windows and Linux
- ability to configure and verify core services
- ability to document technical work in a clear, beginner-friendly format

It is especially relevant to entry-level roles such as desktop support, helpdesk, junior IT support, and junior systems support.

---

## Planned Next Steps

The next planned phase of the lab includes:

- a Windows software-installation incident with evidence capture
- documenting the live Samba configuration in more detail
- recording verified software versions and host hardware details
- backup automation after it is configured and tested

---

## Conclusion

The **Junior IT Support Home Lab** is a practical project focused on real setup and verification rather than theory alone.

It already demonstrates a working small-office-style support environment and creates a solid base for future troubleshooting scenarios and support documentation.
