
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "4a8937a7-b294-4a1f-8d31-79bbb1a4c17f"
}
terraform {
  backend "azurerm" {
    resource_group_name   = "tfdhruvrg"
    storage_account_name  = "tfdhruvstg"//this is the name of the storage account
    container_name        = "tfstate"
    key                   = "terraform.tfstate"//this is the name of the state file
  }
}


