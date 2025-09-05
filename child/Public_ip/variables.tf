variable "public_ips" {
  type = map(object({
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
  default = {
    pip1 = {
      location            = "eastus"
      resource_group_name = "rg1"
      allocation_method   = "Dynamic"
    }
    pip2 = {
      location            = "westus"
      resource_group_name = "rg2"
      allocation_method   = "Static"
    }
  }
}
