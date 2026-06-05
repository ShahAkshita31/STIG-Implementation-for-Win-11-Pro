# STIG ID: WN11-CC-000030

## 🛡️ Vulnerability Description
**Windows 11 systems must use BitLocker to encrypt all disks**

The Windows Remote Management (WinRM) client is configured to allow Basic authentication. Basic authentication transmits credentials in a weak format that can be easily decoded if intercepted, especially if encryption is misconfigured or bypassed.

---

## ⚠️ Security Impact

An attacker capable of intercepting network traffic or gaining access to configuration settings could capture credentials and use them for unauthorized access or lateral movement within the environment.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest`
2. Control Enforcement: Disable WDigest Authentication to prevent plaintext credentials from being stored in LSASS memory.
3. Modification: Used a PowerShell script to create/update the UseLogonCredential registry value and set it to `0` (DWORD).

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000038/WN11-CC-000038-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1037" height="192" alt="38R" src="https://github.com/user-attachments/assets/1640c057-fa46-4822-838f-dce1806a3d0a" />
<img width="1451" height="410" alt="38 T" src="https://github.com/user-attachments/assets/2efed3e5-e2a1-428b-8333-9a89cc55d79d" />



---
