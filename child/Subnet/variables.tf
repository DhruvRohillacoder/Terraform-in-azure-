variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  default = {
    subnet1 = {
      name                 = "subnet1"
      resource_group_name  = "dhruv1"
      virtual_network_name = "vnet1"
      address_prefixes     = ["10.0.1.0/24"]
    }
    subnet2 = {
      name                 = "subnet2"
      resource_group_name  = "dhruv1"
      virtual_network_name = "vnet2"
      address_prefixes     = ["10.1.1.0/24"]
    }
  }
}
