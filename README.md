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
- initial screenshot evidence captured

Planned next steps:

- reproduce incident scenarios and capture evidence in `screenshots/incidents/`
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
