variable "azurerm_resource_group_name" {
  description = "this is the name of the resource group"
  type        = string
  default     = "rg-varun"
}

variable "azurerm_resource_location" {
  description = "this is the location for the rg"
  type        = string
  default     = "eastus"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "business_unit" {
  type    = string
  default = "sap"
}