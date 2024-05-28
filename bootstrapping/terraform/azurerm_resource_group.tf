resource "azurerm_resource_group" "workload-identity" {
    name = "gitops-demo-${local.environment_name}"
    location = var.location
    tags = local.tags
}