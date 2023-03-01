resource "azurerm_network_interface" "nictest" {
  name                = "nic001"
  location            = azurerm_resource_group.testrg1.location
  resource_group_name = azurerm_resource_group.testrg1.name

  ip_configuration {
    name                          = "test001"
    subnet_id                     = azurerm_subnet.subnettest.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id =azurerm_public_ip.Publicipnew.id 
  }
}