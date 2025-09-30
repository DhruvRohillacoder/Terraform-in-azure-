terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" //specify the source of the provider here
      version = "4.38.1"            //specify the version of the provider here
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3c0d3e39-55e3-464c-b220-26aee31cecb9" //enter your subscription id here
}

terraform {
  backend "azurerm" {
    resource_group_name  = "apptf"              //this is the name of the resource group
    storage_account_name = "apptfstg"           //this is the name of the storage account
    container_name       = "tfstate"            //this is the name of the container created inside the storage account
    key                  = "terraform1.tfstate" //this is the name of the state file
  }
}