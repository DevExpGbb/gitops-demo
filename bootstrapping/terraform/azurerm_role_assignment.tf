resource "azurerm_role_assignment" "github-workload-identity" {
  scope                = azurerm_resource_group.workload-identity.id
  role_definition_name = "Owner"
  principal_id         = azuread_service_principal.github-workload-identity.object_id
}

resource "azurerm_role_assignment" "github-workload-identity-storage-blob-data-contributor" {
  scope                = azurerm_resource_group.workload-identity.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_service_principal.github-workload-identity.object_id
}