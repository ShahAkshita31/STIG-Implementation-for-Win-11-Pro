# STIG ID: WN11-SO-000255

## 🛡️ Vulnerability Description
**UAC denies elevation requests from standard users**

Windows 11 systems must automatically deny User Account Control (UAC) elevation requests from standard users. Allowing standard users to request elevation can increase the risk of unauthorized privilege escalation and credential misuse. Requiring administrative accounts for privileged actions helps enforce the principle of least privilege.

---

## ⚠️ Security Impact

An attacker or unauthorized user could attempt to gain elevated privileges, increasing the risk of credential theft, privilege escalation, and system compromise.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System`
2. Configuration Enforcement: Set ConsentPromptBehaviorUser (DWORD) value to `0`
3. Outcome: Automatically denies elevation requests from standard users, reducing the risk of unauthorized privilege escalation and credential misuse.

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-SO-000255/WN11-SO-000255-remediation.ps1)

---

## 📊 Rescan Verification
<img width="1038" height="182" alt="255 R" src="https://github.com/user-attachments/assets/2e579c9e-59e9-4c21-830c-7e0bf222685b" />
<img width="1452" height="487" alt="255 T" src="https://github.com/user-attachments/assets/ce2ace0f-3a63-4a9b-9ced-2fb70ad025bd" />




---
