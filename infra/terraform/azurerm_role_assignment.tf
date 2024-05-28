resource "azurerm_role_assignment" "cluster-identity" {
    principal_id         = azurerm_user_assigned_identity.cluster.principal_id
    role_definition_name = "Contributor"
    scope                = data.azurerm_resource_group.default.id
}

resource "azurerm_role_assignment" "cluster-identity-operator" {
    principal_id         = azurerm_user_assigned_identity.cluster.principal_id
    role_definition_name = "Managed Identity Operator"
    scope                = azurerm_user_assigned_identity.kubelet.id
}

resource "azurerm_role_assignment" "kubelet-acr" {
    principal_id                     = azurerm_user_assigned_identity.kubelet.principal_id
    role_definition_name             = "AcrPull"
    scope                            = azurerm_container_registry.prod.id
    skip_service_principal_aad_check = true
}