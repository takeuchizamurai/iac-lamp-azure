resource "azurerm_linux_virtual_machine" "vm" {
  name                = "iac-vm"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  size                  = "Standard_B1s"
  zone = "1"

  # --- Spot（超低価格／いつでも回収され得る） ---
  priority        = "Spot"                        # 通常運用なら外す
  eviction_policy = "Deallocate"                  # 回収時は停止（ディスク保持）
  max_bid_price   = -1                            # 市場価格に追随（上限なし）

  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_username        = "azureuser"

  os_disk {
    name                 = "osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"        # 最安のHDD
    disk_size_gb         = 30                    # Ubuntuの最小相当を明示
    # （オプション）対応サイズならエフェメラル化：
    # diff_disk_settings {
    #   option = "Local"                          # エフェメラルOSディスク（ディスク料金0）
    # }
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
