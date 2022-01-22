resource azurerm_resource_group "finance-rg1" {
  name     = "finance-rg1"
  location = "West Europe"
}

resource "azurerm_resource_group" "finance-rg23" {
  name     = "finance-rg2"
  location = "West Europe"
}

resource "azurerm_resource_group" "finance-rg3" {
  name     = "finance-rg3"
  location = "West Europe"
}

resource azurerm_resource_group "newrg" {
    name     = "newrg3"
    location = "eastus"

    tags = {

        "owner" = "ntms"
    }

}

// /subscriptions/32575352-315d-4a79-8163-5efbd5c09901/resourceGroups/newrg

// /subscriptions/dfa1bea9-7451-46f5-8644-edaa7ed53cb8/resourceGroups/newrg2

// /subscriptions/a78c602e-a3b3-4af1-98eb-8bc530d418bb/resourceGroups/newrg3