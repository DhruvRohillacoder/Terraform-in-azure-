module "RG" {
  source = "../../modules/azurerm_resource_group"
}



module "vnet" {
  source     = "../../modules/azurerm_vnet"
  depends_on = [module.RG]

}

module "subnet" {
  source     = "../../modules/azurerm_subnet"
  depends_on = [module.vnet]
}

module "ddpip" {
  source     = "../../modules/azurerm_public_ip"
  depends_on = [module.subnet]
}
module "ddnic" {
  source     = "../../modules/azurerm_network_interface"
  depends_on = [module.ddpip]
}



module "vm" {
  source     = "../../modules/azurerm_linux_virtual_machine"
  depends_on = [module.ddnic]
}
