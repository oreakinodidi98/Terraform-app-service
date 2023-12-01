
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
  source              = "./modules/appservice"
  location            = var.location
  resourcegroup       = azurerm_resource_group.resourcegroup.name
  naming_prefix       = var.naming_prefix
  tags                = local.tags
  depends_on          = [azurerm_resource_group.resourcegroup]
  instrumentation_key = module.loganalytics.instrumentation_key
}
#call the module for log analytics
module "loganalytics" {
  source                      = "./modules/loganalytics"
  location                    = var.location
  resourcegroup               = azurerm_resource_group.resourcegroup.name
  log_analytics_workspace_sku = var.log_analytics_workspace_sku
  naming_prefix               = var.naming_prefix
  depends_on                  = [azurerm_resource_group.resourcegroup]
  appsvcid                    = module.appservice.app_svc_id
}