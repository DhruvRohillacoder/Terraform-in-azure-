variable "vnets" {
  type = map(object({
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))
  default = {
    vnet1 = {
      address_space       = ["10.0.0.0/16"]
      location            = "centralindia"
      resource_group_name = "dhruv1"
    }

    vnet2 = {
      address_space       = ["10.1.0.0/16"]
      location            = "centralindia"
      resource_group_name = "dhruv1"
    }
  }
}
