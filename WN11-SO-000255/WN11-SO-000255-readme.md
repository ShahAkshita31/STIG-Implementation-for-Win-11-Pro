# STIG ID: WN11-SO-000255

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

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-SO-000255/WN11-SO-000255-remediation.ps1)

---

## 📊 Rescan Verification




---
