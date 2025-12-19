#here we are going to put the provider information
#configure the azure provider 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
   backend "azurerm" {
    resource_group_name   = "terraformstoragevarun" #replace the same with your storage account rg
    storage_account_name  = "terraformstoragevarun" #replace the same with your own storage account
    container_name        = "tfstate" #name of the container
    key                   = "project-1-eastus-terraform.tfstate" #state file will be stored with this name
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  # resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
}

variable "client_id" {
  type = string
}
 
variable "client_secret" {
  type = string
}
 
variable "subscription_id" {
  type = string
}
 
variable "tenant_id" {
  type = string
}
