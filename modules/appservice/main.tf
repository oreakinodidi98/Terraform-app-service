resource "azurerm_app_service_plan" "app-svc-plan" {
  name                = "${var.naming_prefix}-app-plan"
  location            = var.location
  resource_group_name = var.resourcegroup
  kind = "Linux"
  reserved = true
  tags = var.tags
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app-svc" {
  name                = "${var.naming_prefix}-app-service"
  location            = var.location
  resource_group_name = var.resourcegroup
  app_service_plan_id = azurerm_app_service_plan.app-svc-plan.id

  site_config {
    dotnet_framework_version = "v6.0"
    scm_type                 = "LocalGit" 
    remote_debugging_enabled = true
    remote_debugging_version = "VS2019"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}