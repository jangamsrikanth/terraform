resource "azurerm_network_security_group" "nsgtest" {
  name                = "nsgtest001"
  location            = azurerm_resource_group.testrg1.location
  resource_group_name = azurerm_resource_group.testrg1.name

  security_rule {
    name                       = "test"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}