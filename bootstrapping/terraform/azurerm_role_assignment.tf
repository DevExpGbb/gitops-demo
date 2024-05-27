resource "azurerm_role_assignment" "github-workload-identity" {
  scope                = azurerm_resource_group.workload-identity.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.github-workload-identity.object_id
}