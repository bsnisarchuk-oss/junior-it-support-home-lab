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
- Incident 02 completed with Samba share-name troubleshooting
- Incident 03 completed with shared-folder permissions troubleshooting
- Incident 04 completed with firewall-based SMB access troubleshooting
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

- `screenshots/incidents/incident_01/01-before-incident-share-working.png`
- `screenshots/incidents/incident_01/02-smbd-stopped-on-server.png`
- `screenshots/incidents/incident_01/03-windows-cannot-open-share.png`
- `screenshots/incidents/incident_01/04-ping-server-success.png`
- `screenshots/incidents/incident_01/05-smbd-running-again.png`
- `screenshots/incidents/incident_01/06-share-restored-after-fix.png`

---

## Day 6 - Incident 02: Wrong share name in smb.conf

Completed Incident 02 by simulating a Samba configuration issue where the expected share name was changed.

### What was tested

- The Samba service remained active
- Network connectivity between Windows and Ubuntu remained healthy
- The expected network path became unavailable due to a configuration mismatch

### Actions performed

- Changed the share name in `smb.conf` from `[companydocs]` to `[companydocs_disabled]`
- Reproduced the problem from the Windows workstation
- Verified that `ping` still worked
- Verified that `smbd` was still running
- Confirmed that the expected share path could not be opened
- Restored the original share name
- Confirmed that access to the shared folder worked again

### Outcome

This incident demonstrated troubleshooting of a Samba share configuration problem by separating:

- network connectivity
- service status
- share-name configuration

### Evidence captured

- running Samba service
- successful ping from Windows
- failed access to `\\192.168.56.101\companydocs`
- restored access after fixing the share name

---

## Day 7 - Incident 03: Shared folder permissions issue

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

## Day 8 - Incident 04: Firewall blocks SMB access

Completed Incident 04 as a safe and reversible Samba troubleshooting scenario.

### Goal

Simulate a case where:

- Samba service is still running
- the server is still reachable
- but Windows cannot access the shared folder because SMB traffic is blocked by a firewall rule

### Baseline checks

Confirmed the lab was healthy before the change:

- `smbd` was `active (running)`
- port `445` was listening on Ubuntu
- `\\192.168.56.101\companydocs` opened successfully from Windows
- baseline share access was working normally

### Fault simulation

Added a temporary `iptables` rule on `office-srv-01`:

```bash
sudo iptables -I INPUT 1 -s 192.168.56.102 -p tcp --dport 445 -j DROP
```

This blocked SMB traffic from the Windows client (`office-pc-01`) to the Ubuntu server without stopping the Samba service.

### Observed symptoms

- Windows failed to open `\\192.168.56.101\companydocs`
- A network access error was shown
- `smbd` remained `active (running)` on Ubuntu
- The issue was isolated to firewall filtering, not service failure

### Recovery

Removed the temporary firewall rule and re-tested share access:

```bash
sudo iptables -D INPUT -s 192.168.56.102 -p tcp --dport 445 -j DROP
```

Then verified:

- The rule was no longer present in `iptables`
- The share opened successfully again from Windows
- Write access was restored
- Created `incident04-restart.txt` in `\\192.168.56.101\companydocs\Shared`

### Outcome

The incident demonstrated that share access problems can be caused by firewall filtering even when:

- the server is reachable
- Samba is running
- the share configuration itself has not changed

This scenario helped reinforce the difference between:

- service availability
- share configuration
- file permissions
- network/firewall access control

### Skills practiced

- distinguishing network/firewall issues from service outages
- checking Samba service state with `systemctl`
- checking listening SMB port with `ss`
- using `iptables` for safe incident simulation
- validating recovery from the client side

### Evidence captured

- running Samba service during the failure
- Windows network access error while opening `\\192.168.56.101\companydocs`
- listening SMB port before the block
- firewall rule removed during recovery
- successful write test after recovery

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
- `screenshots/incidents/` contains evidence from the completed incident simulations
- the current evidence set covers hostname checks, IP checks, connectivity checks, SSH status, Samba status, share access, and the Windows file write test

---

## Remaining Manual Tasks

The following work still needs to be done manually in the live lab:

- run a Windows software-installation incident and document the results
- capture the full live Samba config block and share mapping directly from the server
- configure and verify backup automation on the live server
- update host hardware and verified software version details

---

## Next Planned Step

- run a Windows software-installation incident and capture evidence

---

## Later Planned Work

- deeper Samba documentation
- backup workflow design, implementation, and validation
- inventory refinement and additional validation evidence

---

## Notes

- this log is intentionally based on verified current state, not on older planning drafts
- planned work is listed separately from completed work to keep the portfolio credible
