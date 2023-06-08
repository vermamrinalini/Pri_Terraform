resource "azurerm_resource_group" "vnetresource_grp" {
  name     = var.azurerm_resource_group
  location = var.azure_location 
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "VNet1"
  address_space       = ["10.0.0.0/16"]
  location            = var.azure_location
  resource_group_name = var.azurerm_resource_group
}

resource "azurerm_subnet" "subnet1_vnet1" {
  name                 = "Subnet1"
  resource_group_name  = var.azurerm_resource_group
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_virtual_network" "vnet2" {
  name                = "VNet2"
  address_space       = ["192.168.0.0/16"]
  location            = var.azure_location
  resource_group_name = var.azurerm_resource_group
}

resource "azurerm_subnet" "subnet2_vnet2" {
  name                 = "Subnet2"
  resource_group_name  = var.azurerm_resource_group
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["192.168.1.0/24"]
}

resource "azurerm_virtual_network_peering" "peering_vnet1_to_vnet2" {
  name                         = "vnet1-to-vnet2"
  resource_group_name          = var.azurerm_resource_group
  virtual_network_name         = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "peering_vnet2_to_vnet1" {
  name                         = "vnet2-to-vnet1"
  resource_group_name          = var.azurerm_resource_group
  virtual_network_name         = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}