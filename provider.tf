provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.13.0"
  features {}

  client_id = var.client_id
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
  client_secret = var.client_secret
}