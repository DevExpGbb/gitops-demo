resource "azurerm_user_assigned_identity" "cluster" {
    name = "${var.prefix}-gitops-demo-cluster01-identity"
    location = data.azurerm_resource_group.default.location
    resource_group_name = data.azurerm_resource_group.default.name
}

resource "azurerm_user_assigned_identity" "kubelet" {
    name = "${var.prefix}-gitops-demo-cluster01-kubelet-identity"
    resource_group_name = data.azurerm_resource_group.default.name
    location = data.azurerm_resource_group.default.location
}
