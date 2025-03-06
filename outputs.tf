output "resource_group_name" {
  description = "The name of the Resource Group."
  value       = azurerm_resource_group.azurerm-resource-group.name
}

output "resource_group_location" {
  description = "The location of the Resource Group."
  value       = azurerm_resource_group.azurerm-resource-group.location
}

# Storage Account Outputs
output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.azurerm-storage-account.name
}

output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.azurerm-storage-account.id
}

# App Service Plan Outputs
output "app_service_plan_name" {
  description = "The name of the App Service Plan."
  value       = azurerm_service_plan.azurerm-app-service-plan.name
}

output "app_service_plan_id" {
  description = "The ID of the App Service Plan."
  value       = azurerm_service_plan.azurerm-app-service-plan.id
}

# Function App Outputs - Conditional Based on OS Type
output "function_app_name" {
  description = "The name of the Function App."
  value = var.os_type == "Windows" ?  azurerm_windows_function_app.azurerm-function-app[0].name : azurerm_linux_function_app.azurerm-function-app[0].name
}

output "function_app_id" {
  description = "The ID of the Function App."
  value = var.os_type == "Windows" ? azurerm_windows_function_app.azurerm-function-app[0].id : azurerm_linux_function_app.azurerm-function-app[0].id
}

output "function_app_default_hostname" {
  description = "The default hostname of the Function App."
  value = var.os_type == "Windows" ? azurerm_windows_function_app.azurerm-function-app[0].default_hostname : azurerm_linux_function_app.azurerm-function-app[0].default_hostname
}
