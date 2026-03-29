# Requirements

This file describes what is needed to reproduce or extend the **current** lab environment shown in this repository.

---

## Host Machine Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| CPU | 4 cores with VT-x / AMD-V | 6+ cores |
| RAM | 12 GB | 16 GB |
| Disk | 100 GB free | 150 GB free |
| Host OS | Windows 10 or Windows 11 | Windows 10 or Windows 11 |
| Virtualization | VT-x / AMD-V enabled in BIOS | Required |

Before installing the hypervisor, confirm virtualization is enabled in BIOS or UEFI.
This row refers to the host machine, not to the Windows 10 workstation inside the lab.

---

## Software to Download

| Software | Purpose | Where to Get |
|----------|---------|--------------|
| VirtualBox 7.x | Hypervisor | virtualbox.org |
| Ubuntu Server ISO | Server OS | ubuntu.com/download/server |
| Windows 10 ISO | Workstation OS | microsoft.com/software-download/windows10 |

Do not upload ISO files to this repository.

---

## Current Verified Lab Baseline

The items below are already true in the current live lab:

- [x] Ubuntu Server VM created
- [x] Windows 10 VM created
- [x] Ubuntu hostname set to `office-srv-01`
- [x] Windows hostname set to `office-pc-01`
- [x] VirtualBox Adapter 1 set to NAT on both VMs
- [x] VirtualBox Adapter 2 set to Host-only on both VMs
- [x] `office-srv-01` reachable at `192.168.56.101`
- [x] `office-pc-01` reachable at `192.168.56.102`
- [x] SSH working on the Ubuntu server
- [x] Samba working on the Ubuntu server
- [x] Windows can open `\\192.168.56.101\companydocs`
- [x] `windows-test.txt` was created from Windows in the shared folder

---

## Planned Next Work

The items below are **not** yet marked complete in the current lab and still require manual work:

- [ ] define and test a software-installation incident on the current workstation
- [ ] configure and test backup automation on the live server
- [ ] capture the live Samba config block and document the share mapping more explicitly
- [ ] expand inventory with host hardware details and verified software versions

---

## Skills Prerequisites

You do not need to be an expert. This lab is aimed at beginner-level IT support practice.

Helpful background knowledge:

- using Windows settings, File Explorer, and PowerShell
- basic Linux terminal usage
- basic networking concepts such as IP addressing, DNS, and service ports
