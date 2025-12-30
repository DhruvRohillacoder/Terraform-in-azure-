resource "azurerm_virtual_network" "ddvnet" {
  name                = "ddvnet"
  location            = "Canada Central"
  resource_group_name = "ddrg"
  address_space       = ["10.0.0.0/16"]
}
