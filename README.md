# Junior IT Support Home Lab

A self-built home lab project simulating a small business IT environment.
Built to practice and document real-world IT support skills for a Junior IT Engineer role.

> **Status:** In progress — Day 1 complete (infrastructure planned, documentation started)

---

## What This Project Covers

| Area | Skills Practiced |
|------|-----------------|
| Windows Workstations | Setup, user onboarding, software deployment |
| Linux Server (Ubuntu) | SSH, Samba file sharing, cron, UFW firewall |
| Networking | IP planning, DNS, DHCP, connectivity troubleshooting |
| Incident Response | Documenting and resolving simulated IT issues |
| Scripting | PowerShell (Windows), Bash (Linux) |
| Documentation | IT procedures, checklists, inventory tracking |

---

## Lab Environment

```
[Internet]
     |
  [Router] 192.168.1.1
     |
  [Virtual Switch]
     |
  +-----------------+------------------+
  |                 |                  |
[ubuntu-server]  [win-ws-01]      [win-ws-02]
192.168.1.10     192.168.1.20     192.168.1.21
File + Backup    Workstation       Workstation
```

**Hypervisor:** VirtualBox / VMware Workstation
**Network:** Host-only / Internal Network (192.168.1.0/24)

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

This repo is a living portfolio.
Each folder contains step-by-step guides I follow during lab sessions.
Incidents are documented as they are reproduced and resolved in the lab.
Scripts are tested inside the virtual machines.

---

## Author

Built as a personal learning project for a Junior IT Support / Junior IT Engineer role.
All lab work is performed in a local virtual environment — no production systems involved.
