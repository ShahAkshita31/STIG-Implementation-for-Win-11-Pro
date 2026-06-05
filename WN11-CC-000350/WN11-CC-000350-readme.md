# STIG ID: WN11-CC-000350

## 🛡️ Vulnerability Description
**WinRM must not allow unencrypted traffic**

Windows 11 systems must not allow unencrypted Windows Remote Management (WinRM) traffic. Allowing unencrypted WinRM communications can expose sensitive information transmitted during remote management sessions, increasing the risk of interception and unauthorized access.

---

## ⚠️ Security Impact

An attacker monitoring network traffic could intercept sensitive data, credentials, or management commands transmitted over unencrypted WinRM connections.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service`
2. Configuration Enforcement: Set AllowUnencryptedTraffic (DWORD) value to `0`
3. Outcome: Ensures WinRM communications are encrypted, protecting sensitive data and reducing the risk of interception and unauthorized access.

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000350/WN11-CC-000350-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1192" height="208" alt="350R" src="https://github.com/user-attachments/assets/b035484b-eda4-489e-85e0-105618cb4212" />
<img width="1451" height="468" alt="350 T" src="https://github.com/user-attachments/assets/34f9b7dc-ff23-4930-b137-e17678c79f81" />



---
