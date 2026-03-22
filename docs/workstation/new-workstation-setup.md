# New Workstation Setup

> **Status:** Guide written — ⚙️ steps must be completed manually in the Windows VM.
> **Applies to:** win-workstation-01 (192.168.1.20) and win-workstation-02 (192.168.1.21)

---

## Overview

This guide covers the full setup of a new Windows 11 workstation in the lab environment.
Follow these steps in order. Mark each item as complete when done.

---

## 1. Create the Virtual Machine

> ⚙️ **Complete in VirtualBox / VMware before starting.**

| Setting | win-workstation-01 | win-workstation-02 |
|---------|-------------------|--------------------|
| CPU | 2 vCPU | 2 vCPU |
| RAM | 4096 MB | 4096 MB |
| Disk | 40 GB | 40 GB |
| Network | Host-only adapter | Host-only adapter |
| ISO | Windows 11 | Windows 11 |

---

## 2. Install Windows 11

> ⚙️ **Complete manually — follow the Windows installer.**

During installation:

- Choose "Windows 11 Pro" (allows local account creation without Microsoft account)
- When asked "How would you like to set up?" → choose **"Set up for work or school"** then **"Domain join instead"** to create a local account
- Username: `labuser`
- Computer name: set in Step 4

> **Note:** If the installer forces a Microsoft account, use Shift+F10 to open CMD and run: `oobe\bypassnro` — this restarts the setup with a "no internet" option.

---

## 3. First Boot — Windows Updates

> ⚙️ **Complete manually after first login.**

1. Open **Settings → Windows Update**
2. Click **Check for updates**
3. Install all available updates
4. Restart when prompted
5. Repeat until no more updates are pending

This may take 30–60 minutes on first setup.

**⚙️ Screenshot to take:** Windows Update showing "You're up to date" → `screenshots/workstation/windows-updated.png`

---

## 4. Set Computer Name

> ⚙️ **Complete manually, or run the PowerShell script.**

**Manual:**
1. Right-click Start → System → Rename this PC
2. Enter name: `WIN-WS-01` (or `WIN-WS-02`)
3. Restart to apply

**PowerShell (run as Administrator):**
```powershell
Rename-Computer -NewName "WIN-WS-01" -Restart
```

---

## 5. Configure Static IP

> ⚙️ **Complete manually.**

1. Open **Settings → Network & Internet → Ethernet → Edit**
2. Change from "Automatic (DHCP)" to **"Manual"**
3. Set:
   - IPv4: On
   - IP address: `192.168.1.20` (or `192.168.1.21` for WS-02)
   - Subnet mask: `255.255.255.0`
   - Gateway: `192.168.1.1`
   - DNS: `8.8.8.8`
   - Alternate DNS: `8.8.4.4`

**Or via PowerShell (run as Administrator):**
```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.168.1.20" -PrefixLength 24 -DefaultGateway "192.168.1.1"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "8.8.8.8","8.8.4.4"
```

Verify:
```powershell
ipconfig /all
```

---

## 6. Test Network Connectivity

> ⚙️ **Run in PowerShell.**

```powershell
# Test gateway
ping 192.168.1.1

# Test server
ping 192.168.1.10

# Test internet
ping 8.8.8.8

# Test DNS
ping google.com
```

All should succeed. If the server ping fails, check that the Ubuntu Server VM is running.

---

## 7. Install Standard Software

> ⚙️ **Run PowerShell as Administrator.**

**Option A — Run the script:**
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\windows\install-common-software.ps1
```

**Option B — Manual (winget):**
```powershell
winget install --id Google.Chrome -e --silent
winget install --id 7zip.7zip -e --silent
winget install --id Notepad++.Notepad++ -e --silent
winget install --id VideoLAN.VLC -e --silent
winget install --id PuTTY.PuTTY -e --silent
winget install --id WinSCP.WinSCP -e --silent
```

**⚙️ Screenshot to take:** Start menu showing installed apps → `screenshots/workstation/software-installed.png`

---

## 8. Map Network Drive

> ⚙️ **Complete manually.**

1. Open File Explorer
2. Right-click "This PC" → "Map network drive..."
3. Drive: `Z:`
4. Folder: `\\192.168.1.10\Shared`
5. Check: "Reconnect at sign-in"
6. Click Finish

Verify: Drive `Z:` appears in File Explorer and shows the shared folders.

**⚙️ Screenshot to take:** Mapped drive Z: open in File Explorer → `screenshots/workstation/network-drive-mapped.png`

---

## 9. Enable Remote Desktop

> ⚙️ **Run as Administrator.**

```powershell
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
```

Test from host:
```
mstsc /v:192.168.1.20
```

---

## 10. Final Verification Checklist

| Check | How to Verify | Expected | ⚙️ Result |
|-------|--------------|----------|----------|
| Correct hostname | `hostname` in CMD | `WIN-WS-01` | |
| Static IP set | `ipconfig` | 192.168.1.20 | |
| Internet working | `ping 8.8.8.8` | Replies | |
| DNS working | `ping google.com` | Resolves | |
| Server reachable | `ping 192.168.1.10` | Replies | |
| Shared drive mapped | File Explorer | Z: drive visible | |
| Chrome installed | Start menu | Listed | |
| Remote Desktop enabled | Settings | Enabled | |

---

## Next Steps

- Complete user onboarding → `user-onboarding-checklist.md`
- Review software checklist → `software-installation-checklist.md`
- Repeat for win-workstation-02
