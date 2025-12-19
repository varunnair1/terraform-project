resource "azurerm_network_interface" "windows_nic" { 

  #the number of key i have that many number of nic card will be created 
   name                = "${local.resource_name_prefix}-nic-windows" 
   #name of the nic card need to be unique to make that unique at the end we have put each,key
  location            = azurerm_resource_group.rg-kyn.location
  resource_group_name = azurerm_resource_group.rg-kyn.name

  ip_configuration {
    name                          = "internal"
    #to get an private ip nic need to be attached with 
    subnet_id                     = azurerm_subnet.web_subnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.web_vm_publicip.id
  }
}