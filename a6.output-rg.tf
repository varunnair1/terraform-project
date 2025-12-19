output "resource_group_name" {
  description = "this is will display the rg name"
  value = azurerm_resource_group.varun_rg.name
}

output "resource_group_location" {
  description = "this is will display the rg name"
  value = azurerm_resource_group.varun_rg.location
}
#lets display the vm public ip
output "web_vm_publicip" {
  description = "this will be the ip address of the vm"
  value = azurerm_public_ip.web_vm_publicip.ip_address
}