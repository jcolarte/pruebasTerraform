provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "c5fff484-229f-45fe-949d-a83681432aee"
  tenant_id       = "fabd047c-ff48-492a-8bbb-8f98b9fb9cca"
}