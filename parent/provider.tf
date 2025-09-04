
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3c0d3e39-55e3-464c-b220-26aee31cecb9"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "apptf"
    storage_account_name = "apptfstg" //this is the name of the storage account
    container_name       = "tfstate"
    key                  = "terraform.tfstate" //this is the name of the state file
  }
}


