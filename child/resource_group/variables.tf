variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  default = {
    rg1 = { name = "dhruv1", location = "centralindia" }
  }
}