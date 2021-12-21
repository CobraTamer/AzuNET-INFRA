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

#REGION EUROPE
resource "azurerm_resource_group" "RGWE" {
  name     = "WERG"
  location = "West Europe"


}


resource "azurerm_virtual_network" "coreservVNET" {
  name                = "CoreServiceVNET"
  resource_group_name = azurerm_resource_group.RGWE.name
  location            = "West Europe"
  address_space       = ["10.0.0.0/16"]
  
}


resource "azurerm_subnet" "ServSubnet" {
  name                 = "ServSubnet"
  resource_group_name  = azurerm_resource_group.RGWE.name
  virtual_network_name = azurerm_virtual_network.coreservVNET.name
  address_prefixes     = ["10.0.0.0/24"]

}

resource "azurerm_subnet" "AppSubnet" {
  name                 = "AppSubnet"
  resource_group_name  = azurerm_resource_group.RGWE.name
  virtual_network_name = azurerm_virtual_network.coreservVNET.name
  address_prefixes     = ["10.0.2.0/27"]

}

resource "azurerm_subnet" "SubnetGateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.RGWE.name
  virtual_network_name = azurerm_virtual_network.coreservVNET.name
  address_prefixes     = ["10.0.3.0/27"]
}

# REGION WEST US




resource "azurerm_virtual_network" "DevSerVNET" {
  name                = "DevServiceVNET"
  resource_group_name = azurerm_resource_group.RGWE.name
  location            = "West US"
  address_space       = ["10.10.0.0/16"]
  
}


resource "azurerm_subnet" "AzuSubnet" {
  name                 = "AzureSubnet"
  resource_group_name  = azurerm_resource_group.RGWE.name
  virtual_network_name = azurerm_virtual_network.DevSerVNET.name
  address_prefixes     = ["10.10.1.0/24"]

}

resource "azurerm_subnet" "AwsSubnet" {
  name                 = "AwsSubnet"
  resource_group_name  = azurerm_resource_group.RGWE.name
  virtual_network_name = azurerm_virtual_network.DevSerVNET.name
  address_prefixes     = ["10.10.2.0/27"]

}

resource "azurerm_subnet" "GcsSubnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.RGWE.name
  virtual_network_name = azurerm_virtual_network.DevSerVNET.name
  address_prefixes     = ["10.10.3.0/27"]
}





resource "azurerm_virtual_network" "NetAutVNET" {
  name                = "NetAutoVNET"
  resource_group_name = azurerm_resource_group.RGWE.name
  location            = "South Africa North"
  address_space       = ["10.20.0.0/16"]
  
}


resource "azurerm_subnet" "SshSubnet" {
  name                 = "SSHSubnet"
  resource_group_name  = azurerm_resource_group.RGWE.name
  virtual_network_name = azurerm_virtual_network.NetAutVNET.name
  address_prefixes     = ["10.20.1.0/24"]

}

resource "azurerm_subnet" "RESTSubnet" {
  name                 = "RestAPISubnet"
  resource_group_name  = azurerm_resource_group.RGWE.name
  virtual_network_name = azurerm_virtual_network.NetAutVNET.name
  address_prefixes     = ["10.20.2.0/24"]

}

resource "azurerm_subnet" "NetconfSubnet" {
  name                 = "NetConfAPISubnet"
  resource_group_name  = azurerm_resource_group.RGWE.name
  virtual_network_name = azurerm_virtual_network.NetAutVNET.name
  address_prefixes     = ["10.20.3.0/24"]
  
}
