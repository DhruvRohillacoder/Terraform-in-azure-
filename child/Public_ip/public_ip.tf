resource "azurerm_public_ip" "public_ip" {
  name                = "cc-public_ip"
  resource_group_name = "cc-resource-group12"
  location            = "centralindia"
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "this" {
  for_each            = var.public_ips
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
}