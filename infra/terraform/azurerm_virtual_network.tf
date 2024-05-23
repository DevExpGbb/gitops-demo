resource "azurerm_virtual_network" "default" {
    name = "${var.prefix}-gitops-demo-vnet"
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.default.location
    resource_group_name = azurerm_resource_group.default.name
}

resource "azurerm_subnet" "aks" {
    name = "AKSSubnet"
    resource_group_name = azurerm_resource_group.default.name
    virtual_network_name = azurerm_virtual_network.default.name
    address_prefixes = ["10.0.1.0/24"]
}