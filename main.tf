terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "dinesh-resources"
  location = "West Europe"
}

resource "azurerm_resource_group" "example1" {
  name     = "dinesh1-resources"
  location = "West Europe"
}
