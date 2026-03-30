# Scripts

These scripts are helper utilities for the home lab.

They are aligned with the current documented lab layout, but not every script is already claimed as a completed live-lab step. Only treat a script as part of the verified portfolio after it has been run manually and supported by evidence.

---

## Linux Helpers

| Script | Current role |
|--------|--------------|
| `linux/setup-samba.sh` | helper to create the `companydocs` Samba share with `/srv/companydocs` as the default share root |
| `linux/create-shared-structure.sh` | helper to create the documented folder layout, including `/srv/companydocs/Shared` used in Incident 03 |
| `linux/backup-docs.sh` | helper draft aligned to the current `companydocs` layout, but backup automation is still future work in the live lab |

---

## Windows Helpers

| Script | Current role |
|--------|--------------|
| `windows/collect-network-info.ps1` | collects network and share-access diagnostics for the current `office-pc-01` to `office-srv-01` lab path |
| `windows/install-common-software.ps1` | helper for a future software-installation scenario; it is not yet part of the verified live-lab baseline |
| `windows/workstation-prep.ps1` | helper to prepare a new Windows VM so it matches the current lab naming and validation flow |

---

## Important Notes

- completed incident evidence should be documented under `docs/incidents/completed/`
- future ideas or helper automation should stay separate from verified live-lab claims
- if the live lab diverges later, update both the script defaults and the related documentation together
