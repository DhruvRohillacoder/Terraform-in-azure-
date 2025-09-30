variable "public_ips" {
  type = map(object({
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
  default = {
    pip2 = {
      location            = "centralindia"
      resource_group_name = "dhruv1"
      allocation_method   = "Static"
    }
  }
}
