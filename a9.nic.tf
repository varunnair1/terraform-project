resource "azurerm_network_interface" "webvm_nic" {
   name                = "${local.resource_name_prefix}-nic"
  location            = azurerm_resource_group.varun_rg.location
  resource_group_name = azurerm_resource_group.varun_rg.name

  ip_configuration {
    name                          = "internal"
    #to get an private ip nic need to be attached with 
    subnet_id                     = azurerm_subnet.web_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.web_vm_publicip.id
  }
}