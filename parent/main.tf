module "rg" {
  source = "../child/resource_group"
}
module "STG" {
  source     = "../child/storage_account"
  depends_on = [module.rg]
}



# module "vnet" {
#   source     = "../child/vnet"
#   depends_on = [module.rg]
# }

# module "subnet" {
#   source     = "../child/subnet"
#   depends_on = [module.vnet]
# }

# module "public_ip" {
#   source     = "../child/Public_ip"
#   depends_on = [module.rg]
# }

# module "vm" {
#   source     = "../child/VM"
#   depends_on = [module.public_ip, module.subnet]
# }
