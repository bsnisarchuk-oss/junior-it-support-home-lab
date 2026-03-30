# Hardware Inventory

This file records the current verified lab assets and keeps the live virtual machines separate from host-machine details that still need to be recorded manually.

---

## Host Machine

Host machine details are still to be filled in manually from the real PC that runs VirtualBox. They are intentionally left blank until they are checked directly on the host.

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

## Inventory Notes

- the VM inventory above is the most important hardware evidence for the portfolio because it is supported by screenshots and incident reports
- host machine details can be added later, but missing host specs do not change the truth of the documented lab work
- if a VM is rebuilt later, update the hostname, IP, and notes here at the same time

---

## Change Log

| Date | Change |
|------|--------|
| 2026-03-22 | Initial inventory file created |
| 2026-03-25 | Inventory aligned to the current verified two-VM lab |
| 2026-03-30 | Notes expanded to separate verified VM inventory from still-manual host details |
