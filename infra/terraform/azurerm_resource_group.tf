resource "azurerm_resource_group" "default" {
    name     = "${var.prefix}-gitops-demo-rg"
    location = var.location
    tags = local.tags
}