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
   # linux_fx_version = "DOTNET|7.0"
    remote_debugging_enabled = true
    remote_debugging_version = "VS2019"
  }
  # generate SAS in storage account to use for backup
# backup {
#   name             = "app-svc-backup"
#   storage_account_url  = "https://mystorageaccount.blob.core.windows.net/mycontainer?sv=2019-02-02&ss=b&srt=sco&sp=rwdlac&se=2025-01-01T00:00:01Z&st=2020-01-01T00:00:00Z&spr=https&sig=mysignature"
#   schedule {
#     frequency_interval = 30
#     frequency_unit = "Day"
#   }
# }
}
resource "azurerm_app_service_source_control" "app-svc-git" {
  app_id   = azurerm_linux_web_app.app-svc.id
  repo_url = "https://github.com/oreakinodidi98/Terraform-app-service"
  branch   = "main"
  use_manual_integration = true
  use_mercurial = false
}
resource "azurerm_linux_web_app_slot" "dev-app-svc" {
  name           = "Development"
  app_service_id = azurerm_linux_web_app.app-svc.id

  site_config {}
}