# output log analytics workspace name
output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.app-svc.name
}
# output log analytics workspace id
output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.app-svc.id
}
output "instrumentation_key" {
  value = azurerm_application_insights.app-svc.instrumentation_key
}
output "app_id" {
  value = azurerm_application_insights.app-svc.app_id
}
