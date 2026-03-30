# Software Inventory

This file records software that is verified by the current repository evidence and keeps helper tooling separate from anything that is only planned.

---

## Verified in the Current Lab

### `office-srv-01`

| Software | Version | Purpose | Verification status |
|----------|---------|---------|---------------------|
| Ubuntu Server | _(exact version not yet captured in repo)_ | Server OS | Verified running |
| OpenSSH Server | _(exact version not yet captured in repo)_ | Remote administration | Verified working |
| Samba (`smbd`) | _(exact version not yet captured in repo)_ | Windows file sharing | Verified working |

### `office-pc-01`

| Software | Version | Purpose | Verification status |
|----------|---------|---------|---------------------|
| Windows 10 | _(exact version not yet captured in repo)_ | Workstation OS | Verified running |
| Windows PowerShell | _(version not yet captured in repo)_ | Client-side diagnostics and validation commands | Verified in use for lab troubleshooting |

---

## Helper Tooling Aligned to the Current Lab

The items below exist in the repository as helpers, but they are not yet documented as deployed or verified in the live lab:

- `scripts/windows/install-common-software.ps1` for future workstation software testing
- `scripts/linux/backup-docs.sh` aligned to the documented `companydocs` path, but backup automation is still future work
- optional firewall hardening steps in `docs/server/firewall-setup.md`

---

## Still Not Recorded

The items below should remain outside the verified inventory until they are checked directly in the live lab:

- exact OS versions on both VMs
- workstation application inventory
- deployed backup tooling and log location on the server

---

## Notes

- only add software here after it has been checked in the live lab
- keep helper scripts and future ideas separate from verified installed software
- if you later document additional packages, record the actual version where possible

---

## Change Log

| Date | Change |
|------|--------|
| 2026-03-22 | Initial inventory file created |
| 2026-03-25 | Inventory aligned to the current verified lab state |
| 2026-03-30 | Inventory updated to distinguish verified software from helper tooling and still-missing version data |
