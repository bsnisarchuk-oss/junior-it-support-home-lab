# Future Scenario - Software Installation Failure

**Type:** planned future scenario  
**Status:** not yet reproduced in the live lab

---

## Scenario Goal

An approved desktop application fails to install on the Windows workstation.

The goal of this incident is to practice checking:

- permissions
- disk space
- Windows Installer service state
- application log errors

---

## Planned Reproduction

Pick one method when you are ready to run the incident in the live lab:

- attempt an installation without approving elevation
- run the installation from a standard user context if the lab later includes one
- stop or disable the Windows Installer service temporarily, then test the install

Do not document any method as completed until it is actually performed.

---

## Investigation Steps

Run these on `office-pc-01`:

```powershell
whoami
whoami /groups
Get-PSDrive C
Get-Service msiserver
Get-EventLog -LogName Application -Source MsiInstaller -EntryType Error -Newest 5
```

Interpretation:

- if elevation was denied, the install may fail immediately
- if free disk space is very low, the install may fail partway through
- if `msiserver` is stopped, MSI-based installs may fail

---

## Likely Root Cause

Likely causes for this lab:

- installation was attempted without elevation
- the Windows Installer service was unavailable
- the workstation did not have enough free disk space

---

## Likely Resolution

Typical fix directions:

- rerun the install with administrative approval
- start `msiserver` if it was stopped
- free space if the drive is nearly full

If you test a `winget` install later, record the exact package ID and exact command you used during the real lab session.

---

## Evidence To Capture Later

- [ ] `screenshots/incidents/inc-003-install-error.png`
- [ ] `screenshots/incidents/inc-003-system-checks.png`
- [ ] `screenshots/incidents/inc-003-resolved.png`

---

## Prevention

- document which installs require administrative approval
- keep enough free disk space on the workstation
- verify the Windows Installer service before deeper troubleshooting
