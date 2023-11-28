resource "azurerm_log_analytics_workspace" "app-svc" {
  name                = "${var.naming_prefix}-loga"
  location            = var.location
  resource_group_name = var.resourcegroup
  sku                 = var.log_analytics_workspace_sku

  lifecycle {
    ignore_changes = [
      name,
    ]
  }
}

resource "azurerm_log_analytics_solution" "app-svc-insights" {
  solution_name         = "AppService"
  location              = azurerm_log_analytics_workspace.app-svc.location
  resource_group_name   = var.resourcegroup
  workspace_resource_id = azurerm_log_analytics_workspace.app-svc.id
  workspace_name        = azurerm_log_analytics_workspace.app-svc.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}