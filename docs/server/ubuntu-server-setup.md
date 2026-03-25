# Ubuntu Server Reference

**Status:** current live server already built and verified.

This file documents the server as it exists now. It is not a claim that every future hardening or backup step has already been completed.

---

## Current Verified Server

| Item | Value |
|------|-------|
| Hostname | `office-srv-01` |
| Role | File server |
| OS | Ubuntu Server |
| Host-only IP | `192.168.56.101` |
| VirtualBox Adapter 1 | NAT |
| VirtualBox Adapter 2 | Host-only |
| SSH | Working |
| Samba | Working |

---

## Current Validation Commands

Run these on `office-srv-01` when you want to re-check the live server:

```bash
hostnamectl
ip addr show
ping -c 4 192.168.56.102
ping -c 4 8.8.8.8
ping -c 4 google.com
sudo systemctl status ssh
```

Expected results:

- hostname shows `office-srv-01`
- the host-only address `192.168.56.101` is present
- the workstation at `192.168.56.102` replies
- internet tests work while NAT is healthy
- the SSH service is active

---

## SSH Validation

From a Windows terminal or from another client:

```powershell
ssh <your-ubuntu-user>@192.168.56.101
```

The repository does not record the live Ubuntu username. Use the account that was actually created in the VM.

---

## Evidence Already in the Repo

Current server-side evidence is stored in `screenshots/server/` and includes:

- hostname validation
- IP information
- internet and DNS checks
- SSH service status
- package update evidence

---

## Planned Follow-up Work

These items are still future work and should only be marked complete after manual testing in the live lab:

- UFW hardening
- backup automation
- additional SSH hardening such as key-only access

See also:

- `docs/server/samba-shared-folder-setup.md`
- `docs/server/firewall-setup.md`
- `docs/server/backup-strategy.md`
- `docs/server/remote-access.md`
