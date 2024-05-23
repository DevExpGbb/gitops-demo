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
}

provider "http" {
  # Configuration options
}

data "http" "github_public_keys" {
  url = "https://api.github.com/users/${var.GITHUB_USER}/keys"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

locals {
  ssh_public_key = data.http.github_public_keys.body[0]
  tags = {
    env = "demo"
  }
}