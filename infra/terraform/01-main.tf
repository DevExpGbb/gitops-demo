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
  }
}


locals {
  tags = {
    env = "demo"
  }
}