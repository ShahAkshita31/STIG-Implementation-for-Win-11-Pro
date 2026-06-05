# STIG ID: WN11-CC-000030

## 🛡️ Vulnerability Description
**Disable ICMP Redirects from Overriding OSPF Routes**

Windows 11 systems must be configured to prevent ICMP redirects from overriding OSPF-generated routes. Allowing ICMP redirects can modify routing behavior and cause network traffic to follow unintended paths. This may result in traffic misrouting and reduced network reliability.

---

## ⚠️ Security Impact

An attacker or misconfigured device could influence routing decisions through ICMP redirect messages, potentially causing network traffic to be redirected away from trusted OSPF-generated routes.

---

## ⚙️ Remediation Strategy

1. Registry Path Targeted: `HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters`
2. Configuration Enforcement: Set EnableICMPRedirect (DWORD) value to `0`
3. Outcome: Prevents ICMP redirects from overriding OSPF-generated routes, ensuring network traffic follows trusted routing paths and reducing the risk of traffic misrouting.

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-CC-000030/WN11-CC-000030-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1113" height="281" alt="WN11-CC-000030-remediation" src="https://github.com/user-attachments/assets/4f12c13b-53a0-4340-baf1-8434dfab5515" />
<img width="1442" height="487" alt="WN11-CC-000030-Tenable " src="https://github.com/user-attachments/assets/21c3c224-f228-45ff-b3e1-2cec00f6bc43" />


---
