
locals {
  tags = {
    environment = "dev"
    owner       = "Ore"
  }
}
#create resource group
resource "azurerm_resource_group" "resourcegroup" {
  name     = var.resourcegroup
  location = var.location
  tags     = local.tags
}
#call the module
module "appservice" {
  source         = "./modules/appservice"
  location       = var.location
  resourcegroup  = azurerm_resource_group.resourcegroup.name
  naming_prefix  = var.naming_prefix
  depends_on = [ azurerm_resource_group.resourcegroup ]
}