# Junior IT Support Home Lab

A personal home lab project simulating a small business IT environment.
Built to practice and document real-world IT support skills for a Junior IT Engineer role.

> **Status:** In progress — Day 1 complete (repository structure created, lab plan defined, documentation started)

---

## What This Project Covers

| Area | Skills Practiced |
|------|-------------------|
| Windows Workstation | Setup, user onboarding, software installation |
| Ubuntu Server | SSH, Samba file sharing, basic administration |
| Networking | IP configuration, connectivity checks, DNS troubleshooting |
| Incident Response | Documenting and resolving common IT support issues |
| Scripting | Basic PowerShell and Bash automation |
| Documentation | Checklists, setup notes, inventory tracking |
---

## Lab Environment

This lab is built in a local virtual environment.

### Planned virtual machines
- `office-srv-01` — Ubuntu Server VM
- `office-pc-01` — Windows workstation VM

### Planned network design
- Adapter 1: NAT (internet access for updates)
- Adapter 2: Host-only network (lab communication)

### Planned lab IP addresses
- `office-srv-01` — `192.168.56.10`
- `office-pc-01` — `192.168.56.20`

---

## Repository Structure

```
junior-it-support-home-lab/
├── docs/
│   ├── workstation/     # Windows workstation setup and user guides
│   ├── server/          # Ubuntu server configuration
│   ├── network/         # Network planning and troubleshooting
│   ├── incidents/       # Incident reports (simulated lab scenarios)
│   └── inventory/       # Hardware and software inventory
├── scripts/
│   ├── linux/           # Bash automation scripts
│   └── windows/         # PowerShell automation scripts
├── screenshots/         # Lab evidence (added during hands-on work)
├── templates/           # Reusable doc templates
├── LAB_SETUP.md         # VM specs and hypervisor details
├── NETWORK_DIAGRAM.md   # Full network topology
├── REQUIREMENTS.md      # Prerequisites and goals
├── PROGRESS.md          # Day-by-day lab diary
└── PROJECT_OVERVIEW.md  # Project scope and learning objectives
```

---

## Progress

| Day | Topic | Status |
|-----|-------|--------|
| Day 1 | Repository setup, documentation skeleton, network plan | Done |
| Day 2 | Ubuntu Server install, SSH, static IP | Planned |
| Day 3 | Samba file server, Windows workstation setup | Planned |
| Day 4 | Backup automation, cron jobs | Planned |
| Day 5 | Simulate and resolve incidents 01–04 | Planned |

---

## How to Use This Repo

This repository documents the development of a personal IT support home lab.

- Documentation files describe the planned and completed lab steps
- Scripts are prepared for use during hands-on VM setup
- Screenshots are added as evidence during real lab execution
- Incident reports are completed after reproducing and resolving issues manually

---

## Author

Built as a personal learning project for an entry-level IT support role.
All lab work is performed in a local virtual environment — no production systems involved.
