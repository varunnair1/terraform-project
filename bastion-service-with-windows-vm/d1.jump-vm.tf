resource "azurerm_linux_virtual_machine" "jump_vm" {
   
  name                = "jump-machine"
  location            = azurerm_resource_group.rg-kyn.location
  resource_group_name = azurerm_resource_group.rg-kyn.name
  size                = var.vm_instance_size["development"]
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.jump_nic.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pem.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
 
}