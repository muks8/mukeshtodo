resource "azurerm_subnet_network_security_group_association" "nsg-todoApp-frontend-association" {
  subnet_id                 = data.azurerm_subnet.snet-todoApp-frontend.id
  network_security_group_id = data.azurerm_network_security_group.nsg-todoApp-frontend.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-todoApp-backend-association" {
  subnet_id                 = data.azurerm_subnet.snet-todoApp-backend.id
  network_security_group_id = data.azurerm_network_security_group.nsg-todoApp-backend.id
}
