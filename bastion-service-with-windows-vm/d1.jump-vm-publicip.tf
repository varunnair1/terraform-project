output "jump_vm_publicip" {
  description = "jump vm public ip"
  value = azurerm_public_ip.jump_publicip.ip_address
}