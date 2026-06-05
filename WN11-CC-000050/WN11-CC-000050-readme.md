# STIG ID: WN11-CC-000050

## 🛡️ Vulnerability Description
*Hardened UNC paths must be defined for SYSVOL and NETLOGON**

The WinRM service is configured to allow Basic authentication, which is a weak authentication mechanism that may expose user credentials during remote management sessions.

---

## ⚠️ Security Impact

If Basic authentication is enabled, credentials may be exposed during transmission or intercepted by attackers, increasing the risk of account compromise.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service`
2. Configuration Enforcement: Set AllowBasic DWORD value to `0`
3. Service Enforcement: Restart WinRM service if required
4. Outcome: Disables Basic authentication on WinRM service side

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000050/WN11-CC-000050-remediation.ps1)

---

## 📊 Rescan Verification


<img width="1087" height="272" alt="WN11-CC-000050-remediation" src="https://github.com/user-attachments/assets/3aec72aa-564b-4a91-9d8c-9a55c11ff112" />

<img width="1448" height="483" alt="WN11-CC-000050-Tenable " src="https://github.com/user-attachments/assets/31cbfc19-9125-4a77-bf4a-7d74f07ee950" />


---
