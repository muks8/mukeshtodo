variable "vnet-name" {
  type    = string
  default = "vnet-todoApp-minhaj"
}

variable "vnet-address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnets" {
  type = map(any)
}
