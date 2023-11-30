resource "azurerm_service_plan" "app-svc-plan" {
  name                = "${var.naming_prefix}-app-plan"
  resource_group_name = var.resourcegroup
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}
resource "azurerm_linux_web_app" "app-svc" {
  name                = "${var.naming_prefix}-app-service"
  resource_group_name = var.resourcegroup
  location            = var.location
  service_plan_id     = azurerm_service_plan.app-svc-plan.id
        # Configuration for Azure Application Insights
  app_settings = {
      "APPINSIGHTS_INSTRUMENTATIONKEY" = var.instrumentation_key 
      }
        site_config {
    // other site_config settings...
  }
}
resource "azurerm_app_service_source_control" "app-svc-git" {
  app_id   = azurerm_linux_web_app.app-svc.id
  repo_url = "https://github.com/oreakinodidi98/Terraform-app-service"
  branch   = "main"
  use_manual_integration = true
  use_mercurial = false
}