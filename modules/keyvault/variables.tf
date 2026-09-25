variable "keyvault_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vm_principal_id" {
  description = "Optional object_id of the VM (or its managed identity) for access policy"
  type        = string
  default     = ""
}
