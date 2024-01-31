#Resource Group
variable "rg-name" {
  type    = string
  default = "rg-todoApp-minhaj"
}

variable "rg-location" {
  type    = string
  default = "East Asia"
}

#Virtual Network
variable "vnet-name" {
  type    = string
  default = "vnet-todoApp-minhaj"
}

variable "vnet-address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

#Subnet
variable "subnets" {
  type = map(any)
}

#Network Security Group
variable "nsg-names" {
  type = map(any)
}

variable "security_rules" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

#Network Interface
variable "frontendnicids" {
  type = map(any)
}

variable "backendnicids" {
  type = map(any)
}

variable "frontendsnets" {
  type = map(any)
}

variable "backendsnets" {
  type = map(any)
}

#NSG Association
variable "frontendnsg" {
  type = map(any)
}

variable "backendnsg" {
  type = map(any)
}

#Public Ips
variable "publicips" {
  type = map(any)
}

#Azure DBServer
variable "dbservername" {
  type = string
}

variable "dbserverversion" {
  type = string
}

variable "dbadmin" {
  type = string
}

variable "dbadminpwd" {
  type = string
}

variable "tlsversion" {
  type = string
}

#Azure Database
variable "dbname" {
  type = string
}

#Virtual Machine
variable "vms" {
  type = map(any)
}

#Azure Bastion
variable "bastionname" {
  type = string
}


#Load Balancer
variable "lbname" {
  type = string
}

variable "backendpool" {
  type = string
}

variable "backendpooladdress" {
  type = string
}

variable "probename" {
  type = string
}

variable "port" {
  type = string
}

variable "protocol" {
  type = string
}

variable "interval" {
  type = string
}

variable "lbrule" {
  type = string
}

variable "frontendport" {
  type = string
}

variable "backendport" {
  type = string
}

variable "lbvms" {
  type = map(any)
}
