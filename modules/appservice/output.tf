output "app_svc_name" {
  value = azurerm_linux_web_app.app-svc.name
}
output "dev_app_svc_name" {
  value = azurerm_linux_web_app_slot.dev-app-svc.name
}
output "app_svc_id" {
  value = azurerm_linux_web_app.app-svc.id
}
output "dev_app_svc_id" {
  value = azurerm_linux_web_app_slot.dev-app-svc.id
}
output "app_svc_plan_name" {
  value = azurerm_service_plan.app-svc-plan.name
}
output "app_svc_plan_id" {
  value = azurerm_service_plan.app-svc-plan.id
}
output "source_control_resource_id" {
  value = azurerm_app_service_source_control.app-svc-git.id
}
# output "dev_source_control_resource_id" {
#   value = azurerm_app_service_source_control_slot.dev-app-svc-git.id
# }