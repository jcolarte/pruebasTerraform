terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Configuración del Backend Remoto
#   backend "azurerm" {
#     resource_group_name  = "rg-terraform-shared"
#     storage_account_name = "sttfstatecontoso001"
#     container_name       = "tfstate"
#     key                  = "contoso.infrastructure.tfstate"
#   }
}