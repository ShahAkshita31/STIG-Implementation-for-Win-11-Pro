# STIG ID: WN11-CC-000200

## 🛡️ Vulnerability Description
**Administrator accounts must not be enumerated during elevation (UAC control)**

Windows 11 systems must not enumerate administrator accounts during elevation requests. Displaying administrator accounts during User Account Control (UAC) elevation can expose valid account names to unauthorized users, increasing the risk of credential-based attacks.

---

## ⚠️ Security Impact

An attacker could use exposed administrator account names to facilitate password guessing, credential theft, or unauthorized access attempts.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI`
2. Configuration Enforcement: Set EnumerateAdministrators (DWORD) value to `0`
3. Outcome: Prevents administrator account names from being displayed during elevation, reducing the risk of account enumeration and credential-based attacks.

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000200/WN11-CC-000200-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1308" height="203" alt="200R" src="https://github.com/user-attachments/assets/c8e8a15a-36b5-45b3-8d7b-12d1500c4517" />
<img width="1451" height="475" alt="200 T" src="https://github.com/user-attachments/assets/76333d42-0821-4956-9b59-609d0606e8cd" />



---
