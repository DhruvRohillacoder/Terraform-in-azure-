module "RG" {
  source = "../../modules/azurerm_resource_group"
}
module "stg" {
  depends_on = [module.RG]
  source     = "../../modules/azurerm_storage_account"
}