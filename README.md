# Junior IT Support Home Lab

A practical home lab project built to simulate a small office IT environment and demonstrate core junior IT support skills.

---

## Project Goal

This lab was created to practice and document real hands-on IT support tasks in a controlled environment using virtual machines.

The goal is to show practical ability in areas such as:

- virtual machine deployment
- network setup in VirtualBox
- basic Linux administration
- SSH remote access
- Samba file sharing
- Windows-to-Linux connectivity
- troubleshooting and validation

---

## Lab Environment

### Virtual Machines

#### Ubuntu Server
- **Hostname:** `office-srv-01`
- **Role:** File server
- **OS:** Ubuntu Server
- **IP Address:** `192.168.56.101`

#### Windows Workstation
- **Hostname:** `office-pc-01`
- **Role:** Client workstation
- **OS:** Windows 10
- **IP Address:** `192.168.56.102`

---

## Network Configuration

The lab uses two VirtualBox adapters on both VMs:

### Adapter 1 — NAT
Used for:
- internet access
- updates
- package installation

### Adapter 2 — Host-only
Used for:
- internal communication between lab machines
- testing local office-style networking

### Current IP Addresses
- `office-srv-01` → `192.168.56.101`
- `office-pc-01` → `192.168.56.102`

---

## Services Configured

### SSH
SSH is enabled on the Ubuntu server and working correctly.

This allows:
- remote administration
- secure terminal access
- practice with server management

### Samba
Samba is configured on the Ubuntu server to provide a shared folder for the Windows workstation.

- **Share Name:** `companydocs`
- **Path from Windows:** `\\192.168.56.101\companydocs`

---

## Validation Completed

The following tasks have been completed and verified:

- Ubuntu Server VM created
- Windows 10 VM created
- NAT + Host-only networking configured
- Internal IP connectivity established
- SSH enabled and working on Ubuntu
- Samba installed and configured
- Windows can access the shared folder
- A file named `windows-test.txt` was created from Windows inside the shared share

This confirms that the core lab environment is functioning correctly.

---

## Skills Demonstrated

This project demonstrates practical beginner-level IT support skills, including:

- VirtualBox VM setup
- internal network configuration
- IP-based connectivity testing
- Linux server setup
- SSH access and verification
- Samba share configuration
- Windows access to Linux-hosted shares
- basic validation of shared folder functionality

---

## Repository Structure

```text
Junior-IT-Support-Home-Lab/
├── README.md
├── PROJECT_OVERVIEW.md
├── LAB_SETUP.md
├── screenshots/
│   ├── server/
│   ├── workstation/
│   ├── network/
│   └── incidents/
└── docs/

Current Project Status
Completed
•	Core lab deployment 
•	Network setup 
•	SSH configuration 
•	Samba file sharing 
•	Windows access test 
•	Initial documentation 

Planned Next Steps
•	add screenshots for each setup stage 
•	document Samba configuration in more detail 
•	test permissions more deeply 
•	simulate common IT support issues 
•	add troubleshooting examples and incident notes 

Why This Project Matters
This lab is designed as a portfolio project for junior IT support roles.
It shows the ability to:
•	build a working lab from scratch 
•	configure systems across Windows and Linux 
•	verify services and connectivity 
•	document technical work clearly

Notes

This project focuses on practical fundamentals rather than advanced enterprise tooling.
The aim is to build strong entry-level support skills through real setup, testing, and documentation.
