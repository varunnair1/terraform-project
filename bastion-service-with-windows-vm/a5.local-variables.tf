locals {
  resource_name_prefix = "${var.business_unit}-${var.environment}"
  #sap-dev
  project_tags = { #this is the name
    Owner       = "SAP"
    environment = "dev"
    Project     = "kyn"
  }
}