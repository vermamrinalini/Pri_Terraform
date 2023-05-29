resource "azurerm_availability_set" "avabilityzone" {
  name                = "lb-aset"
  location            = var.azure_location
  resource_group_name = var.resource_group_name

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "securitygp" {
  name                = "securitygp"
  location            = var.azure_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "secgpa" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.securitygp.id
}

resource "azurerm_public_ip" "loadblpip" {
  name                = "loadblpip"
  location            = var.azure_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "azloadbl" {
  name                = "azloadbl"
  location            = var.azure_location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.loadblpip.id
  }
  sku = "Standard"
  depends_on = [ azurerm_public_ip.loadblpip ]
}

resource "azurerm_lb_backend_address_pool" "backendpool" {
  loadbalancer_id = azurerm_lb.azloadbl.id
  name            = "AddressPooljia"
}

resource "azurerm_lb_backend_address_pool_address" "myvmA" {
  name                    = "myvmA"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendpool.id
  virtual_network_id      = azurerm_virtual_network.vnet001.id
  ip_address              = azurerm_network_interface.nic001.private_ip_address
  depends_on              = [azurerm_lb_backend_address_pool.backendpool]
}

resource "azurerm_lb_backend_address_pool_address" "myvmB" {
  name                    = "myvmB"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendpool.id
  virtual_network_id      = azurerm_virtual_network.vnet001.id
  ip_address              = azurerm_network_interface.nic002.private_ip_address
  depends_on              = [azurerm_lb_backend_address_pool.backendpool]
}

resource "azurerm_lb_probe" "healthprob" {
  loadbalancer_id = azurerm_lb.azloadbl.id
  name            = "http"
  port            = 80
}

resource "azurerm_lb_rule" "loadlbrule" {
  loadbalancer_id                = azurerm_lb.azloadbl.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [ azurerm_lb_backend_address_pool.backendpool.id ]
  probe_id                       = azurerm_lb_probe.healthprob.id
}

output "pivateip1" {
  value = azurerm_network_interface.nic001.private_ip_address
}

output "pivateip" {
  value = azurerm_network_interface.nic002.private_ip_address
}



