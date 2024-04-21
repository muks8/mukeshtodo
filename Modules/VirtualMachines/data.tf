data "azurerm_resource_group" "rg-todoApp" {
  name = "rg-todoApp-mukesh"
}

data "azurerm_network_interface" "vminterface" {
  for_each            = var.vms
  name                = each.value.network_interface_name
  resource_group_name = data.azurerm_resource_group.rg-todoApp.name
}

data "azurerm_key_vault" "todoApp-keyvault" {
  name                = "keyvaluttodoappmukesh"
  resource_group_name = "rg-statefiles-mukesh"
}

data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.todoApp-keyvault.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.todoApp-keyvault.id 
}
