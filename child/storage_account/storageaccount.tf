resource "azurerm_storage_account" "cc-storage" {
  //depends_on               = [azurerm_resource_group.cc-rg13]
  name                     = "ccstorage12kyo2024"
  resource_group_name      = "cc-resource-group12"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
