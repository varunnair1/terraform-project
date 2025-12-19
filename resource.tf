#we need to create resource group
resource "azurerm_resource_group" "varun_rg" { #the refrence labels is user defined
  name     = "${local.resource_name_prefix}-${var.azurerm_resource_group_name}"
  #sap-dev
  location = var.azurerm_resource_location

  tags = local.project_tags
  }

