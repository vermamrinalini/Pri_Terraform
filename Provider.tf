terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.56.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Basics"
    storage_account_name = "myfirststoragetest07"
    container_name       = "myfirstcontainer"
    key                  = "terraform.tfstate"
  }
}



provider "azurerm" {
  # Configuration options
  skip_provider_registration = "true"
  features {}
}