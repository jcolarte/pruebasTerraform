output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Nombre del Resource Group creado"
}

output "vnet_id" {
  value       = module.network.vnet_id
  description = "ID de la Virtual Network"
}

output "subnet_id" {
  value       = module.network.subnet_id
  description = "ID de la Subnet"
}

output "storage_account_name" {
  value       = module.storage.storage_account_name
  description = "Nombre de la Storage Account"
}

output "vm_public_ip" {
  value       = module.vm.public_ip
  description = "IP Pública de la Máquina Virtual"
}