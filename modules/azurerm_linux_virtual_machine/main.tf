# resource "azurerm_public_ip" "ddpip" {
#   name                = "ddpip"
#   resource_group_name = "ddrg"
#   location            = "Canada Central"
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

# resource "azurerm_network_interface" "dd_nic" { # <- name matched
#   name                = "ddnic"
#   location            = "Canada Central"
#   resource_group_name = "ddrg"

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = data.azurerm_subnet.ddsubnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.ddpip.id
#   }
# }

# resource "azurerm_linux_virtual_machine" "ddvm" {
#   name                = "ddvm"
#   resource_group_name = "ddrg"
#   location            = "Canada Central"
#   size                = "Standard_D2s_v3"

#   admin_username = data.azurerm_key_vault_secret.kv_username.value

#   network_interface_ids = [
#     azurerm_network_interface.dd_nic.id, # now valid
#   ]

#   admin_password                  = data.azurerm_key_vault_secret.kv_password.value
#   disable_password_authentication = false


#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }


#   # source_image_reference {
#   #   publisher = "Canonical"
#   #   offer     = "0001-com-ubuntu-server-jammy"
#   #   sku       = "24_04-lts"
#   #   version   = "latest"
#   # }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-focal"
#     sku       = "20_04-LTS"
#     version   = "latest"
#   }
# }


resource "azurerm_linux_virtual_machine" "ddvm" {
  name                = "ddvm"
  resource_group_name = "ddrg"
  location            = "Canada Central"
  size                = "Standard_D2s_v3"
  admin_username      = data.azurerm_key_vault_secret.kv_username.value

  network_interface_ids = [
    data.azurerm_network_interface.ddnic.id
  ]

  admin_password                  = data.azurerm_key_vault_secret.kv_password.value
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-LTS"
    version   = "latest"
  }
}
