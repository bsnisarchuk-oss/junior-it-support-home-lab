# Current IP Addressing

This file records the current verified IP information for the live lab.

---

## Host-only Communication Addresses

| IP Address | Hostname | Device Type | Role | Status |
|------------|----------|-------------|------|--------|
| `192.168.56.101` | `office-srv-01` | Virtual machine | Ubuntu Server file server | Verified |
| `192.168.56.102` | `office-pc-01` | Virtual machine | Windows 10 workstation | Verified |

---

## Notes

- these are the addresses currently used for VM-to-VM communication inside the lab
- SSH and Samba validation use the `192.168.56.x` addresses above
- the NAT adapter also exists on both VMs, but those NAT-side addresses are not tracked in this repo because they are not used for the internal lab checks documented here
