# Lab Setup

> **Note:** This file describes the planned lab configuration.
> Actual installation steps are in `docs/server/ubuntu-server-setup.md` and `docs/workstation/new-workstation-setup.md`.
> Steps marked with ⚙️ must be completed manually.

---

## Hypervisor

| Setting | Value |
|---------|-------|
| Software | VirtualBox 7.x (free) or VMware Workstation Pro |
| Host OS | Windows 11 |
| Network Mode | Host-only Adapter or Internal Network |
| Network Name | `LabNetwork` |

**⚙️ To do manually:** Install hypervisor, create a Host-only network with range `192.168.1.0/24`, DHCP disabled.

---

## Virtual Machines

### ubuntu-server

| Setting | Value |
|---------|-------|
| OS | Ubuntu Server 22.04 LTS |
| Role | File server, backup server |
| Hostname | `ubuntu-server` |
| IP | 192.168.1.10 (static) |
| CPU | 2 vCPU |
| RAM | 2 GB |
| Disk | 20 GB (dynamically allocated) |
| Network Adapter | Host-only / Internal |

**⚙️ To do manually:** Create VM with above specs, attach Ubuntu Server 22.04 ISO, complete installation.

---

### win-workstation-01

| Setting | Value |
|---------|-------|
| OS | Windows 11 Home / Pro |
| Role | User workstation |
| Hostname | `WIN-WS-01` |
| IP | 192.168.1.20 (static) |
| CPU | 2 vCPU |
| RAM | 4 GB |
| Disk | 40 GB (dynamically allocated) |
| Network Adapter | Host-only / Internal |

**⚙️ To do manually:** Create VM, install Windows 11, apply workstation setup guide.

---

### win-workstation-02

| Setting | Value |
|---------|-------|
| OS | Windows 11 Home / Pro |
| Role | User workstation |
| Hostname | `WIN-WS-02` |
| IP | 192.168.1.21 (static) |
| CPU | 2 vCPU |
| RAM | 4 GB |
| Disk | 40 GB (dynamically allocated) |
| Network Adapter | Host-only / Internal |

**⚙️ To do manually:** Clone or repeat setup from win-workstation-01.

---

## Host Machine Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| CPU | 4 cores (with VT-x/AMD-V) | 6+ cores |
| RAM | 12 GB | 16 GB |
| Disk | 100 GB free | 150 GB free |
| OS | Windows 10/11 | Windows 11 |

**⚙️ To do manually:** Enable virtualization (VT-x/AMD-V) in BIOS before installing hypervisor.

---

## ISO Files Needed

| File | Download Source |
|------|----------------|
| ubuntu-22.04-live-server-amd64.iso | ubuntu.com/download/server |
| Windows 11 ISO | microsoft.com/software-download/windows11 |

> Store ISOs locally — do not upload to this repository.

---

## Credentials Policy

- Do not commit passwords or usernames to this repository.
- Store lab credentials in a local password manager or a `credentials.txt` file excluded via `.gitignore`.
- Use simple lab credentials (e.g., `admin` / `LabPass123!`) for virtual machines only.
