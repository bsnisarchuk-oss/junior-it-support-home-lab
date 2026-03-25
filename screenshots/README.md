# Screenshots

This folder contains validation evidence collected during hands-on lab work.

All screenshots in this directory should reflect real completed steps from the project. Do not add placeholders or mock evidence.

---

## Folder Structure

| Folder | Contents |
|--------|----------|
| `server/` | Ubuntu Server validation, SSH checks, and Samba validation |
| `workstation/` | Windows workstation validation and access to the Samba share |
| `network/` | Reserved for future network-specific validation screenshots after manual lab testing |
| `incidents/` | Future incident evidence captured during simulated troubleshooting |

---

## Current Screenshot Naming Style

Screenshots use ordered numeric prefixes to show the order of the work.

Examples from the current repo:

```text
server/01-hostnamectl.png
server/02-ip-a.png
server/03-ping-c-4-8.8.8.8.png
server/04-ping-c-4-google.com.png
server/05-systemctl-status-ssh.png
server/06-apt-update-upgrade.png
server/07-companydocs-structure.png
server/08-samba-config-block.png
server/09-systemctl-status-smbd.png
server/10-smbclient-localhost.png

workstation/13-windows-ipconfig.png
workstation/14-ping-office-srv-01.png
workstation/15-companydocs-open-from-windows.png
workstation/16-companydocs-write-test.png
```

---

## Current Completed Screenshot Sets

### Server

Current server-side evidence covers:

- hostname and OS details
- network interface information
- internet connectivity test
- DNS resolution test
- SSH service status
- package update / upgrade result
- Samba shared folder structure
- Samba configuration block
- Samba service status
- local Samba validation with `smbclient`

### Workstation

Current workstation-side evidence covers:

- Windows IP configuration
- ping from Windows to `office-srv-01`
- successful opening of `\\192.168.56.101\companydocs`
- successful write test inside `companydocs`

---

## Placeholder Folders

The folders below are intentional placeholders, not completed evidence sets:

- `network/` exists for future network-specific screenshots that are validated manually in the live lab
- `incidents/` exists for future incident evidence after each scenario is reproduced and resolved

---

## Notes

- keep only clear and useful screenshots
- prefer one screenshot per validation step
- use real evidence only
- placeholder folders should contain a short README until real screenshots exist
