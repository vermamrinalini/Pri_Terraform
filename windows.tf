resource "azurerm_windows_virtual_machine" "windowsvm" {
  name                = var.windows_vm_name
  resource_group_name = var.resource_group_name
  location            = var.azure_location
  size                = "Standard_DS2_v2"
  
  admin_username = "adminuser"
  admin_password = "Password123!"

  network_interface_ids = [azurerm_network_interface.nic002.id]

  os_disk {
    name              = "os2"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
    
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  }