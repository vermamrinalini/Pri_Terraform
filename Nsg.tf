resource "azurerm_network_security_group" "nsg_subnet1" {
  name                = "nsg_subnet1"
  location            = var.azure_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "nsg_subnet2" {
  name                = "nsg_subnet2"
  location            = var.azure_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "association1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg_subnet1.id
}

resource "azurerm_subnet_network_security_group_association" "association2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg_subnet2.id
}

resource "azurerm_network_security_rule" "inbound_rule_nsg_subnet1" {
  name                        = "inbound-rule-nsg-subnet1"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefixes     = ["10.0.0.0/16"]
  destination_address_prefix  = azurerm_subnet.subnet1.address_prefixes[0]
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg_subnet1.name
}

resource "azurerm_network_security_rule" "inbound_rule_nsg_subnet2" {
  name                        = "inbound-rule-nsg-subnet2"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefixes     = ["10.0.0.0/16"]
  destination_address_prefix  = azurerm_subnet.subnet2.address_prefixes[0]
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg_subnet2.name
}

resource "azurerm_network_security_rule" "outbound_rule_nsg_subnet1" {
  name                        = "outbound-rule-nsg-subnet1"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefixes     = [azurerm_subnet.subnet1.address_prefixes[0]]
  destination_address_prefix  = "10.0.0.0/16"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg_subnet1.name
}

resource "azurerm_network_security_rule" "outbound_rule_nsg_subnet2" {
  name                        = "outbound-rule-nsg-subnet2"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefixes     = [azurerm_subnet.subnet2.address_prefixes[0]]
  destination_address_prefix  = "10.0.0.0/16"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg_subnet2.name
}