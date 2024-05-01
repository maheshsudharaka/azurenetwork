terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "v1.7.5"
    }
  }
}

resource "azurerm_virtual_network" "Vnet" {
    name = "demovnet"
    resource_group_name = "demo-rg"
    location = "us-west-2"
    address_space = "10.0.0.0/16"
}

resource "azurerm_subnet" "subnet01" {
  name = "subnet01"
  resource_group_name = azurerm_virtual_network.Vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.Vnet.name
  address_prefixes = ["10.0.1.0/24"]
  private_endpoint_network_policies_enabled = false
}


