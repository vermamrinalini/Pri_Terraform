resource "azurerm_virtual_network" "vnet001" {
  name                = "vnet001"
  address_space       = ["10.0.0.0/16"]
  location            = var.azure_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet001.name
  address_prefixes     = ["10.0.1.0/24"]

}
resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet001.name
  address_prefixes     = ["10.0.2.0/24"]
}


resource "azurerm_public_ip" "public001" {
  name                = "public001"
  location            = var.azure_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "public002" {
  name                = "public002"
  location            = var.azure_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic001" {
  name                = "nic001"
  resource_group_name = var.resource_group_name
  location            = var.azure_location
ip_configuration {
    name                          = "ipconfig001"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public001.id
}
}
resource "azurerm_network_interface" "nic002" {
  name                = "nic002"
  resource_group_name = var.resource_group_name
  location            = var.azure_location
ip_configuration {
    name                          = "ipconfig001"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public002.id
  }
}