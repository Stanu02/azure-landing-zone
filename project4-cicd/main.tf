terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "cicd_rg" {
  name     = "rg-cicd-project"
  location = "australiaeast"
}

# App Service Plan
resource "azurerm_service_plan" "asp" {
  name                = "asp-cicd-project"
  resource_group_name = azurerm_resource_group.cicd_rg.name
  location            = azurerm_resource_group.cicd_rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}

# App Service (Web App)
resource "azurerm_linux_web_app" "webapp" {
  name                = "webapp-cicd-tanu-001"
  resource_group_name = azurerm_resource_group.cicd_rg.name
  location            = azurerm_resource_group.cicd_rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }
}