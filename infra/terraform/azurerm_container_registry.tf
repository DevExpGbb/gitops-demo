resource "azurerm_container_registry" "prod" {
    name                     = "${var.prefix}gitopsdemoprod"
    resource_group_name      = azurerm_resource_group.default.name
    location                 = azurerm_resource_group.default.location
    sku                      = "Premium"
    admin_enabled            = false
    tags                     = {
        env = "demo"
    }
}