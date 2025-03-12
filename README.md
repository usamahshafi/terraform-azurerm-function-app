# Azure Function App Module

This module automates the provisioning of a complete **Azure Function App environment**, including:

- **Resource Group** to logically group all resources.
- **App Service Plan** to define the hosting environment.
- **Storage Account** to store Function code and logs.
- **Function App** itself, either on **Linux** or **Windows**, depending on your input.

It supports flexible configuration for **performance tiers**, **replication settings**, and **naming conventions**, making it suitable for a variety of Function App deployments.


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.8.0 |

## Modules

No external sub-modules are used in this module.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_function_app.azurerm-function-app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app) | resource |
| [azurerm_resource_group.azurerm-resource-group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_service_plan.azurerm-app-service-plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_storage_account.azurerm-storage-account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_windows_function_app.azurerm-function-app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure region | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Function App OS type: Linux or Windows | `string` | `"Linux"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for naming all resources | `string` | `"example-module"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | App Service Plan SKU | `string` | `"B2"` | no |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | Replication type for the Storage Account (LRS, GRS) | `string` | `"LRS"` | no |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | The tier of the Storage Account (Standard or Premium) | `string` | `"Standard"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_plan_id"></a> [app\_service\_plan\_id](#output\_app\_service\_plan\_id) | The ID of the App Service Plan. |
| <a name="output_app_service_plan_name"></a> [app\_service\_plan\_name](#output\_app\_service\_plan\_name) | The name of the App Service Plan. |
| <a name="output_function_app_default_hostname"></a> [function\_app\_default\_hostname](#output\_function\_app\_default\_hostname) | The default hostname of the Function App. |
| <a name="output_function_app_id"></a> [function\_app\_id](#output\_function\_app\_id) | The ID of the Function App. |
| <a name="output_function_app_name"></a> [function\_app\_name](#output\_function\_app\_name) | The name of the Function App. |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | The location of the Resource Group. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the Resource Group. |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | The ID of the Storage Account. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the Storage Account. |

## **Example Usage**
```hcl
module "function_app" {
  source = "../"

  location                          = "East US"
  prefix                            = "test" 
  storage_account_tier              = "Standard"
  storage_account_replication_type  = "LRS"
  os_type                           = "Linux" # Change to "Windows" if needed
  sku_name                          = "B1"    # Adjust based on your requirement
}
```