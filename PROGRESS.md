# Project Progress

This file tracks the real current state of the lab, what has already been completed, and what is still planned.

**Last updated:** 2026-03-25

---

## Completed and Validated

The following work is already done and verified:

- repository structure created
- core documentation and templates written
- Ubuntu Server VM deployed as `office-srv-01`
- Windows 10 VM deployed as `office-pc-01`
- VirtualBox Adapter 1 verified as NAT on both VMs
- VirtualBox Adapter 2 verified as Host-only on both VMs
- host-only communication working between the two VMs
- SSH enabled and working on `office-srv-01`
- Samba configured and working on `office-srv-01`
- Windows access verified to `\\192.168.56.101\companydocs`
- `windows-test.txt` created from Windows inside the shared folder
- current validation screenshots captured for the server and workstation
- repository documentation aligned to the current real lab

---

## Current Lab State

| Item | Current State |
|------|---------------|
| Ubuntu Server VM | `office-srv-01` |
| Windows workstation VM | `office-pc-01` |
| Server IP | `192.168.56.101` |
| Workstation IP | `192.168.56.102` |
| Adapter 1 | NAT |
| Adapter 2 | Host-only |
| SSH | Working |
| Samba | Working |
| Share path from Windows | `\\192.168.56.101\companydocs` |
| File creation test | `windows-test.txt` created from Windows |
| Evidence captured | `screenshots/server/` and `screenshots/workstation/` |

This is the verified baseline for the project at the moment.

---

## Evidence Collected So Far

- `screenshots/server/` contains current server-side validation evidence
- `screenshots/workstation/` contains current workstation-side validation evidence
- the current evidence set covers hostname checks, IP checks, connectivity checks, SSH status, Samba status, share access, and the Windows file write test

---

## Remaining Manual Tasks

The following work still needs to be done manually in the live lab:

- reproduce incident scenarios and document the results
- capture incident screenshots in `screenshots/incidents/`
- document the live Samba server-side path directly from the running server
- test Samba permissions more deeply
- configure and verify backup automation on the live server
- update hardware and software inventory details after manual verification

---

## Next Planned Step

- reproduce the first real incident scenario and capture troubleshooting evidence in `screenshots/incidents/`

---

## Later Planned Work

- deeper Samba documentation and permission testing
- backup workflow design, implementation, and validation
- inventory refinement and additional validation evidence

---

## Notes

- this log is intentionally based on verified current state, not on older planning drafts
- planned work is listed separately from completed work to keep the portfolio credible
