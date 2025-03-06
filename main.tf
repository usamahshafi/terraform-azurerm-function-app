# test changes 
resource "azurerm_resource_group" "azurerm-resource-group" {
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "azurerm-storage-account" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.azurerm-resource-group.name
  location                 = azurerm_resource_group.azurerm-resource-group.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_service_plan" "azurerm-app-service-plan" {
  name                = local.app_service_plan_name
  resource_group_name = azurerm_resource_group.azurerm-resource-group.name
  location            = azurerm_resource_group.azurerm-resource-group.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_windows_function_app" "azurerm-function-app" {
  count               = var.os_type == "Windows" ? 1 : 0
  name                = local.function_app_name
  resource_group_name = azurerm_resource_group.azurerm-resource-group.name
  location            = azurerm_resource_group.azurerm-resource-group.location

  storage_account_name       = azurerm_storage_account.azurerm-storage-account.name
  storage_account_access_key = azurerm_storage_account.azurerm-storage-account.primary_access_key
  service_plan_id            = azurerm_service_plan.azurerm-app-service-plan.id

  site_config {}
}

resource "azurerm_linux_function_app" "azurerm-function-app" {
  count               = var.os_type == "Linux" ? 1 : 0
  name                = local.function_app_name
  resource_group_name = azurerm_resource_group.azurerm-resource-group.name
  location            = azurerm_resource_group.azurerm-resource-group.location

  storage_account_name       = azurerm_storage_account.azurerm-storage-account.name
  storage_account_access_key = azurerm_storage_account.azurerm-storage-account.primary_access_key
  service_plan_id            = azurerm_service_plan.azurerm-app-service-plan.id

  site_config {}
}