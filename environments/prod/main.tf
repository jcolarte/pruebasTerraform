# Resource Group Principal
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "Contoso Training"
  }
}

# Módulo de Red (VNet, Subnet + Bonus NSG)
module "network" {
  source              = "../../modules/network"
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
  subnet_name         = var.subnet_name
  subnet_prefixes     = var.subnet_address_prefix
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  environment         = var.environment
}

# Módulo de Almacenamiento (Storage Account con Versionamiento)
module "storage" {
  source               = "../../modules/storage"
  storage_account_name = "storageterraform1"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  environment          = var.environment
}

# Módulo de Cómputo (Bonus: Módulo propio para la VM Linux)
module "vm" {
  source              = "../../modules/vm"
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  subnet_id           = module.network.subnet_id
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  environment         = var.environment
}