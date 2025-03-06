terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend"  
    storage_account_name = "backendstorage121"                      
    container_name       = "tfstate"                       
    key                  = "dev.terraform.tfstate"        
  }
}