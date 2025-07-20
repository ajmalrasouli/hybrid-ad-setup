
variable "admin_password" {
  description = "Local Administrator password"
  type        = string
  sensitive   = true
}

variable "iso_path" {
  description = "Path to the Windows Server ISO"
  type        = string
}

variable "vm_disk_base" {
  description = "Base path for VM disk storage"
  type        = string
}

variable "switch_adapter" {
  description = "Name of the external network adapter used in Hyper-V"
  type        = string
}

variable "domain_name" {
  description = "Active Directory domain name"
  type        = string
}

variable "safe_mode_pass" {
  description = "DSRM Safe Mode password"
  type        = string
  sensitive   = true
}
