# Incident Screenshots

This folder contains **real** screenshot evidence from completed incident simulations.

Each incident now has its own subfolder so the evidence stays grouped and easy to review.

Current incident folders:

- `incident_01/` - Samba service outage evidence
- `incident_02/` - wrong share name in `smb.conf`
- `incident_03/` - shared folder permissions issue
- `incident_04/` - firewall blocks SMB access

## Naming Rule

Inside each incident folder, use:

- `01-description.png`
- `02-description.png`
- `03-description.png`

The folder already identifies the incident number, so repeating `incident-02-` or similar in the filename is unnecessary.

## Preferred Evidence Flow

When possible, capture evidence in this order:

- known-good baseline
- failure reproduced
- server-side or client-side diagnosis
- fix applied
- post-fix validation

Add new screenshot sets only after the incident has been reproduced, investigated, resolved, and validated in the live lab.
