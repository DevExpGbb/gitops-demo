resource "azurerm_user_assigned_identity" "aks-cluster01" {
    name = "${var.prefix}-gitops-demo-cluster01-identity"
    location = azurerm_resource_group.default.location
    resource_group_name = data.azurerm_resource_group.default.name
}

resource "azurerm_user_assigned_identity" "kubelet" {
    name = "${var.prefix}-gitops-demo-cluster01-kubelet-identity"
    resource_group_name = data.azurerm_resource_group.default.name
    location = var.resource_group.location
}
