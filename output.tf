output "private_ip_addresses" {
  value = azurerm_linux_virtual_machine.linuxvm.private_ip_address
}

output "public_ip_addresses" {
  value = azurerm_linux_virtual_machine.linuxvm.public_ip_addresses
}

output "linuxvmid" {
    value = azurerm_windows_virtual_machine.windowsvm.id
}
output "windows_private_ip_addresses" {
  value = azurerm_windows_virtual_machine.windowsvm.private_ip_address
}

output "windows_public_ip_addresses" {
  value = azurerm_windows_virtual_machine.windowsvm.public_ip_addresses
}

output "windowsvmid" {
    value = azurerm_windows_virtual_machine.windowsvm.id
}
output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}