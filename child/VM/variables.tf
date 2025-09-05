variable "vms" {
  type = map(object({
    location              = string
    resource_group_name   = string
    network_interface_ids = list(string)
    vm_size               = string
    admin_username        = string
    admin_password        = string
  }))
  default = {
    vm1 = {
      location              = "eastus"
      resource_group_name   = "rg1"
      network_interface_ids = ["/subscriptions/xxxx/resourceGroups/rg1/providers/Microsoft.Network/networkInterfaces/nic1"]
      vm_size               = "Standard_DS1_v2"
      admin_username        = "azureuser"
      admin_password        = "Password1234!"
    }
    vm2 = {
      location              = "westus"
      resource_group_name   = "rg2"
      network_interface_ids = ["/subscriptions/xxxx/resourceGroups/rg2/providers/Microsoft.Network/networkInterfaces/nic2"]
      vm_size               = "Standard_DS1_v2"
      admin_username        = "azureuser"
      admin_password        = "Password1234!"
    }
  }
}
