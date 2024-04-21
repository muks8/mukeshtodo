terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.86.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-statefiles-mukesh"
    storage_account_name = "sttodoappmukesh"
    container_name       = "cr-todoapp-mukesh"
    key                  = "todoapp.terraform.tfstate"
  }

}

provider "azurerm" {
  features {}

}