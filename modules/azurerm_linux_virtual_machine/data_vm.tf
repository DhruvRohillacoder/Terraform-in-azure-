data "azurerm_key_vault" "kv" {
  name                = "dhruv-vault1"
  resource_group_name = "dhruv-bd"
}

data "azurerm_key_vault_secret" "kv_username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "kv_password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_network_interface" "ddnic" {
  name                = "ddnic"
  resource_group_name = "ddrg"
}

data "azurerm_subnet" "ddsubnet" {
  name                 = "ddsubnet"
  virtual_network_name = "ddvnet"
  resource_group_name  = "ddrg"
}
