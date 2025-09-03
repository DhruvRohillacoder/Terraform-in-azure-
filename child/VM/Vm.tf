resource "azurerm_network_interface" "nic" {
  name                = "cc-nic"
  location            = "eastus"
  resource_group_name = "cc-resource-group12"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "Vm" {
  name                = "cc-vm"
  resource_group_name = "cc-resource-group12"
  location            = "eastus"
  size                = "Standard_F2"
  admin_username      = data.azurerm_key_vault_secret.vm-username.value
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]


  admin_password                  = data.azurerm_key_vault_secret.kv_admin_password.value
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}