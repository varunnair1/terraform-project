
resource "azurerm_subnet" "web_subnet" {
  name                 = "${local.resource_name_prefix}-${var.web_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg-kyn.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.web_subnet_address


}
#refrence label is related to terraform state file
#name related to azure name
#single line comment # //
#multi line comment /* end with */