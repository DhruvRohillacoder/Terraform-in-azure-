resource "azurerm_storage_account" "cc-stg"{
  name                     = "ccsg"
  resource_group_name      = "cc-rg"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}