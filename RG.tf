resource "azurerm_resource_group" "myfirstrgMri" {
  name     = var.resource_group_name
  location = var.azure_location 
}
