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
    product   = "ContainerInsights"
  }
}
resource "azurerm_application_insights" "app-svc" {
  name                = "${var.naming_prefix}-app-insight"
  location            = var.location
  resource_group_name = var.resourcegroup
  application_type    = "web"
  workspace_id = azurerm_log_analytics_workspace.app-svc.id
}
resource "azurerm_monitor_action_group" "actiongroup" {
  name                = "${var.naming_prefix}-actiongroup"
  resource_group_name = var.resourcegroup
  short_name          = "Action"

    email_receiver {
    name          = "sendtoadmin"
    email_address = "oreakinodidi@microsoft.com"
  }
}
resource "azurerm_monitor_metric_alert" "metric" {
  name                = "${var.naming_prefix}-metricalert"
  resource_group_name = var.resourcegroup
  scopes              = var.appsvcid
  description         = "Action will be triggered when Transactions count is greater than 50."

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Requests"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 2
  }

  action {
    action_group_id = azurerm_monitor_action_group.actiongroup.id
  }
}
