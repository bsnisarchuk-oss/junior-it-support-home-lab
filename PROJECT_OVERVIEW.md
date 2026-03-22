# Project Overview

## Purpose

This project simulates the IT environment of a small company (5–10 employees).
The goal is to practice and document the day-to-day tasks a Junior IT Support Engineer would handle:
setting up workstations, maintaining a file server, troubleshooting network issues, and responding to incidents.

Everything in this lab is built from scratch in a local virtual environment.
No AI-generated screenshots. No fake test results. Steps that require hands-on work are clearly marked.

---

## Lab Environment

| Component | Details |
|-----------|---------|
| Hypervisor | VirtualBox or VMware Workstation (host: Windows 11) |
| Server | Ubuntu Server 22.04 LTS — 1 VM |
| Workstations | Windows 11 — 2 VMs |
| Network | 192.168.1.0/24, static IPs |
| File Sharing | Samba (SMB) |
| Backups | rsync + cron (daily, 7-day retention) |
| Remote Access | SSH |

---

## Learning Objectives

### Windows Workstation Support
- Set up a new Windows workstation from scratch
- Create and configure local user accounts
- Install standard business software using winget / PowerShell
- Map network drives to a Samba share
- Enable and test Remote Desktop

### Linux Server Administration
- Install and configure Ubuntu Server 22.04
- Configure static IP using Netplan
- Manage services with systemctl
- Configure UFW firewall rules
- Set up Samba for Windows file sharing
- Write and schedule Bash scripts with cron

### Networking
- Design and document a basic office IP addressing plan
- Understand DHCP vs static IP assignment
- Troubleshoot connectivity using ping, traceroute, nslookup
- Identify and fix common DNS and gateway issues

### Incident Management
- Follow a structured troubleshooting approach (OSI layer model)
- Document incidents in a standard format (report, root cause, resolution)
- Reproduce common IT support issues in a lab environment
- Write clear, professional incident reports

### Scripting and Automation
- Write PowerShell scripts for workstation setup and info collection
- Write Bash scripts for server setup and backup automation
- Schedule automated tasks using cron (Linux) and Task Scheduler (Windows)

---

## Project Scope

**In scope:**
- 1 Ubuntu Server acting as a file and backup server
- 2 Windows workstations
- Simulated incidents covering the most common junior IT support scenarios
- All documentation, scripts, and checklists needed to reproduce the lab

**Out of scope:**
- Active Directory / domain environment (planned for a future project)
- Cloud infrastructure
- Enterprise monitoring tools

---

## Tech Stack

| Technology | Purpose |
|------------|---------|
| Ubuntu Server 22.04 | Server OS |
| Windows 11 | Workstation OS |
| VirtualBox / VMware | Virtualization |
| Samba | Windows-compatible file sharing |
| OpenSSH | Remote server access |
| rsync | File backup |
| cron | Task scheduling |
| UFW | Linux firewall |
| PowerShell | Windows scripting |
| Bash | Linux scripting |
| winget | Windows package manager |
| Markdown | Documentation |
| Git + GitHub | Version control and portfolio |

---

## Success Criteria

- [ ] Ubuntu Server accessible via SSH with static IP
- [ ] Samba shared folder accessible from both Windows workstations
- [ ] Automated backup running on schedule with log output
- [ ] Both Windows workstations set up with standard software
- [ ] All 4 incidents reproduced, investigated, and resolved
- [ ] All documentation filled in with real lab results and screenshots
