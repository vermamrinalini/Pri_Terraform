resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.azure_location
  account_tier             = var.storage_account_type
  account_replication_type = var.replication_type
}