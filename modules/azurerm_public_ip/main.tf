resource "azurerm_public_ip" "ddpip" {
  name                = "ddpip"
  resource_group_name = "ddrg"
  location            = "Canada Central"
  allocation_method   = "Static"
  sku                 = "Standard"
}
