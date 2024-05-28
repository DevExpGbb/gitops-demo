terraform {
  required_providers {
    http = {
      source = "hashicorp/http"
      version = "3.4.2"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.104.2"
    }
  }
  backend "azurerm" {
    key                   = "terraform.tfstate"
    use_azuread_auth      = true
  }
}

provider "azurerm" {
  features {}
}

locals {
  tags = {
    env = "demo"
  }
}

data "azurerm_resource_group" "default" {
  name = var.resource_group_name
}