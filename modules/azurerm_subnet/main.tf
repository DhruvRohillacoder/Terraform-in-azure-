resource "azurerm_subnet" "ddsubnet" {
  name                 = "ddsubnet"
  resource_group_name  = "ddrg"
  virtual_network_name = "ddvnet"
  address_prefixes     = ["10.0.1.0/24"]
}
