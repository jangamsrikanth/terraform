resource "azurerm_public_ip" "Publicipnew" {
  name                = "publicip01"
  resource_group_name = azurerm_resource_group.testrg1.name
  location            = azurerm_resource_group.testrg1.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}