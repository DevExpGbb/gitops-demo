resource "azurerm_storage_account" "backend" {
    name = "${local.environment_name}backend"
    resource_group_name = azurerm_resource_group.workload-identity.name
    location = azurerm_resource_group.workload-identity.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = local.tags
}

resource "azurerm_storage_container" "backend" {
    name = "infra"
    storage_account_name = azurerm_storage_account.backend.name
    container_access_type = "private"
}
