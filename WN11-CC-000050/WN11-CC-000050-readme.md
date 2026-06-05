
# STIG ID: WN11-CC-000038

## 🛡️ Vulnerability Description
**Hardened UNC paths must be defined for SYSVOL and NETLOGON**

Windows 11 systems must enforce Hardened UNC Paths for the \\*\SYSVOL and \\*\NETLOGON shares. Without Hardened UNC Paths, connections to critical domain shares may be vulnerable to spoofing or tampering, potentially allowing unauthorized access or manipulation of domain resources.

---

## ⚠️ Security Impact

An attacker could intercept or spoof connections to SYSVOL and NETLOGON shares, leading to unauthorized access, modification of Group Policy data, or compromise of domain communications.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths`

2. Configuration Enforcement:
`\\*\NETLOGON = RequireMutualAuthentication=1, RequireIntegrity=1`
`\\*\SYSVOL = RequireMutualAuthentication=1, RequireIntegrity=1`

3. Outcome: Enforces mutual authentication and integrity protection for critical domain shares, helping prevent spoofing and tampering of network communications.
[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000050/WN11-CC-000050-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1087" height="272" alt="WN11-CC-000050-remediation" src="https://github.com/user-attachments/assets/ad1dc4cf-2748-41f3-90cc-c035c879f501" />
<img width="1448" height="483" alt="WN11-CC-000050-Tenable " src="https://github.com/user-attachments/assets/eb6fa53e-b4d9-426a-aab3-b24a49c29834" />




---
