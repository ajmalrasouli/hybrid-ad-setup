
# Hybrid Active Directory Lab Setup (Hyper-V + Terraform + DSC)

This project automates the creation of a **Hybrid Active Directory Lab** using:
- **Hyper-V** (for local virtual machines)
- **Terraform** (to provision and manage VMs)
- **PowerShell DSC** (to configure Active Directory and Azure AD Connect)

## Features
- Creates **two Windows Server 2019 VMs**:
  1. `DC-Server` (Domain Controller)
  2. `AADConnect-Server` (Azure AD Connect host)
- Configures Active Directory Domain Services (AD DS)
- Installs Azure AD Connect (optional silent mode)
- Ready for Azure AD + Intune hybrid testing

## Architecture
![Hybrid Architecture](diagrams/HybridAD-Architecture.png)

## Quick Start
### Requirements
- Windows 10/11 with **Hyper-V enabled**
- Terraform (v1.0+)
- PowerShell 5.1+ or PowerShell 7+
- Windows Server ISO (2019/2022)

### Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/<yourname>/hybrid-ad-lab.git
   cd hybrid-ad-lab/terraform
   ```

2. Update `terraform.tfvars` with your values.

3. Deploy the environment:
   ```bash
   terraform init
   terraform apply -auto-approve
   ```

## Directory Overview
- `terraform/` – Hyper-V VM definitions
- `dsc/` – DSC configurations for AD and AAD Connect
- `scripts/` – Additional setup scripts
- `diagrams/` – Architecture diagrams

## License
MIT License – see [LICENSE](LICENSE).
