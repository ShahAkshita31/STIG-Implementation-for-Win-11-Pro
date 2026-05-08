# Automated Windows 11 STIG Remediation & Compliance Validation

## 🛠 Environment & Tech Stack

- **Infrastructure:** Windows 11 Enterprise Virtual Machine
- **Cloud / Virtualization:** Azure VM / VirtualBox Lab
- **Vulnerability Management:** Nessus Essentials / Tenable.io
- **Automation:** PowerShell 7+
- **Compliance Framework:** DISA Windows 11 STIG Baseline
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

- **Credential Exposure:** Weak authentication settings increase the risk of credential theft and privilege escalation.
- **Remote Exploitation Risks:** Insecure remote management configurations may allow unauthorized access.
- **Reduced Visibility:** Missing audit controls can impact threat detection and incident response capabilities.
- **Compliance Failures:** Systems may fail regulatory and enterprise security assessments.
- **Operational Risk:** Unhardened systems are more susceptible to malware, ransomware, and lateral movement attacks.

---

## 🚀 Workflow: Scanning & Remediation

The following workflow outlines the process of deploying the environment, identifying failed STIG controls, automating remediation, and validating compliance improvements.

---

### Phase 1: Environment Deployment & Configuration

1. **Deploy Virtual Machine:**  
   Provision a Windows 11 Enterprise virtual machine within Azure or a local virtualization platform.

2. **Network Configuration:**  
   Validate communication between the scanner and target VM by:
   - confirming IP connectivity
   - enabling required management services
   - verifying SMB and WinRM accessibility

3. **Baseline Preparation:**  
   Configure the system for authenticated vulnerability scanning and establish the initial compliance baseline.

---

### Phase 2: Vulnerability Assessment (Nessus / Tenable)

1. Log in to Tenable.io or Nessus Essentials.

2. Navigate to:
   - **Scans** → **Create Scan** → **Advanced Network Scan**

3. **Configure the Scan**
   - Select the appropriate scanner engine
   - Enter the private IP address of the Windows 11 VM
   - Configure Windows administrative credentials for authenticated scanning

4. **Configure Compliance Policy**
   - Navigate to the **Compliance** section
   - Select:
     - **Windows 11 DISA STIG Compliance Policy**

5. **Optimization (Optional)**
   - Disable unnecessary plugins
   - Enable only:
     - Windows Compliance Checks
     - Policy Compliance

6. **Execute the Scan**
   Launch the scan to identify failed STIG controls and generate the initial compliance baseline.

---

### Phase 3: Analysis & Remediation

1. **Review Findings:**  
   Analyze failed STIG controls and prioritize remediation based on severity.

2. **PowerShell Automation:**  
   Develop and execute PowerShell remediation scripts to enforce secure configurations automatically.

3. **Validation:**  
   Verify registry modifications, policy configurations, and service hardening after remediation.

4. **Compliance Verification:**  
   Re-run authenticated vulnerability scans to validate successful remediation and confirm compliance improvements.

---

## 📊 Baseline Scan Results

Initial vulnerability scans identified multiple Windows 11 security misconfigurations related to:

- Authentication security
- Remote management hardening
- PowerShell visibility and logging
- Legacy protocol exposure
- Account security policies
- Network security configurations

Post-remediation scans demonstrated improved compliance posture and reduced high-severity findings.

---

## 🛡️ Targeted STIG Controls for Remediation

The following STIG controls were selected for automated remediation and compliance validation using PowerShell scripting.

| STIG ID | Title | Severity | Security Context & Justification |
| :--- | :--- | :--- | :--- |
| **WN11-CC-000030** | LAN Manager hash storage must be disabled | High | Prevents insecure legacy password hashes from being stored, reducing offline credential cracking risks. |
| **WN11-CC-000050** | Anonymous SID enumeration must be restricted | High | Limits attacker reconnaissance techniques used to enumerate users and security identifiers. |
| **WN11-CC-000090** | Solicited Remote Assistance must be disabled | Medium | Reduces unauthorized remote assistance access and remote exploitation opportunities. |
| **WN11-CC-000140** | Autoplay must be disabled for removable media | Medium | Helps prevent automatic malware execution from USB devices and external media. |
| **WN11-CC-000185** | Local accounts with blank passwords must be restricted | High | Prevents weak local authentication configurations vulnerable to unauthorized access. |
| **WN11-CC-000200** | Windows Defender SmartScreen must be enabled | High | Protects against phishing attacks, malicious downloads, and untrusted application execution. |
| **WN11-CC-000315** | PowerShell Module Logging must be enabled | High | Enhances visibility into PowerShell execution activity for threat detection and forensic analysis. |
| **WN11-SO-000025** | Account lockout threshold must be configured | High | Mitigates brute-force password attacks targeting local accounts. |
| **WN11-SO-000070** | Interactive logon message title must be configured | Low | Supports enterprise security notification and compliance policy requirements. |
| **WN11-SO-000095** | NTLM traffic must be restricted | High | Reduces reliance on insecure legacy authentication protocols susceptible to relay attacks. |
