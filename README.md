# Junior IT Support Home Lab

A hands-on home lab built to demonstrate junior IT support skills through real setup, validation, troubleshooting, and documentation.

This project is aimed at entry-level IT support, helpdesk, and junior support engineer roles. It focuses on practical Windows-to-Linux support work rather than theory alone.

---

## Why This Project Matters

The lab shows evidence of real support-style work:

- building and validating a two-VM environment in VirtualBox
- configuring SSH and Samba on Ubuntu Server
- verifying Windows client connectivity and file-share access
- reproducing safe incident scenarios and documenting root cause, fix, and validation
- capturing screenshot evidence from the live lab

---

## Current Lab Snapshot

| Item | Value |
|------|-------|
| Ubuntu Server VM | `office-srv-01` |
| Windows Workstation VM | `office-pc-01` |
| Server IP | `192.168.56.101` |
| Workstation IP | `192.168.56.102` |
| Networking | VirtualBox NAT + Host-only |
| SSH | Working |
| Samba | Working |
| Windows share path | `\\192.168.56.101\companydocs` |
| Verified Windows write test | `windows-test.txt` |

---

## Verified Hands-On Work

- deployed and configured Ubuntu Server and Windows 10 VMs
- validated host-only communication between the two VMs
- enabled and verified SSH access to the Ubuntu server
- configured a Samba share and verified access from Windows
- created a file from Windows inside the shared folder
- completed four incident simulations with troubleshooting evidence

---

## Completed Incidents

The incidents below were actually reproduced, investigated, fixed, and validated in the live lab.

| Incident | What failed | Root cause layer | Result | Report | Evidence |
|----------|-------------|------------------|--------|--------|----------|
| 01 | Windows could not open the share | service outage | Samba access restored after starting `smbd` | [incident-01-samba-service-outage.md](docs/incidents/completed/incident-01-samba-service-outage.md) | [incident_01](screenshots/incidents/incident_01/) |
| 02 | Expected share path no longer existed | Samba config / share name | Access restored after fixing `smb.conf` | [incident-02-wrong-share-name-in-smb-conf.md](docs/incidents/completed/incident-02-wrong-share-name-in-smb-conf.md) | [incident_02](screenshots/incidents/incident_02/) |
| 03 | Share opened but file creation failed | Linux file permissions | Write access restored on `Shared` | [incident-03-shared-folder-permissions-issue.md](docs/incidents/completed/incident-03-shared-folder-permissions-issue.md) | [incident_03](screenshots/incidents/incident_03/) |
| 04 | Share access failed while Samba stayed healthy | network / firewall filtering | SMB access restored after removing temporary firewall block | [incident-04-firewall-blocks-smb-access.md](docs/incidents/completed/incident-04-firewall-blocks-smb-access.md) | [incident_04](screenshots/incidents/incident_04/) |

---

## Evidence

The repository contains real screenshot evidence from the live lab:

- [screenshots/server/](screenshots/server/) - Ubuntu Server validation
- [screenshots/workstation/](screenshots/workstation/) - Windows workstation validation
- [screenshots/incidents/](screenshots/incidents/) - completed incident evidence grouped by scenario

The incident reports and screenshot folders are the strongest proof that the project was actually run and tested.

---

## Key Documentation

| File | Purpose |
|------|---------|
| [LAB_SETUP.md](LAB_SETUP.md) | current environment baseline |
| [PROGRESS.md](PROGRESS.md) | dated record of completed work and remaining tasks |
| [docs/incidents/README.md](docs/incidents/README.md) | completed incidents, future scenarios, and structure |
| [docs/server/samba-shared-folder-setup.md](docs/server/samba-shared-folder-setup.md) | current Samba reference |
| [docs/workstation/troubleshooting-workstation.md](docs/workstation/troubleshooting-workstation.md) | Windows-side troubleshooting notes |
| [NETWORK_DIAGRAM.md](NETWORK_DIAGRAM.md) | simple topology overview |

---

## Next Improvements

- run a Windows software-installation incident and capture evidence
- document the live Samba configuration block in more detail
- record host hardware details and verified software versions
- configure and validate backup automation

---

## Portfolio Focus

This project is designed to support applications for junior IT support roles by showing:

- practical troubleshooting across Windows and Linux
- clear, structured technical documentation
- evidence-based validation instead of unsupported claims
- safe incident simulation and recovery
