# 🏢 Hybrid Active Directory (AD) Setup with Azure AD

This project demonstrates how to set up a **hybrid identity environment** by integrating an on-premises **Active Directory (AD)** with **Azure Active Directory (Azure AD)** using **Azure AD Connect**. The goal is to enable seamless identity synchronization and Single Sign-On (SSO) between cloud and on-prem environments.

---

## 📌 Key Components

- ✅ On-Premises Active Directory (Windows Server 2019)
- ☁️ Azure AD (cloud-based identity platform)
- 🔄 Azure AD Connect (for user and group sync)
- 🔐 Optional: Integration with Intune / Group Policy / Conditional Access

---

## 🛠️ Technologies Used

- **Windows Server 2019 / 2022**
- **Azure AD**
- **Azure AD Connect**
- **PowerShell**
- **Terraform** (optional VM/network provisioning)
- **Azure Resource Manager (ARM)** templates (optional)
- **Intune** (optional MDM/GPO replacement)

---

## 📁 Repository Structure

| Folder         | Description                                         |
|----------------|-----------------------------------------------------|
| `/scripts`     | PowerShell scripts for setting up AD, installing Azure AD Connect, syncing users |
| `/terraform`   | Infrastructure-as-Code for provisioning AD VM in Azure or Hyper-V |
| `/docs`        | Setup guides and architecture notes |
| `/architecture`| Diagrams of the hybrid setup (optional but recommended) |

---

## 🚀 Setup Overview

### 1. Provision Infrastructure
- Create a virtual machine (on-prem or Azure) for the Domain Controller.
- Configure static IP, DNS, and domain name.

### 2. Install & Configure Active Directory
```powershell
.\scripts\install-ad.ps1
```

* This script installs the AD Domain Services role and promotes the server to a Domain Controller.

### 3. Install Azure AD Connect
```powershell
.\scripts\install-aadconnect.ps1
```

* Installs Azure AD Connect and initiates user synchronization.

### 4. Verify Sync
* Use Azure portal or Get-ADSyncScheduler to verify synchronization.

---

📈 Optional Enhancements
- Enable Password Hash Sync or Pass-through Authentication

- Configure SSO for seamless login experience

- Integrate with Intune for device compliance and MDM

- Extend to use Azure AD Conditional Access Policies

---

🧠 Learning Outcomes
- Understand hybrid identity architecture and secure synchronization

- Automate infrastructure setup with PowerShell and/or Terraform

- Learn best practices in managing identities across hybrid environments

---

📸 Diagram
- Add an image like this in /architecture and embed it:

---

📫 Contact
Created by Ajmal Rasouli



