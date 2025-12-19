resource "azurerm_public_ip" "jump_publicip" {
  name                = "${local.resource_name_prefix}-jump_publicIP"
  location            = azurerm_resource_group.rg-kyn.location
  resource_group_name = azurerm_resource_group.rg-kyn.name
  allocation_method   = "Static"
  sku = "Standard" #basic
  tags = local.project_tags
}