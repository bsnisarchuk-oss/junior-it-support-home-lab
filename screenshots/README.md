# Screenshots

This folder contains validation evidence collected during hands-on lab work.

All screenshots in this directory reflect real completed steps from the project.
Nothing should be added here unless it was actually performed and verified in the lab.

---

## Folder Structure

| Folder | Contents |
|--------|----------|
| `server/` | Ubuntu Server installation, SSH verification, Samba setup and validation |
| `workstation/` | Windows workstation setup, network checks, access to Samba shared folder |
| `network/` | Network-related screenshots and diagnostics |
| `incidents/` | Evidence for simulated incident scenarios (broken state and resolved state) |

---

## Current Screenshot Naming Style

Screenshots are named using ordered prefixes to reflect project progress.

Examples:

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
workstation/14-ping-ubuntu-server.png
workstation/15-companydocs-open-from-windows.png
workstation/16-shared-folder-write-test.png

##Current Completed Screenshot Sets## 

Server

Current server-side evidence should cover:

Ubuntu hostname and OS details
network interface information
internet connectivity test
DNS resolution test
SSH service status
package update / upgrade result
Samba shared folder structure
Samba configuration block
Samba service status
local Samba share validation with smbclient

##Workstation##

Current workstation-side evidence should cover:

Windows IP configuration
ping from Windows to Ubuntu server
successful opening of \\192.168.56.101\companydocs
successful write test inside Shared

##Notes##

Keep only clear and useful screenshots
Prefer one screenshot per validation step
Use real evidence only
If a step was not completed, do not create placeholder screenshots
Incident screenshots will be added later as troubleshooting scenarios are completed