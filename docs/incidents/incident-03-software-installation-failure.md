# Incident 03 — Software Installation Failure

> **Type:** Lab simulation — this incident is reproduced intentionally to practice troubleshooting.
> **⚙️ Status:** Scenario defined — must be reproduced and resolved manually in the lab.

---

## Incident Details

| Field | Value |
|-------|-------|
| Incident ID | INC-003 |
| Date reported | _(fill in during lab session)_ |
| Reported by | labuser (win-workstation-02) |
| Affected device | WIN-WS-02 (192.168.1.21) |
| Priority | Low |
| Status | ⚙️ To be completed in lab |

---

## Description

User reports that they tried to install Google Chrome on WIN-WS-02 but the installer fails.
The installer either shows an error message, closes immediately without installing, or asks for administrator credentials.

---

## How to Reproduce This Incident in the Lab

> ⚙️ **Run as Administrator on WIN-WS-02 to simulate a restricted user:**

```powershell
# Create a restricted test user account
New-LocalUser -Name "restricted_user" -Password (ConvertTo-SecureString "TestPass123!" -AsPlainText -Force) -FullName "Restricted User" -Description "Test account without admin rights"

# Do NOT add to Administrators group
```

Switch to the `restricted_user` account and try to install Chrome by double-clicking the installer.
The installer will fail because it requires elevation.

---

## Investigation Steps

### Step 1 — What is the exact error message?

> ⚙️ Note down the exact error text. Common messages:
- "You don't have permission to install software on this computer"
- "This app can't run on your PC"
- "Installation failed. Error code: 0x80070005" (Access Denied)
- "Please contact your system administrator"
- UAC prompt → user clicks Cancel

The error message points directly to the type of problem.

### Step 2 — Check user account type

```powershell
whoami
net user %username%
```

Look for "Local Group Memberships" in the output.
- If only "Users" → standard user, cannot install software
- If "Administrators" → user has admin rights, look elsewhere for the cause

### Step 3 — Check disk space

```powershell
Get-PSDrive C | Select-Object Used, Free
```

Or in CMD:
```cmd
dir C:\
```

If free space is under 2 GB, the installer may fail due to lack of space.

### Step 4 — Check Windows Installer service

```powershell
Get-Service msiserver
```

Expected: `Status: Running`
If stopped:
```powershell
Start-Service msiserver
```

### Step 5 — Check Windows Event Viewer

1. Press `Win + X` → Event Viewer
2. Navigate to: Windows Logs → Application
3. Filter by: Source = "MsiInstaller"
4. Look for Error events around the time of the failed installation

Event ID 1024 or 1040 often indicates installer problems.

---

## Root Cause

> ⚙️ Fill in after completing the lab investigation.

**Expected root cause:** The user account `restricted_user` is a standard (non-administrator) user. Windows software installers typically require Administrator rights to write to `Program Files` and modify system registry keys. Without elevation, the installation is blocked.

_Actual finding during lab:_
```
[fill in]
```

---

## Resolution

> ⚙️ Fill in after completing the lab resolution.

**Expected resolution:** Install the software using an administrator account or use "Run as administrator."

**Option A — Run installer as Administrator (if user knows admin password):**
Right-click installer → "Run as administrator" → enter admin credentials

**Option B — Install via PowerShell as Administrator:**
```powershell
winget install --id Google.Chrome -e --silent --accept-source-agreements
```

**Option C — For a recurring need, add user to Administrators group (not recommended for real environments without IT policy approval):**
```powershell
Add-LocalGroupMember -Group "Administrators" -Member "restricted_user"
```

**Best practice in a real environment:** Deploy software centrally through a software management tool (WSUS, Intune, PDQ Deploy) rather than letting users install software themselves.

_Actual steps taken during lab:_
```
[fill in]
```

---

## Screenshots to Take

- [ ] `screenshots/incidents/inc-003-install-error.png` — installer error message
- [ ] `screenshots/incidents/inc-003-user-type.png` — net user output showing non-admin account
- [ ] `screenshots/incidents/inc-003-resolved.png` — Chrome installed successfully

---

## Prevention

- In a real environment: manage software deployment centrally (Group Policy, Intune, PDQ)
- Document which accounts have admin rights (see `docs/inventory/`)
- Never give standard users local admin rights without justification and approval

---

## Time to Resolve

| Stage | Time |
|-------|------|
| Time reported → first investigation | _(fill in)_ |
| First investigation → root cause identified | _(fill in)_ |
| Root cause → resolved | _(fill in)_ |
| **Total** | _(fill in)_ |
