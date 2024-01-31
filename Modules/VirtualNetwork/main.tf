data "azurerm_resource_group" "rg-todoApp" {
  name = "rg-todoApp-minhaj"
}

resource "azurerm_virtual_network" "vnet-todoApp" {
  name                = var.vnet-name
  location            = data.azurerm_resource_group.rg-todoApp.location
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
  address_space       = var.vnet-address_space

  dynamic "subnet" {
    for_each = var.subnets !=null ? var.subnets:{}
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }

  tags = {
    environment = "devlopment"
  }
}