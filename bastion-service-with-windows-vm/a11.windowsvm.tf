resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = "web-machine"
  location            = azurerm_resource_group.rg-kyn.location
  resource_group_name = azurerm_resource_group.rg-kyn.name
  size                = "Standard_D2s_v3"
  admin_username      = "azureuser"
  admin_password = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.windows_nic.id,
  ]
/*
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pem.pub")
  }
*/
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "microsoftwindowsdesktop"
    offer     = "windows-11"
    sku       = "win11-25h2-pro"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app/app.ps1")
}