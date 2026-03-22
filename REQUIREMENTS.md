# Requirements

---

## Host Machine Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| CPU | 4 cores with VT-x / AMD-V | 6+ cores |
| RAM | 12 GB | 16 GB |
| Disk | 100 GB free | 150 GB free |
| OS | Windows 10 / Windows 11 | Windows 11 |
| Virtualization | VT-x / AMD-V enabled in BIOS | — |

> ⚙️ Check that virtualization is enabled in BIOS before installing the hypervisor.
> On Intel: look for "Intel Virtualization Technology" → Enable.
> On AMD: look for "SVM Mode" → Enable.

---

## Software to Download

| Software | Purpose | Where to Get |
|----------|---------|--------------|
| VirtualBox 7.x | Hypervisor (free) | virtualbox.org |
| Ubuntu Server 22.04 LTS ISO | Server OS | ubuntu.com/download/server |
| Windows 11 ISO | Workstation OS | microsoft.com/software-download/windows11 |

> Store ISOs in a local folder. Do not upload them to this repository (large files, licensing).

---

## Skills Prerequisites

You do not need to be an expert — this lab is designed for beginners.
Basic familiarity with the following is helpful:

- Using Windows (file manager, settings, command prompt)
- Basic Linux command line (navigating directories, running commands with `sudo`)
- Basic networking concepts (what is an IP address, what is DNS, what is a gateway)

---

## Project Goals Checklist

### Infrastructure
- [ ] VirtualBox installed and Host-only network created
- [ ] Ubuntu Server VM created and OS installed
- [ ] Windows 11 VM (WS-01) created and OS installed
- [ ] Windows 11 VM (WS-02) created and OS installed (optional — clone of WS-01)

### Server Configuration
- [ ] Static IP configured on Ubuntu Server (192.168.1.10)
- [ ] SSH access working from host machine
- [ ] UFW firewall enabled with SSH and Samba rules
- [ ] Samba installed and shared folder accessible from Windows
- [ ] Backup script running and tested manually
- [ ] Backup cron job scheduled and confirmed in log

### Workstation Configuration
- [ ] Static IP configured on WIN-WS-01 (192.168.1.20)
- [ ] Standard software installed on WIN-WS-01
- [ ] Shared folder mapped as Z: drive on WIN-WS-01
- [ ] WIN-WS-02 set up (repeat of WIN-WS-01 steps)

### Documentation and Portfolio
- [ ] All 4 incidents reproduced, investigated, and resolved
- [ ] All incident files filled in (root cause + resolution + screenshots)
- [ ] Inventory updated with actual specs
- [ ] Screenshots taken as evidence for each major step
- [ ] PROGRESS.md updated after each lab session
- [ ] Repository pushed to GitHub
