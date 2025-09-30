resource "azurerm_network_interface" "nic" {
  name                = "cc-nic"
  location            = "centralindia"
  resource_group_name = "dhruv1"
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.public_ip.id
  }
}
resource "azurerm_network_security_group" "nsg" {
  name                = "cc-nsg"
  location            = "centralindia"
  resource_group_name = "dhruv1"
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "Allow-SSH"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "dhruv1"
  network_security_group_name = azurerm_network_security_group.nsg.name
}


resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


resource "azurerm_linux_virtual_machine" "Vm" {
  name                = "cc-vm"
  resource_group_name = "dhruv1"
  location            = "centralindia"
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