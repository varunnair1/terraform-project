resource "azurerm_network_security_group" "web_nsg" {
  name                = "${local.resource_name_prefix}-nsg"
  location            = azurerm_resource_group.rg-kyn.location
  resource_group_name = azurerm_resource_group.rg-kyn.name
  tags = local.project_tags
}
#once we create the nsg we need to attach the nsg with subnet
resource "azurerm_subnet_network_security_group_association" "web_nsg_associate" {
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}
locals {
  web_nsg_rule = { #web nsg rule is the name 
    "110" : "22", #expression is in key value format
    "120" : "80",
    "130" : "443"
  }
}
#inside nsg we need to create rule
resource "azurerm_network_security_rule" "web_nsg_rule" {
    for_each = local.web_nsg_rule
  name                        = "Rule_Port_${each.value}" #Rule_port_22 
  priority                    = each.key #110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value #22
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-kyn.name
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}
