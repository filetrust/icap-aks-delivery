resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group
  location = var.region

  tags = {
    created_by         = "Glasswall Solutions"
    deployment_version = "1.0.0"
  }
}

resource "azurerm_container_registry" "acr" {
  name                     = var.registry_name
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  sku                      = "Premium"
  admin_enabled            = false
  
  tags = {
    created_by         = "Glasswall Solutions"
    deployment_version = "1.0.0"
  }
}