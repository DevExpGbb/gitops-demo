resource "azurerm_kubernetes_cluster" "cluster01" {
    name = "${var.prefix}-gitops-demo-cluster01"
    location = data.azurerm_resource_group.default.location
    resource_group_name = data.azurerm_resource_group.default.name
    dns_prefix = "${var.prefix}-gitops-demo-cluster01"
    kubernetes_version = var.kubernetes_version
    
    identity {
        type = "UserAssigned"
        identity_ids = [
            azurerm_user_assigned_identity.cluster.id
        ]
    }

    kubelet_identity {
        client_id = azurerm_user_assigned_identity.kubelet.client_id
        object_id = azurerm_user_assigned_identity.kubelet.principal_id
        user_assigned_identity_id = azurerm_user_assigned_identity.kubelet.id
    }
    
    default_node_pool {
        name = "systemnp01"
        node_count = var.default_node_pool.node_count
        vm_size = var.default_node_pool.vm_size
    }
}

resource "azurerm_kubernetes_cluster_node_pool" "np01" {
    kubernetes_cluster_id = azurerm_kubernetes_cluster.cluster01.id
    name = "usernp01"
    node_count = var.default_node_pool.node_count
    vm_size = var.default_node_pool.vm_size
    os_disk_size_gb = 30
    vnet_subnet_id = azurerm_subnet.aks.id
    enable_auto_scaling = true
    min_count = 1
    max_count = 3
    max_pods = 110
    tags = local.tags
}