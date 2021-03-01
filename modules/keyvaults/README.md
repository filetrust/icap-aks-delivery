## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |
| null | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [azurerm_client_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) |
| [azurerm_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) |
| [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) |
| [null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_region | Metadata Azure Region | `string` | `"UKWEST"` | no |
| enable\_customer\_cert | The Azure backend storage account | `bool` | `false` | no |
| file\_drop\_dns | Name of the common name used for the certs | `string` | `"file-drop.ukwest.cloudapp.azure.com"` | no |
| icap\_dns | Name of the common name used for the certs | `string` | `"icap-client.ukwest.cloudapp.azure.com"` | no |
| kv\_name | The name of the key vault | `string` | `"aks-delivery-keyvault-01"` | no |
| mgmt\_dns | Name of the common name used for the certs | `string` | `"management-ui.ukwest.cloudapp.azure.com"` | no |
| resource\_group | Azure Resource Group | `string` | `"gw-icap-aks-delivery-keyvault"` | no |

## Outputs

| Name | Description |
|------|-------------|
| keyvault\_name | n/a |
