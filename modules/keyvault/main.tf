data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  purge_protection_enabled    = var.environment == "prod" ? true : false
  soft_delete_retention_days  = 7
  tags                        = { Environment = var.environment }
}

resource "azurerm_key_vault_access_policy" "current_caller" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get", "List", "Set", "Delete", "Purge", "Recover", "Backup", "Restore"
  ]

  key_permissions = [
    "Get", "List", "Create", "Delete", "Purge", "Recover", "Backup", "Restore"
  ]
}

resource "azurerm_key_vault_access_policy" "vm" {
  count        = var.vm_principal_id != "" ? 1 : 0
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = var.vm_principal_id

  secret_permissions = [
    "Get", "List"
  ]
}
