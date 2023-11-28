terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.87.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.46.0"
    }
  }
  #initialise  backend
  backend "azurerm" {
    resource_group_name  = "tfstaterg01"
    storage_account_name = "tfstate011823595792"
    container_name       = "tfstate"
    key                  = "appserivce.tfstate"
  }

}
provider "azurerm" {
  features {
  }
}
