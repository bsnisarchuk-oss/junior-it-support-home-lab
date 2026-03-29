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
| `incidents/` | Incident evidence grouped into per-incident subfolders such as `incident_01/` and `incident_04/` |

---

## Current Screenshot Naming Style

Screenshots use ordered numeric prefixes to show the order of the work.

Naming convention used in the repo:

- top-level validation folders use `NN-description.png`
- incident folders use `incident_0X/NN-description.png`
- the incident folder already provides the incident number, so the filename itself does not repeat it

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

incidents/incident_02/01-share-working-before-config-change.png
incidents/incident_04/10-write-test-restored.png
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

## Folder Notes

The notes below explain how the special screenshot folders are used:

- `network/` exists for future network-specific screenshots that are validated manually in the live lab
- `incidents/` contains completed incident evidence organized by incident number

---

## Notes

- keep only clear and useful screenshots
- prefer one screenshot per validation step
- use real evidence only
- keep incident evidence grouped by scenario folder
- keep incident filenames in chronological order using `01-`, `02-`, `03-`
