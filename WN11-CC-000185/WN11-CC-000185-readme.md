# STIG ID: WN11-CC-000185

## 🛡️ Vulnerability Description
**The default AutoRun behavior must be configured to prevent AutoRun commands**

Windows 11 systems must be configured to prevent autorun commands from executing. Autorun functionality can automatically execute programs from removable media or network drives, increasing the risk of malware infection and unauthorized code execution.

---

## ⚠️ Security Impact

An attacker could use malicious removable media or network resources to automatically execute harmful code, leading to system compromise, malware infection, or unauthorized access.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer`
2. Configuration Enforcement: Set NoAutorun (DWORD) value to `1`
3. Outcome: Disables autorun command execution, reducing the risk of malware propagation and unauthorized code execution from external media.

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000185/WN11-CC-000185-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1183" height="180" alt="185 R" src="https://github.com/user-attachments/assets/f86b438d-742b-474d-a95c-e99afc5ff812" />
<img width="1451" height="472" alt="185 T" src="https://github.com/user-attachments/assets/56a66351-0a23-4839-b414-0f3cae268550" />



---
