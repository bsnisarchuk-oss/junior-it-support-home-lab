# Network Diagram

## Current Topology

```text
                [Internet]
                    ^
                    |
         VirtualBox Adapter 1: NAT

office-srv-01 --------------------------- office-pc-01
192.168.56.101      Adapter 2: Host-only      192.168.56.102
```

---

## Notes

- both VMs use **Adapter 1 = NAT** for outbound internet access
- both VMs use **Adapter 2 = Host-only** for private lab communication
- the host-only connection is the path used for SSH and Samba validation between the VMs

---

## Devices

| Device | IP Address | Role |
|--------|------------|------|
| `office-srv-01` | `192.168.56.101` | Ubuntu Server file server |
| `office-pc-01` | `192.168.56.102` | Windows 10 workstation |
