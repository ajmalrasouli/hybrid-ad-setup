
provider "hyperv" {
  host     = "localhost"
  user     = "Administrator"
  password = var.admin_password
}

resource "hyperv_virtual_switch" "lab" {
  name         = "LabSwitch"
  type         = "external"
  adapter_name = var.switch_adapter
}

resource "hyperv_vm" "dc_server" {
  name           = "DC-Server"
  generation     = 2
  memory_startup_bytes = 4 * 1024 * 1024 * 1024
  processor_count = 2
  switch_name    = hyperv_virtual_switch.lab.name
  disk {
    path = "${var.vm_disk_base}/DC-Server/disk.vhdx"
    size = 60
  }
  image_path = var.iso_path
  admin_username = "Administrator"
  admin_password = var.admin_password

  provisioner "local-exec" {
    command = "powershell.exe -ExecutionPolicy Bypass -File ../dsc/Trigger-DSC.ps1 -Role DC"
  }
}

resource "hyperv_vm" "aad_server" {
  name           = "AADConnect-Server"
  generation     = 2
  memory_startup_bytes = 4 * 1024 * 1024 * 1024
  processor_count = 2
  switch_name    = hyperv_virtual_switch.lab.name
  disk {
    path = "${var.vm_disk_base}/AADConnect-Server/disk.vhdx"
    size = 60
  }
  image_path = var.iso_path
  admin_username = "Administrator"
  admin_password = var.admin_password

  provisioner "local-exec" {
    command = "powershell.exe -ExecutionPolicy Bypass -File ../dsc/Trigger-DSC.ps1 -Role AAD"
  }

  depends_on = [hyperv_vm.dc_server]
}
