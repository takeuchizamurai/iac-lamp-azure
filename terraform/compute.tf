resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "iac-vm"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  size                  = "Standard_B1ls"
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_username        = "azureuser"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "osdisk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  disable_password_authentication = true
}
