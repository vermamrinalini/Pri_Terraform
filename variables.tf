variable "azure_location" {
    type = string
  //description = "The Azure location where the resources will be provisioned."
  //default     = "West Europe"
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  default     = "myfirstrgMri"
}

variable "vnet_address_space" {
  description = "The address space of the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "subnet1_address_prefix" {
  description = "The address prefix of subnet 1."
  default     = "10.0.1.0/24"
}
variable "subnet2_address_prefix" {
  description = "The address prefix of subnet 2."
  default     = "10.0.2.0/24"
}

variable "linux_vm_os_disk_size" {
  description = "The size of the Linux VM OS disk (in GB)."
  default     = 50
}

variable "windows_vm_os_disk_size" {
  description = "The size of the Windows VM OS disk (in GB)."
  default     = 80
}

variable "linux_vm_name" {
  description = "The name of the Linux VM."
  default     = "linuxvm"
}

variable "windows_vm_name" {
  description = "The name of the Windows VM."
  default     = "windowsvm"
}
variable "linux_vm_size" {
  description = "The size of the Linux VM."
  default     = "Standard_B2s"
}

variable "windows_vm_size" {
  description = "The size of the Windows VM."
  default     = "Standard_B2s"
}

variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine."
  type        = string
}

variable "os_image" {
  description = "OS image for the virtual machine."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
}

variable "storage_account_type" {
  description = "Type of the storage account. Valid values: Standard_LRS, Standard_GRS, Standard_RAGRS, Premium_LRS."
  type        = string
  
}

variable "replication_type" {
  description = "Replication type for the storage account. Valid values: LRS, GRS, RAGRS, ZRS."
  type        = string
}
