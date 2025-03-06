variable "prefix" {
  description = "Prefix for naming all resources"
  type        = string
  default = "module"
}

variable "location" {
  description = "Azure region"
  type        = string

  validation {
    condition     = contains(["East US", "West US", "Central US"], var.location)
    error_message = "The location must be one of: East US, West US, Central US."
  }
}

variable "sku_name" {
  description = "App Service Plan SKU"
  type        = string
  default     = "B2"

  validation {
    condition     = contains(["B1", "B2"], var.sku_name)
    error_message = "sku_name must be one of: B1, B2"
  }
}

variable "os_type" {
  description = "Function App OS type: Linux or Windows"
  type        = string
  default     = "Linux"

  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "os_type must be either 'Linux' or 'Windows'."
  }
}

variable "storage_account_tier" {
  description = "The tier of the Storage Account (Standard or Premium)"
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.storage_account_tier)
    error_message = "storage_account_tier must be 'Standard' or 'Premium'."
  }
}

variable "storage_account_replication_type" {
  description = "Replication type for the Storage Account (LRS, GRS)"
  type        = string
  default     = "LRS"

  validation {
    condition     = contains(["LRS", "GRS"], var.storage_account_replication_type)
    error_message = "storage_account_replication_type must be one of: 'LRS', 'GRS'."
  }
}
