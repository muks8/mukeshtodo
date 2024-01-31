
resource "azurerm_linux_virtual_machine" "vm-todoapp" {
  for_each            = var.vms
  name                = each.value.vmname
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
  location            = data.azurerm_resource_group.rg-todoApp.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password      = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [data.azurerm_network_interface.vminterface[each.key].id]
  disable_password_authentication = false

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}