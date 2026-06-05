# STIG ID: WN11-CC-000030

## 🛡️ Vulnerability Description
**Windows 11 systems must use BitLocker to encrypt all disks**

The Windows Remote Management (WinRM) client is configured to allow Basic authentication. Basic authentication transmits credentials in a weak format that can be easily decoded if intercepted, especially if encryption is misconfigured or bypassed.

---

## ⚠️ Security Impact

An attacker capable of intercepting network traffic or gaining access to configuration settings could capture credentials and use them for unauthorized access or lateral movement within the environment.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client
2. Configuration Enforcement: Set AllowBasic DWORD value to 0
3. Outcome: Ensures WinRM client does not use Basic authentication for remote sessions

[Link to Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000030/WN11-CC-000030-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1113" height="281" alt="WN11-CC-000030-remediation" src="https://github.com/user-attachments/assets/4f12c13b-53a0-4340-baf1-8434dfab5515" />
<img width="1442" height="487" alt="WN11-CC-000030-Tenable " src="https://github.com/user-attachments/assets/21c3c224-f228-45ff-b3e1-2cec00f6bc43" />


---
