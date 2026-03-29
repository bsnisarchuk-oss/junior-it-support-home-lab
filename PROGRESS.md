# Project Progress

This file tracks the real current state of the lab, what has already been completed, and what is still planned.

**Last updated:** 2026-03-29

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
- Incident 01 completed and documented with evidence
- Incident 03 completed with shared-folder permissions troubleshooting
- repository documentation aligned to the current real lab

---

## Day 5 - Incident 01: Samba service outage

Today I completed the first safe incident simulation in the lab.

### Incident

The Windows workstation `office-pc-01` could not access the shared folder:

`\\192.168.56.101\companydocs`

### Troubleshooting steps

- Confirmed the shared folder was working before the incident
- Reproduced the issue on Windows
- Verified connectivity with `ping 192.168.56.101`
- Confirmed the server was reachable
- Checked the Samba service status on Ubuntu

### Root cause

The Samba service (`smbd`) was stopped on `office-srv-01`.

### Resolution

Restarted the Samba service on the Ubuntu server and confirmed it returned to `active (running)`.

### Result

Access to `\\192.168.56.101\companydocs` was restored successfully.

### Evidence

- `screenshots/incidents/01-before-incident-share-working.png`
- `screenshots/incidents/02-smbd-stopped-on-server.png`
- `screenshots/incidents/03-windows-cannot-open-share.png`
- `screenshots/incidents/04-ping-server-success.png`
- `screenshots/incidents/05-smbd-running-again.png`
- `screenshots/incidents/06-share-restored-after-fix.png`

---

## Day 6 - Incident 03: Shared folder permissions issue

Completed Incident 03 by simulating a write-permissions problem on the Samba shared folder.

### What was tested

- The shared folder remained reachable from Windows
- Samba service stayed active and running
- Existing files in the share were visible
- New file creation failed because write permissions were removed from `/srv/companydocs/Shared`

### Actions performed

- Recorded the working baseline permissions for the shared folder
- Removed write permissions from the Linux directory
- Reproduced the issue from the Windows workstation
- Confirmed that the share opened but file creation failed
- Verified that `smbd` was still running
- Checked the directory with `ls -ld` and `stat`
- Restored permissions back to `0775`
- Verified successful file creation after the fix

### Outcome

This incident demonstrated basic troubleshooting of file share permission issues by separating:

- network connectivity
- service availability
- share configuration
- underlying filesystem permissions

### Evidence captured

- broken directory permissions on Ubuntu
- access denied error in Windows
- restored permissions on Ubuntu
- successful file creation after the fix

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
- `screenshots/incidents/` contains Incident 01 troubleshooting and recovery evidence
- the current evidence set covers hostname checks, IP checks, connectivity checks, SSH status, Samba status, share access, and the Windows file write test

---

## Remaining Manual Tasks

The following work still needs to be done manually in the live lab:

- reproduce incident scenarios and document the results
- document the live Samba server-side path directly from the running server
- test Samba permissions more deeply
- configure and verify backup automation on the live server
- update hardware and software inventory details after manual verification

---

## Next Planned Step

- document the live Samba server-side path directly from the running server

---

## Later Planned Work

- deeper Samba documentation and permission testing
- backup workflow design, implementation, and validation
- inventory refinement and additional validation evidence

---

## Notes

- this log is intentionally based on verified current state, not on older planning drafts
- planned work is listed separately from completed work to keep the portfolio credible
