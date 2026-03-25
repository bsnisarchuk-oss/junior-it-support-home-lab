# Hardware Inventory

This file records the current verified lab hardware and virtual machine inventory.

---

## Host Machine

Host machine details are still to be filled in manually.

| Component | Specification |
|-----------|---------------|
| Manufacturer / Model | _(fill in)_ |
| CPU | _(fill in)_ |
| RAM | _(fill in)_ |
| Disk | _(fill in)_ |
| Host OS | _(fill in)_ |
| Hypervisor | `VirtualBox` |

---

## Current Virtual Machines

| ID | Hostname | OS | Role | Current IP | Status | Notes |
|----|----------|----|------|------------|--------|-------|
| VM-001 | `office-srv-01` | Ubuntu Server | File server | `192.168.56.101` | Verified active | SSH and Samba working |
| VM-002 | `office-pc-01` | Windows 10 | Workstation | `192.168.56.102` | Verified active | Accesses `\\192.168.56.101\companydocs` |

---

## Virtual Networking

| Adapter | Mode | Purpose |
|---------|------|---------|
| Adapter 1 | NAT | Outbound internet access |
| Adapter 2 | Host-only | Internal communication between `office-srv-01` and `office-pc-01` |

---

## Change Log

| Date | Change |
|------|--------|
| 2026-03-22 | Initial inventory file created |
| 2026-03-25 | Inventory aligned to the current verified two-VM lab |
