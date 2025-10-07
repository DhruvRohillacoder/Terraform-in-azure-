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
  subscription_id = "fb322e0a-ada8-4a44-a8eb-255c9a3f992b"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "vmapptf1"           //this is the name of the resource group
    storage_account_name = "vmapptfstg1"        //this is the name of the storage account
    container_name       = "vmtfstate1"         //this is the name of the container created inside the storage account
    key                  = "vmtfstate1.tfstate" //this is the name of the state file
  }
}