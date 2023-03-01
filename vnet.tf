resource "azurerm_virtual_network" "testvnet001" {
  name                = "testvnet1"
  address_space       = ["192.168.0.0/16"]
  location            = azurerm_resource_group.testrg1.location
  resource_group_name = azurerm_resource_group.testrg1.name
}

resource "azurerm_subnet" "subnettest" {
  name                 = "subnetA"
  resource_group_name  = azurerm_resource_group.testrg1.name
  virtual_network_name = azurerm_virtual_network.testvnet001.name
  address_prefixes     = ["192.168.0.0/24"]
}