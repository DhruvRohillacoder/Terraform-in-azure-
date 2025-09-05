variable "key_vaults" {
  type = map(object({
    location            = string
    resource_group_name = string
    tenant_id           = string
    sku_name            = string
  }))
  default = {
    kv1 = {
      location            = "eastus"
      resource_group_name = "rg1"
      tenant_id           = "<your-tenant-id>"
      sku_name            = "standard"
    }
    kv2 = {
      location            = "westus"
      resource_group_name = "rg2"
      tenant_id           = "<your-tenant-id>"
      sku_name            = "premium"
    }
  }
}
