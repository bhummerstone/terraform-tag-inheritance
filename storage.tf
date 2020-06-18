resource "azurerm_resource_group" "tf_tags_rg" {
  name     = "tftags"
  location = "North Europe"

  tags = {
    business_owner = "benhu"
    cost_centre = "12345"
    application_name = "myapp"
  }
}

module "tf_tags_stg" {
  source = "./stg_tags"
  
  name = "bhtftag"
  location = azurerm_resource_group.tf_tags_rg.location
  rg_name = azurerm_resource_group.tf_tags_rg.name
  type = "Standard"
  replication = "LRS"
}

