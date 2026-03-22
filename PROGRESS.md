# Lab Progress Diary

A running log of what was done each lab session.
Honest record — includes what worked, what didn't, and what's next.

---

## Day 1 — Planning and Documentation Setup

**Date:** 2026-03-22
**Session length:** ~2 hours
**Focus:** Repository structure, network plan, documentation skeleton

### What I Did

- Created GitHub repository: `junior-it-support-home-lab`
- Planned the lab topology (1 server + 2 workstations, 192.168.1.0/24)
- Designed IP addressing plan and network diagram
- Created documentation skeleton for all lab areas
- Wrote setup guides, checklists, and incident templates
- Wrote automation scripts (Bash + PowerShell) — not yet tested in VMs

### What's Ready

- [x] Full folder structure created
- [x] IP plan and network diagram written
- [x] Ubuntu server setup guide written
- [x] Windows workstation setup guide written
- [x] Samba configuration guide written
- [x] Backup strategy documented
- [x] All 4 incident reports prepared (scenarios defined)
- [x] Hardware and software inventory started
- [x] PowerShell and Bash scripts written

### What's Pending (manual lab work)

- [ ] Install VirtualBox and create VMs
- [ ] Install Ubuntu Server 22.04 on `ubuntu-server` VM
- [ ] Configure static IP on Ubuntu Server
- [ ] Connect from host via SSH
- [ ] Install Windows 11 on workstation VMs
- [ ] Verify network connectivity between VMs
- [ ] Add screenshots as evidence

### Blockers / Notes

- No blockers. Day 1 is documentation only.
- Next session: focus on getting Ubuntu Server running and SSH confirmed.

---

## Day 2 — Ubuntu Server Setup

**Date:** _(to be filled in)_
**Session length:** _(to be filled in)_
**Focus:** Ubuntu Server installation and SSH access

### Steps to Complete

> **These steps must be completed manually in the virtual machine.**

- [ ] Create VM in VirtualBox: 2 vCPU, 2GB RAM, 20GB disk
- [ ] Boot from Ubuntu Server 22.04 LTS ISO
- [ ] Complete installation wizard (hostname: `ubuntu-server`, create `admin` user)
- [ ] Enable OpenSSH during installation
- [ ] Boot into the new system
- [ ] Run: `sudo apt update && sudo apt upgrade -y`
- [ ] Configure static IP using Netplan (see `docs/server/ubuntu-server-setup.md`)
- [ ] Verify static IP: `ip addr show`
- [ ] Connect via SSH from host machine: `ssh admin@192.168.1.10`
- [ ] Take screenshot of successful SSH session → `screenshots/server/ssh-login.png`

### What Was Done

_(fill in after session)_

### Issues Encountered

_(fill in after session)_

---

## Day 3 — Samba File Server + Windows Workstation

**Date:** _(to be filled in)_
**Session length:** _(to be filled in)_
**Focus:** File sharing and Windows workstation setup

### Steps to Complete

> **These steps must be completed manually in the virtual machine.**

#### Ubuntu Server
- [ ] Run `scripts/linux/setup-samba.sh` as root
- [ ] Run `scripts/linux/create-shared-structure.sh` as root
- [ ] Allow Samba through UFW: `sudo ufw allow samba`
- [ ] Verify Samba is running: `sudo systemctl status smbd`
- [ ] Take screenshot → `screenshots/server/samba-status.png`

#### Windows Workstation
- [ ] Create VM: 2 vCPU, 4GB RAM, 40GB disk
- [ ] Install Windows 11
- [ ] Set computer name to `WIN-WS-01`
- [ ] Configure static IP: 192.168.1.20
- [ ] Run `scripts/windows/workstation-prep.ps1` as Administrator
- [ ] Run `scripts/windows/install-common-software.ps1` as Administrator
- [ ] Map network drive to `\\192.168.1.10\Shared` as drive `Z:`
- [ ] Verify access to shared folder
- [ ] Take screenshot → `screenshots/workstation/network-drive-mapped.png`

### What Was Done

_(fill in after session)_

### Issues Encountered

_(fill in after session)_

---

## Day 4 — Backup Automation

**Date:** _(to be filled in)_
**Session length:** _(to be filled in)_
**Focus:** Automated daily backup with cron

### Steps to Complete

> **These steps must be completed manually on the Ubuntu Server.**

- [ ] Copy `scripts/linux/backup-docs.sh` to `/opt/scripts/`
- [ ] Make it executable: `chmod +x /opt/scripts/backup-docs.sh`
- [ ] Run it manually to test: `sudo /opt/scripts/backup-docs.sh`
- [ ] Verify backup created in `/srv/backups/`
- [ ] Set up cron job: `crontab -e`
  ```
  0 2 * * * /opt/scripts/backup-docs.sh >> /var/log/backup.log 2>&1
  ```
- [ ] Wait for next scheduled run OR manually test by changing cron to 1 minute
- [ ] Check log: `tail -20 /var/log/backup.log`
- [ ] Take screenshot → `screenshots/server/backup-log.png`

### What Was Done

_(fill in after session)_

### Issues Encountered

_(fill in after session)_

---

## Day 5 — Incident Simulation and Resolution

**Date:** _(to be filled in)_
**Session length:** _(to be filled in)_
**Focus:** Reproduce and resolve all 4 incidents

### Incidents to Simulate

- [ ] Incident 01: Break and fix internet access (misconfigure gateway/DNS)
- [ ] Incident 02: Break and fix Samba access (stop service or misconfigure UFW)
- [ ] Incident 03: Simulate software install failure (remove admin rights, try install)
- [ ] Incident 04: Break and fix backup job (remove execute permission, corrupt cron)

### What Was Done

_(fill in after session)_

---

_This diary will be updated after each lab session._
