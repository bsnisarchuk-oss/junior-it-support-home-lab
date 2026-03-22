# Software Inventory

> **Status:** Planned configuration — ⚙️ check boxes after software is installed and verified.

---

## Ubuntu Server (VM-001 — ubuntu-server)

| Software | Version | Purpose | Install Command | Installed |
|----------|---------|---------|-----------------|-----------|
| Ubuntu Server | 22.04 LTS | Server OS | _(ISO)_ | ⚙️ |
| OpenSSH Server | Latest | Remote access via SSH | Included in OS installer | ⚙️ |
| Samba | Latest | Windows file sharing (SMB) | `apt install samba` | ⚙️ |
| rsync | Latest | File backup/sync | `apt install rsync` | ⚙️ |
| UFW | Latest | Firewall management | Included in Ubuntu | ⚙️ |

---

## Workstation Software (WIN-WS-01 and WIN-WS-02)

| Software | Version | Purpose | winget ID | WS-01 | WS-02 |
|----------|---------|---------|-----------|-------|-------|
| Windows 11 | 23H2+ | Workstation OS | _(ISO)_ | ⚙️ | ⚙️ |
| Windows Updates | Latest | Security + stability | Windows Update | ⚙️ | ⚙️ |
| Google Chrome | Latest | Web browser | `Google.Chrome` | ⚙️ | ⚙️ |
| 7-Zip | Latest | File archiver | `7zip.7zip` | ⚙️ | ⚙️ |
| Notepad++ | Latest | Text / code editor | `Notepad++.Notepad++` | ⚙️ | ⚙️ |
| VLC Media Player | Latest | Media playback | `VideoLAN.VLC` | ⚙️ | ⚙️ |
| PuTTY | Latest | SSH / Telnet client | `PuTTY.PuTTY` | ⚙️ | ⚙️ |
| WinSCP | Latest | SFTP / SCP file transfer | `WinSCP.WinSCP` | ⚙️ | ⚙️ |

> Install all workstation software using: `scripts/windows/install-common-software.ps1`

---

## Legend

| Symbol | Meaning |
|--------|---------|
| ⚙️ | Planned — not yet installed |
| ✅ | Installed and verified |
| ❌ | Installation failed — see incident log |

---

## Change Log

| Date | Device | Software | Action | Done by |
|------|--------|----------|--------|---------|
| 2026-03-22 | — | All | Initial inventory created | Admin |
| _(fill in)_ | ubuntu-server | Samba | Installed | _(fill in)_ |
| _(fill in)_ | WIN-WS-01 | Standard suite | Installed via script | _(fill in)_ |
| _(fill in)_ | WIN-WS-02 | Standard suite | Installed via script | _(fill in)_ |
