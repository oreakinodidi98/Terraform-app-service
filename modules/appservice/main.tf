resource "azurerm_app_service_plan" "app_svc_plan" {
  name                = "${var.naming_prefix}-app-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app_svc" {
  name                = "${var.naming_prefix}-app-service"
  location            = var.location
  resource_group_name = var.resourcegroup
  app_service_plan_id = azurerm_app_service_plan.app_svc_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
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