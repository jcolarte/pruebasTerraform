resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.environment == "prod" ? "GRS" : "LRS"

  # Habilitar versionado de Blobs de forma nativa
  blob_properties {
    versioning_enabled = true
  }

  tags = { Environment = var.environment }
}