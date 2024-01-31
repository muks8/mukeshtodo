terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.86.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-statefiles-minhaj"
    storage_account_name = "sttodoappminhaj"
    container_name       = "cr-todoapp-minhaj"
    key                  = "todoapp.terraform.tfstate"
  }

}

provider "azurerm" {
  features {}

}