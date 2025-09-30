data "azurerm_subnet" "subnet" {
  name                 = "subnet1"
  virtual_network_name = "vnet1"
  resource_group_name  = "dhruv1"
}

data "azurerm_public_ip" "public_ip" {
  name                = "pip2"
  resource_group_name = "dhruv1"
}

data "azurerm_key_vault" "kv" {
  name                = "myvaultt4"
  resource_group_name = "apptf"
}
data "azurerm_key_vault_secret" "vm-username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "kv_admin_password" {
  name         = "vmpy" # 👈 Replace with the actual secret name in your Key Vault
  key_vault_id = data.azurerm_key_vault.kv.id
}


