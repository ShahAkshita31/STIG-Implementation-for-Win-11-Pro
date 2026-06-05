# STIG ID: WN11-CC-000038

## 🛡️ Vulnerability Description
**Windows 11 systems must have WDigest Authentication disabled.**

When enabled, WDigest stores user credentials in plaintext within the Local Security Authority Subsystem Service (LSASS) process, increasing the risk of credential theft and unauthorized access.

---

## ⚠️ Security Impact

An attacker with access to system memory could extract plaintext credentials from LSASS and use them for privilege escalation, lateral movement, or unauthorized access to resources.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest`
2. Configuration Enforcement: Set UseLogonCredential (DWORD) value to `0`
3. Outcome: Prevents plaintext credentials from being stored in LSASS, reducing the risk of credential theft and unauthorized access.

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000038/WN11-CC-000038-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1037" height="192" alt="38R" src="https://github.com/user-attachments/assets/1640c057-fa46-4822-838f-dce1806a3d0a" />
<img width="1451" height="410" alt="38 T" src="https://github.com/user-attachments/assets/2efed3e5-e2a1-428b-8333-9a89cc55d79d" />



---
