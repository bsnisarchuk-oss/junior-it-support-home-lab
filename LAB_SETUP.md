# Lab Setup

## Virtualization

- Hypervisor: (e.g., VirtualBox / VMware Workstation / Proxmox)

## Virtual Machines

| VM Name        | OS                  | Role             | RAM  | Disk  |
|----------------|---------------------|------------------|------|-------|
| ubuntu-server  | Ubuntu Server 22.04 | File/Backup Server | 2GB | 20GB |
| win-workstation-01 | Windows 10/11  | User Workstation | 4GB | 40GB |
| win-workstation-02 | Windows 10/11  | User Workstation | 4GB | 40GB |

## Network

- Virtual Network: Host-only or Internal Network
- IP Range: see `docs/network/ip-addressing-plan.md`

## Credentials

Store credentials securely — do not commit passwords to this repository.
