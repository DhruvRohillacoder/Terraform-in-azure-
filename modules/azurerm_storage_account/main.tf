resource "azurerm_storage_account" "dhruvstg007" {
  name                     = "dhruvstg007"
  resource_group_name      = "Vm-rg1"
  location                 = "West US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
