resource "azurerm_public_ip" "public_ip" {
  name                = "cc-public_ip"
  resource_group_name = "cc-resource-group12"
  location            = "eastus"
  allocation_method   = "Static"
}