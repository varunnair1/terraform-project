/*resource "azurerm_public_ip" "web_vm_publicip" {
  name                = "${local.resource_name_prefix}-publicIP"
  location            = azurerm_resource_group.rg-kyn.location
  resource_group_name = azurerm_resource_group.rg-kyn.name
  allocation_method   = "Static"
  sku = "Standard" #basic
  tags = local.project_tags
}*/