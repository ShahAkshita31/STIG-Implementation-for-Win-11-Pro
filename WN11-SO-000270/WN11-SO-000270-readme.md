# STIG ID: WN11-SO-000270

## 🛡️ Vulnerability Description
**User Account Control must run all administrators in Admin Approval Mode**

Windows 11 systems must run all administrator accounts in Admin Approval Mode by enabling User Account Control (UAC). UAC helps limit the use of administrative privileges by requiring approval before elevated actions are performed, reducing the risk of unauthorized system changes.

---

## ⚠️ Security Impact

Without UAC, applications and users may execute administrative actions without approval, increasing the risk of privilege escalation, malware execution, and unauthorized system modifications.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System`
2. Configuration Enforcement: Set EnableLUA (DWORD) value to `1`
3. Outcome: Enables UAC and Admin Approval Mode, ensuring administrative actions require authorization and reducing the risk of unauthorized privilege escalation..

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-SO-000270/WN11-SO-000270-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1096" height="167" alt="270R" src="https://github.com/user-attachments/assets/367c80c9-5ead-4f26-9f3a-c125ab46eda1" />
<img width="1450" height="408" alt="270 T" src="https://github.com/user-attachments/assets/4698e1cd-1324-4b95-b999-def806fdaa1d" />



---
