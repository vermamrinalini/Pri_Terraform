resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.azure_location
  size                = var.linux_vm_size
disable_password_authentication = false
  admin_username = "adminuser"
  admin_password = "Password123!"

  network_interface_ids = [azurerm_network_interface.nic001.id]

  os_disk {
    name              = var.os_image
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb      = var.linux_vm_os_disk_size
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  }