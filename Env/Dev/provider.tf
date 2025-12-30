terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "dhruv-bd"
  #   storage_account_name = "dhruvbdstg3"
  #   container_name       = "terrafornbd"
  #   key                  = "dev.tfstate"
  #   subscription_id      = "c060d854-01c4-4739-baf7-57540765c3d2"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "c060d854-01c4-4739-baf7-57540765c3d2"
}
