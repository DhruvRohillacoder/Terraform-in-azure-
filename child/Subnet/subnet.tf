resource "azurerm_subnet" "subnet" {
  name                 = "cc-subnet"
  resource_group_name  = "cc-resource-group12"
  virtual_network_name = "cc_vnet"
  address_prefixes     = ["10.0.1.0/24"]
  # This file defines the configuration for a subnet resource.
  # Add your subnet resource block and its parameters within this file.
}