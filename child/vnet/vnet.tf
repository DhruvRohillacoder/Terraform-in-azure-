resource "azurerm_virtual_network" "vnet" {
  name                = "cc_vnet"
  location            = "centralindia"
  resource_group_name = "cc-resource-group12"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_virtual_network" "this" {
  for_each            = var.vnets
  name                = each.key
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}