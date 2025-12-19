
resource "azurerm_subnet" "jump_subnet" {
  name                 = "${local.resource_name_prefix}-${var.jump_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-kyn.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.jump_subnet_address


}