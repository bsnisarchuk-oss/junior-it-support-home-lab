# Windows Workstation Reference

**Status:** current live workstation already built and verified.

This file documents the workstation that exists now. It does not claim that mapped drives, extra software, or later support scenarios have already been completed.

---

## Current Verified Workstation

| Item | Value |
|------|-------|
| Hostname | `office-pc-01` |
| Role | Client workstation |
| OS | Windows 10 |
| Host-only IP | `192.168.56.102` |
| VirtualBox Adapter 1 | NAT |
| VirtualBox Adapter 2 | Host-only |
| Server path in use | `\\192.168.56.101\companydocs` |

---

## Current Validation Commands

Run these on `office-pc-01`:

```powershell
hostname
ipconfig /all
ping 192.168.56.101
Test-NetConnection -ComputerName 192.168.56.101 -Port 445
Test-NetConnection -ComputerName 192.168.56.101 -Port 22
```

Then open the share in File Explorer:

```text
\\192.168.56.101\companydocs
```

---

## What Is Already Verified

- the workstation is online as `office-pc-01`
- it can reach `office-srv-01` on the host-only network
- it can open the Samba share
- `windows-test.txt` was created from Windows in the shared folder

---

## Evidence Already in the Repo

Current workstation-side evidence is stored in `screenshots/workstation/` and includes:

- IP configuration
- ping to the server
- opening the `companydocs` share from Windows
- a write test inside the share

---

## Planned Follow-up Work

These items are still future work and should only be documented as complete after they are tested in the live VM:

- workstation software inventory
- optional mapped drive documentation
- optional Remote Desktop validation
- incident simulation evidence

See also:

- `docs/workstation/troubleshooting-workstation.md`
- `docs/workstation/software-installation-checklist.md`
- `docs/workstation/user-onboarding-checklist.md`
