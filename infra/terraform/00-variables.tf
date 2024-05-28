variable "prefix" {
  type = string
}

variable "location" {
  type = string
  default = "eastus"
}

variable "kubernetes_version" {
  type = string
  default = null
}

variable "default_node_pool" {
  type = object({
    node_count = number
    vm_size = string
  })
  default = {
    node_count = 1
    vm_size = "Standard_D2s_v3"
  }
}

variable "np01" {
  type = object({
    node_count = number
    vm_size = string
  })
  default = {
    node_count = 1
    vm_size = "Standard_D2s_v3"
  }
}