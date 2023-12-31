#output resource group name
output "resource_group_name" {
  value = azurerm_resource_group.resourcegroup.name
}
# output web app name
output "app_svc_name" {
  value = module.appservice.app_svc_name
}
# output dev web app name
output "dev_app_svc_name" {
  value = module.appservice.dev_app_svc_name
}
# output Test web app name
output "test_app_svc_name" {
  value = module.appservice.test_app_svc_name
}
# output web app id
output "app_svc_id" {
  value = module.appservice.app_svc_id
}

# output app service plan name
output "app_svc_plan_name" {
  value = module.appservice.app_svc_plan_name
}
# output app service plan id
output "app_svc_plan_id" {
  value = module.appservice.app_svc_plan_id
}
# output dev app service plan id
output "dev_app_svc_id" {
  value = module.appservice.dev_app_svc_id
}
# output test app service plan id
output "test_app_svc_id" {
  value = module.appservice.test_app_svc_id
}
# output log analytics workspace name
output "log_analytics_workspace_name" {
  value = module.loganalytics.log_analytics_workspace_name
}
# output log analytics workspace id
output "log_analytics_workspace_id" {
  value = module.loganalytics.log_analytics_workspace_id
}
# # output source control resource id
# output "source_control_resource_id" {
#   value = module.appservice.source_control_resource_id
# }
# # output dev source control resource id
# output "dev_source_control_resource_id" {
#   value = module.appservice.dev_source_control_resource_id
# }
# output instrumentation key
output "instrumentation_key" {
  value     = module.loganalytics.instrumentation_key
  sensitive = true
}
# output app insights id
output "app_id" {
  value = module.loganalytics.app_id
}