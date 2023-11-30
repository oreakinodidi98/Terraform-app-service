variable "resourcegroup" {
  description = "value for resourcegroup"
  type        = string
  default     = "rg-appsvc-01"
}
variable "location" {
  description = "value for location"
  type        = string
  default     = "UK South"
}
variable "naming_prefix" {
  description = "The naming prefix for all resources in this example"
  type        = string
  default     = "appsvc"
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "Ore Akin"
    description = "App SVC Demo"
  }
}
#add log analytics workspace sku 
variable "log_analytics_workspace_sku" {
  description = "The pricing SKU of the Log Analytics workspace."
  default     = "PerGB2018"
}