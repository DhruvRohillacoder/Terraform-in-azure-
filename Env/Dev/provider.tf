terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  # terraform {
  backend "azurerm" {
    resource_group_name  = "dhruv-bd"
    storage_account_name = "dhruvbdstg"
    container_name       = "terrafornbd"
    key                  = "dev.tfstate"
    subscription_id      = "e18988e4-e1f4-4f06-9339-c63c8a22d3d9"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e18988e4-e1f4-4f06-9339-c63c8a22d3d9"
}
