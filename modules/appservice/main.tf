# resource "azurerm_app_service_plan" "app-svc-plan" {
#   name                = "${var.naming_prefix}-app-plan"
#   location            = var.location
#   resource_group_name = var.resourcegroup
#   kind = "Linux"
#   reserved = true
#   tags = var.tags
#   sku {
#     tier = "Standard"
#     size = "S1"
#   }
# }
resource "azurerm_service_plan" "app-svc-plan" {
  name                = "${var.naming_prefix}-app-plan"
  resource_group_name = var.resourcegroup
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}
# resource "azurerm_app_service" "app-svc" {
#   name                = "${var.naming_prefix}-app-service"
#   location            = var.location
#   resource_group_name = var.resourcegroup
#   app_service_plan_id = azurerm_app_service_plan.app-svc-plan.id

#   site_config {
#     dotnet_framework_version = "v4.0"
#     scm_type                 = "LocalGit" 
#     remote_debugging_enabled = true
#     remote_debugging_version = "VS2019"
#   }
# # source_control {
# #     repo_url = "https://github.com/oreakinodidi98/Terraform-app-service"
# #     branch = "main"
# #     manual_integration = true
# #     use_mercurial = false
# # }
# }
resource "azurerm_linux_web_app" "app-svc" {
  name                = "${var.naming_prefix}-app-service"
  resource_group_name = var.resourcegroup
  location            = var.location
  service_plan_id     = azurerm_service_plan.app-svc-plan.id

  site_config {}
}
resource "azurerm_app_service_source_control" "app-svc-git" {
  app_id   = azurerm_linux_web_app.app-svc.id
  repo_url = "https://github.com/oreakinodidi98/Terraform-app-service"
  branch   = "main"
  use_manual_integration = true
  use_mercurial = false
}