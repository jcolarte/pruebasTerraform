variable "environment" {
  type        = string
  description = "Ambiente de despliegue (dev o prod)"
}

variable "location" {
  type        = string
  description = "Región de Azure donde se desplegarán los recursos"
}

variable "rg_name" {
  type        = string
  description = "Nombre del Resource Group"
}

variable "vnet_name" {
  type        = string
  description = "Nombre de la Virtual Network"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Espacio de direcciones de la VNet"
}

variable "subnet_name" {
  type        = string
  description = "Nombre de la Subnet"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "Rango de direcciones de la Subnet"
}

variable "storage_account_name" {
  type        = string
  description = "Nombre único de la Storage Account (minúsculas y números)"
}

variable "vm_name" {
  type        = string
  description = "Nombre de la Máquina Virtual Linux"
}

variable "vm_size" {
  type        = string
  description = "Tamaño/Sabor de la VM"
}

variable "admin_username" {
  type        = string
  description = "Usuario administrador de la VM"
  default     = "azureuser"
}