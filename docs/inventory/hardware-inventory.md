# Hardware Inventory

> **Status:** Planned configuration — ⚙️ fill in actual specs after VMs are created.

---

## Host Machine

> ⚙️ Fill in your actual host machine specs below.

| Component | Specification |
|-----------|---------------|
| Manufacturer / Model | _(fill in)_ |
| CPU | _(fill in — e.g., Intel Core i7-10700)_ |
| RAM | _(fill in — e.g., 16 GB DDR4)_ |
| Disk | _(fill in — e.g., 512 GB NVMe SSD)_ |
| OS | Windows 11 Home / Pro |
| Hypervisor | VirtualBox 7.x / VMware Workstation |

---

## Virtual Machines

| ID | Hostname | OS | Role | vCPU | RAM | Disk | IP | Status |
|----|----------|----|------|------|-----|------|-----|--------|
| VM-001 | ubuntu-server | Ubuntu Server 22.04 LTS | File server, backup server | 2 | 2 GB | 20 GB | 192.168.1.10 | ⚙️ Planned |
| VM-002 | WIN-WS-01 | Windows 11 | Workstation | 2 | 4 GB | 40 GB | 192.168.1.20 | ⚙️ Planned |
| VM-003 | WIN-WS-02 | Windows 11 | Workstation | 2 | 4 GB | 40 GB | 192.168.1.21 | ⚙️ Planned |

> Update "Status" column as VMs are created: Planned → Created → Configured → Active

---

## Network Devices (Virtual)

| Device | Type | IP | Notes |
|--------|------|----|-------|
| Virtual Router / Gateway | Host-only network gateway | 192.168.1.1 | Provided by hypervisor |
| Virtual Switch | Host-only adapter | — | Internal lab network |

---

## Change Log

> Record any hardware changes here.

| Date | Device | Change | Done by |
|------|--------|--------|---------|
| 2026-03-22 | — | Initial inventory created | Admin |
| _(fill in)_ | VM-001 | VM created in VirtualBox | _(fill in)_ |
| _(fill in)_ | VM-002 | VM created in VirtualBox | _(fill in)_ |
| _(fill in)_ | VM-003 | VM created in VirtualBox | _(fill in)_ |
