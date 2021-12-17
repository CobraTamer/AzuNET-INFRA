terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.90.0"
    }
  }
}

provider "azurerm" {

    features {}

  subscription_id   = "14e8dbb8-d7b0-4435-b22d-7af2377a083f"
  tenant_id         = "e405a8dc-779b-4896-b9d0-83b80361f3ed"
  client_id         = "89b75521-3e67-4161-a0f8-58811e42c38e"
  client_secret     = "rM9Q4ZtzH~ZDK5TNB3tN5pS1tm_n2X~rVm"
}


resource "azurerm_resource_group" "RGWE" {
  name     = "example-resources"
  location = "West Europe"


}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.RGWE.name
  location            = azurerm_resource_group.RGWE.location
  address_space       = ["10.0.0.0/16"]
  
}