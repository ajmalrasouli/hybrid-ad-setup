
output "dc_vm_name" {
  value = hyperv_vm.dc_server.name
}

output "aad_vm_name" {
  value = hyperv_vm.aad_server.name
}
