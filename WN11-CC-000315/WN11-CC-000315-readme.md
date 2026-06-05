# STIG ID: WN11-CC-000315

## 🛡️ Vulnerability Description
**Windows Installer “AlwaysInstallElevated” must be disabled**

Windows 11 systems must have the "Always install with elevated privileges" feature disabled. Enabling this setting allows applications installed through Windows Installer to run with elevated privileges, which can enable unauthorized privilege escalation and compromise system security.

---

## ⚠️ Security Impact

An attacker or malicious application could exploit elevated installation privileges to gain administrative access, execute unauthorized code, or take full control of the system.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer`
2. Configuration Enforcement: Set AlwaysInstallElevated (DWORD) value to `0`
3. Outcome: Prevents applications from automatically installing with elevated privileges, reducing the risk of privilege escalation and unauthorized system access.

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000315/WN11-CC-000315-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1147" height="215" alt="315 R" src="https://github.com/user-attachments/assets/087c4d38-1734-4ae8-91e2-74ecfe63668b" />
<img width="1455" height="488" alt="315 T" src="https://github.com/user-attachments/assets/08707111-1bf3-4abc-a2eb-6a0f4ac1deff" />


---
