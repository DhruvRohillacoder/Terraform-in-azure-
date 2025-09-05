data "azurerm_subnet" "subnet" {
  name                 = "cc-subnet"
  virtual_network_name = "cc_vnet"
  resource_group_name  = "cc-resource-group12"
}

data "azurerm_public_ip" "public_ip" {
  name                = "cc-public_ip"
  resource_group_name = "cc-resource-group12"
}

data "azurerm_key_vault" "kv" {
  name                = "myvaultt3"
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


