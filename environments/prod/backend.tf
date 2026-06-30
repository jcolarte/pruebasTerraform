terraform {
    backend "azurerm" {
      resource_group_name = "rg-demo-terraform-stg-ua"
      storage_account_name = "storagetfstateua"
      container_name = "tfstate"
      key = "prod/terraform.tfstate"
    }


}