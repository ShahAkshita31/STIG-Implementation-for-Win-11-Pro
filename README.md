# Automated Windows 11 STIG Remediation & Compliance Validation

## 🛠 Environment & Tech Stack

- **Cloud Infrastructure:** Azure VM (Win 11 Pro)
- **Vulnerability Management:** Nessus/ Tenable.io
- **Automation:** PowerShell 7+
- **Compliance Framework:** DISA Windows 11 STIG v2r7
- **Security Focus Areas:** System Hardening, Authentication Security, Secure Remote Management, Audit Logging

---
## 📖 Project Overview

### What is DISA STIG?

The **Security Technical Implementation Guides (STIGs)** are cybersecurity hardening standards developed and maintained by the Defense Information Systems Agency (DISA) for securing operating systems, enterprise applications, and infrastructure platforms.
These guidelines establish secure configuration baselines designed to reduce attack surface, strengthen system security, and improve enterprise compliance posture.

---
### Why is STIG Compliance Important?

Implementing STIG controls helps organizations:
- Harden systems against cyber threats
- Strengthen authentication and access controls
- Reduce attack surface exposure
- Improve logging and audit visibility
- Align systems with enterprise security standards and compliance requirements

---
### Impact of Non-Compliance

- **Remote Exploitation Risks:** Insecure remote management configurations may allow unauthorized access.
- **Reduced Visibility:** Missing audit controls can impact threat detection and incident response capabilities.
- **Compliance Failures:** Systems may fail regulatory and enterprise security assessments.
- **Operational Risk:** Unhardened systems are more susceptible to malware, ransomware, and lateral movement attacks.

---
## 🚀 Workflow: Scanning & Remediation

The following workflow outlines the process of deploying the environment, identifying failed STIG controls, automating remediation, and validating compliance improvements.

---
### Phase 1: Environment Setup & Configuration

1. **Deploy Virtual Machine:** Log in to the [Azure Portal](https://portal.azure.com) and provision a new Windows 11 Pro VM.

2. **Network Configuration:** Validate communication between the scanner and target VM by:
   - confirming IP connectivity
   - enabling required management services
   - verifying SMB and WinRM accessibility

---
### Phase 2: Vulnerability Assessment (Nessus / Tenable)

1. Log in to [Tenable.io](https://cloud.tenable.com).
2. Navigate to:
   - **Scans** → **Create Scan Template** → **Advanced Network Scan**
3. **Configure the Scan**
   - Select `LOCAL-SCAN-ENGINE-01` (or appropriate scanner)
   - Enter the private IP address of the Windows 11 VM
   - Configure Windows administrative credentials for authenticated scanning
4. **Configure Compliance Policy**
   - Navigate to the **Compliance** section
   - Select:
     - **DISA Windows 11 STIG v2r7**
5. **Optimization (Optional)**
   - Disable unnecessary plugins
   - Enable only:
     - Windows Compliance Checks under Policy Compliance
     - Settings, General and Windows
6. **Execute the Scan**
   Launch the scan to identify failed STIG controls and generate the initial compliance baseline.

---
### Phase 3: Analysis & Remediation

1. **Review Findings:** Analyze failed STIG controls and prioritize remediation based on severity.
2. **PowerShell Automation:** Develop and execute PowerShell remediation scripts to enforce secure configurations automatically.
3. **Validation:** Verify registry modifications, policy configurations, and service hardening after remediation.
4. **Compliance Verification:** Re-run authenticated vulnerability scans to validate successful remediation and confirm compliance improvements.

---
## 📊 Baseline Scan Results

<img width="1852" height="797" alt="image" src="https://github.com/user-attachments/assets/a3176dbc-4671-46ff-9574-8adbe3e28cb1" />


---
## 🛡️ Targeted STIG Controls for Remediation

The following STIG controls were selected for automated remediation and compliance validation using PowerShell scripting.

| STIG ID | Title | Severity | Security Context & Justification |
| :------ | :--- | :--- | :--- |
| WN11-SO-000025 | The built-in Guest account must be renamed | CAT II (Medium) | Prevents attackers from targeting a well-known default account for enumeration and brute-force attacks. |
| WN11-CC-000030 | Disable ICMP Redirects from Overriding OSPF Routes | CAT III (Low) |Prevents traffic misrouting by ensuring network traffic follows trusted OSPF routes. |
| WN11-CC-000038 | WDigest Authentication must be disabled | CAT I (High) | Prevents plaintext credentials from being stored in LSASS, directly mitigating credential dumping risks. |
| WN11-CC-000050 | Hardened UNC paths must be defined for SYSVOL and NETLOGON | CAT II (Medium) | Ensures SMB domain traffic uses mutual authentication and integrity protection. |
| WN11-CC-000185 | The default AutoRun behavior must be configured to prevent AutoRun commands | CAT I (High) | Prevents automatic execution of malicious code from removable media. |
| WN11-CC-000200 | Administrator accounts must not be enumerated during elevation (UAC control) | CAT II (Medium) | Reduces exposure of privileged account information during logon elevation prompts. |
| WN11-SO-000255 | UAC denies elevation requests from standard users. | CAT II (Medium) | Prevents unauthorized privilege escalation by standard users. |
| WN11-SO-000270 | User Account Control must run all administrators in Admin Approval Mode | CAT II (Medium) | Prevents silent privilege escalation and enforces secure elevation behavior. |
| WN11-CC-000315 | Windows Installer “AlwaysInstallElevated” must be disabled | CAT I (High) | Prevents MSI-based privilege escalation to SYSTEM. |
| WN11-CC-000350 | WinRM must not allow unencrypted traffic | CAT II (Medium) | Prevents interception and tampering of remote management sessions. |



