resource "azurerm_bastion_host" "todo_azurebastion" {
  name                = var.bastionname
  location            = data.azurerm_resource_group.rg-todoApp.location
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.snet-azurebastion.id
    public_ip_address_id = data.azurerm_public_ip.pip-azurebastion.id
  }
}