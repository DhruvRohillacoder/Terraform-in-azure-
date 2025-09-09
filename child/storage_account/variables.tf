variable "storage_accounts" {
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_tier             = string
    account_replication_type = string
  }))
  default = {
    stg1 = {
      name                     = "stg1dhruv202509" # kuch unique jod dijiye
      location                 = "centralindia"
      resource_group_name      = "dhruv1"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }
}
