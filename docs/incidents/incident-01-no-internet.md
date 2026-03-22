# Incident 01 — No Internet Access

## Details

| Field       | Value                        |
|-------------|------------------------------|
| Date        |                              |
| Reporter    |                              |
| Affected    | win-workstation-01           |
| Priority    | Medium                       |
| Status      | Open / Resolved              |

## Description

User reports no internet access on workstation.

## Investigation Steps

1. Can user ping gateway? `ping 192.168.1.1`
2. Can user ping external IP? `ping 8.8.8.8`
3. Can user ping by hostname? `ping google.com`
4. Check IP config: `ipconfig /all`
5. Check for 169.254.x.x address (APIPA — DHCP failure)

## Root Cause

_Fill in after investigation_

## Resolution

_Fill in steps taken to resolve_

## Prevention

_Fill in any preventive measures_

## Time to Resolve

_Fill in_
