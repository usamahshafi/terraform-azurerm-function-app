terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.8.0"
    }
  }

#   backend "azurerm" {
#     resource_group_name  = "terraform-backend"  
#     storage_account_name = "backendstorage121"                      
#     container_name       = "tfstate"                       
#     key                  = "test.terraform.tfstate"        
#   }

  required_version = ">=1.9.0"
}

provider "azurerm" {
    features {
      
    }
  
}

module "function_app" {
  source = "../"

  location                          = "East US"
  prefix                            = "test" 
  storage_account_tier              = "Standard"
  storage_account_replication_type  = "LRS"
  os_type                           = "Linux" # Change to "Windows" if needed
  sku_name                          = "B1"    # Adjust based on your requirement
}
