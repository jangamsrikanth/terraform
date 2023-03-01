output "publicip" {
    value =azurerm_public_ip.Publicipnew.ip_address
    description = "display public ip address"
}
   