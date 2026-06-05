# STIG ID: WN11-CC-000050

## 🛡️ Vulnerability Description
*Hardened UNC paths must be defined for SYSVOL and NETLOGON*

The system is not configured to enforce Hardened UNC Paths for the SYSVOL and NETLOGON shares. Without mutual authentication and integrity protection, network communications to these critical domain resources may be vulnerable to spoofing, tampering, or man-in-the-middle attacks, potentially compromising Active Directory operations and Group Policy distribution.
---

## ⚠️ Security Impact

Failure to enforce Hardened UNC Paths may allow attackers to spoof or tamper with communications to SYSVOL and NETLOGON shares, increasing the risk of unauthorized access and Active Directory compromise.

---

## ⚙️ Remediation Strategy

### Remediation Steps

1. **Registry Targeted:**
   `HKLM\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths`
2. **Control Enforcement:**
   Configure Hardened UNC Paths to require mutual authentication and integrity validation for `\\*\SYSVOL` and `\\*\NETLOGON`.
3. **Modification:**
   Used a PowerShell script to create/update the registry values:
   * `\\*\SYSVOL` = `RequireMutualAuthentication=1, RequireIntegrity=1`
   * `\\*\NETLOGON` = `RequireMutualAuthentication=1, RequireIntegrity=1`


[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000050/WN11-CC-000050-remediation.ps1)

---

## 📊 Rescan Verification


<img width="1087" height="272" alt="WN11-CC-000050-remediation" src="https://github.com/user-attachments/assets/3aec72aa-564b-4a91-9d8c-9a55c11ff112" />

<img width="1448" height="483" alt="WN11-CC-000050-Tenable " src="https://github.com/user-attachments/assets/31cbfc19-9125-4a77-bf4a-7d74f07ee950" />


---
