resource "azurerm_virtual_network" "vnet" {
  name                = "cc_vnet"
  location            = "centralindia"
  resource_group_name = "cc-resource-group12"
  address_space       = ["10.0.0.0/16"]
}