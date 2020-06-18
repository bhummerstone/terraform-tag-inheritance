# append random string to storage account for uniqueness
resource "random_string" "stg_suffix" {
  length = 8
  special = false
  upper = false
}

resource "azurerm_storage_account" "stg_acct" {
  name = "var.name${random_string.stg_suffix.result}"
  location = var.location
  resource_group_name = var.rg_name
  account_tier = var.type
  account_replication_type = var.replication

  tags = {
      business_owner = "placeholder"
      cost_centre = "placeholder"
      application_name = "placeholder"
  }

  lifecycle {
      ignore_changes = [
          tags["business_owner"],
          tags["cost_centre"],
          tags["application_name"]
      ]
  }
}