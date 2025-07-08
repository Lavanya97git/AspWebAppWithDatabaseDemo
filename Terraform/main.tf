# my own terraform code
provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "AZrg101" {
  name = var.resource_group_name
}
resource "azurerm_app_service_plan" "app_plan" {
  name                = var.app_service_plan_name
  location            = data.azurerm_resource_group.AZrg101.location
  resource_group_name = data.azurerm_resource_group.AZrg101.name
  sku {
    tier = "Standard"
    size = "S1"
  }
  os_type = "Windows"  # change to "Linux" if needed
}

resource "azurerm_app_service" "web_app" {
  name                = var.web_app_name
  location            = data.azurerm_resource_group.AZrg101.location
  resource_group_name = data.azurerm_resource_group.AZrg101.name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id

  site_config {
    dotnet_framework_version = "v6.0"
    scm_type                 = "VSTSRM"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}