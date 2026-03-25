# Firewall Setup (Planned)

**Status:** future hardening step. Do not mark this as complete until it has been tested manually on `office-srv-01`.

---

## Goal

When the firewall phase is performed, the target state for the current lab is:

- allow SSH
- allow Samba
- deny other unsolicited incoming traffic by default

---

## Planned Commands

Run these only when you are ready to test firewall changes on the live server:

```bash
sudo ufw allow ssh
sudo ufw allow samba
sudo ufw enable
sudo ufw status verbose
```

---

## Target Validation

Expected output should include rules for:

- SSH
- Samba

The server should remain reachable over SSH and the Windows client should still be able to open `\\192.168.56.101\companydocs`.

---

## Useful Commands

```bash
# List rules with numbers
sudo ufw status numbered

# Delete a rule by number
sudo ufw delete <rule-number>

# Disable firewall temporarily
sudo ufw disable
```

---

## Reminder

Always confirm SSH access still works immediately after enabling UFW so you do not lock yourself out of `office-srv-01`.
