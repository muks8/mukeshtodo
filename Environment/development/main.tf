#Resource Group
module "resource_group" {
  source      = "../../Modules/ResourceGroup"
  rg-name     = var.rg-name
  rg-location = var.rg-location
}

#Virtual network and Subnets
module "virtual_network" {
  source     = "../../Modules/VirtualNetwork"
  vnet-name  = var.vnet-name
  subnets    = var.subnets
  depends_on = [module.resource_group]
}

#Network Security Group
module "network_security_group" {
  source         = "../../Modules/NetworkSecurityGroup"
  nsg-names      = var.nsg-names
  security_rules = var.security_rules
  depends_on     = [module.resource_group]

}

#Network Interface 
module "network_interface" {
  source         = "../../Modules/NetworkInterface"
  frontendnicids = var.frontendnicids
  backendnicids  = var.backendnicids
  frontendsnets  = var.frontendsnets
  backendsnets   = var.backendsnets
  depends_on     = [module.resource_group, module.virtual_network, module.network_security_group]
}

#NSG and Subnet association
module "nsg_association" {
  source        = "../../Modules/NSGAssociation"
  frontendsnets = var.frontendsnets
  backendsnets  = var.backendsnets
  frontendnsg   = var.frontendnsg
  backendnsg    = var.backendnsg

  depends_on = [module.resource_group, module.virtual_network, module.network_interface]
}

#Public IPS
module "publicips" {
  source    = "../../Modules/PublicIPs"
  publicips = var.publicips

  depends_on = [module.resource_group, module.virtual_network]
}

#Azure database server
module "azure_dbserver" {
  source          = "../../Modules/AzureSQLServer"
  dbservername    = var.dbservername
  dbadmin         = var.dbadmin
  dbadminpwd      = var.dbadminpwd
  dbserverversion = var.dbserverversion
  tlsversion      = var.tlsversion

  depends_on = [module.resource_group, module.virtual_network]

}

#Azure database
module "azure_database" {
  source       = "../../Modules/AzureSQLDatabase"
  dbservername = var.dbservername
  dbname       = var.dbname

  depends_on = [module.resource_group, module.virtual_network, module.azure_dbserver]
}

#Azure Virtual Machines
module "azure_virtual_machines" {
  source = "../../Modules/VirtualMachines"
  vms    = var.vms

  depends_on = [module.resource_group, module.virtual_network, module.network_interface, module.nsg_association, module.nsg_association]
}

#Azure Bastion
module "azure_bastion" {
  source      = "../../Modules/AzureBastion"
  bastionname = var.bastionname

  depends_on = [module.resource_group, module.virtual_network, module.network_interface, module.publicips]
}

#Azure load balancer
module "load_balancer" {
  source             = "../../Modules/LoadBalancer"
  lbname             = var.lbname
  backendpool        = var.backendpool
  backendpooladdress = var.backendpooladdress
  vms                = var.lbvms
  probename          = var.probename
  port               = var.port
  protocol           = var.protocol
  interval           = var.interval
  lbrule             = var.lbrule
  frontendport       = var.frontendport
  backendport        = var.backendport

  depends_on = [module.azure_virtual_machines]
}
