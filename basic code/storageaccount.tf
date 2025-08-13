resource "azurerm_storage_account" "cc-storage" {
  depends_on = [ azurerm_resource_group.cc-rg12 ]
  name                     = "ccstorage12kyo20250806"
  resource_group_name      = "cc-resource-group12"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
