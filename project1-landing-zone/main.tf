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
resource "azurerm_resource_group" "landing_zone" {
  name     = "rg-landing-zone"
  location = "australiaeast"
}

# Policy Assignment - enforce resource tagging
resource "azurerm_resource_group_policy_assignment" "require_tags" {
  name                 = "require-env-tag"
  resource_group_id    = azurerm_resource_group.landing_zone.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"

  display_name = "Require Environment Tag"
  description  = "Enforces that all resources have an Environment tag"

  parameters = jsonencode({
    tagName = {
      value = "Environment"
    }
  })
}