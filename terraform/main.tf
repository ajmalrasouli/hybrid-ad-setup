
provider "hyperv" {
  host     = "localhost"
  user     = "Administrator"
  password = "YourSecurePassword123!"
}

resource "hyperv_virtual_switch" "lab" {
  name         = "LabSwitch"
  type         = "external"
  adapter_name = "Ethernet"
}

resource "hyperv_vm" "dc_server" {
  name           = "DC-Server"
  generation     = 2
  memory_startup_bytes = 4 * 1024 * 1024 * 1024
  processor_count = 2
  switch_name    = hyperv_virtual_switch.lab.name
  disk {
    path = "C:/Hyper-V/DC-Server/disk.vhdx"
    size = 60
  }
  image_path = "C:/ISO/WindowsServer2019.iso"
  admin_username = "Administrator"
  admin_password = "YourSecurePassword123!"

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
    path = "C:/Hyper-V/AADConnect-Server/disk.vhdx"
    size = 60
  }
  image_path = "C:/ISO/WindowsServer2019.iso"
  admin_username = "Administrator"
  admin_password = "YourSecurePassword123!"

  provisioner "local-exec" {
    command = "powershell.exe -ExecutionPolicy Bypass -File ../dsc/Trigger-DSC.ps1 -Role AAD"
  }

  depends_on = [hyperv_vm.dc_server]
}
