# STIG ID: WN11-SO-000025

## 🛡️ Vulnerability Description
**The built-in Guest account must be renamed**

Windows 11 systems must have the built-in Guest account renamed. The default Guest account is a well-known account name that can be targeted by attackers. Renaming the account makes it more difficult for unauthorized users to identify and exploit it.

---

## ⚠️ Security Impact

An attacker could leverage the predictable Guest account name to attempt unauthorized access, password attacks, or account enumeration.

---

## ⚙️ Remediation Strategy

1. Policy Targeted: `Accounts: Rename guest account`
2. Configuration Enforcement: Configure the Guest account with a name other than **"Guest"**.
3. Outcome: Reduces the risk of account enumeration and unauthorized access by making the built-in Guest account more difficult to identify.

[Remediation Script](https://github.com/ShahAkshita31/STIG-Implementation-for-Win-11-Pro/blob/main/WN11-SO-000025/WN11-SO-000025-remediation.ps1)

---

## 📊 Rescan Verification

<img width="1017" height="195" alt="25R" src="https://github.com/user-attachments/assets/ac56f9b5-0725-40cf-b652-41f3cc8f09e3" />
<img width="1455" height="483" alt="25 T" src="https://github.com/user-attachments/assets/9b83db59-35ca-45fc-8373-50d7f8e28087" />



---
