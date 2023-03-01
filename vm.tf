resource "azurerm_virtual_machine" "VM001" {
  name                  = "AnsibleACS"
  location              = azurerm_resource_group.testrg1.location
  resource_group_name   = azurerm_resource_group.testrg1.name
  network_interface_ids = [azurerm_network_interface.nictest.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "Srikanth"
    admin_username = "Srikanth"
    admin_password = "Srikanth@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
connection {
    type     = "ssh"
    user     = "Srikanth"
    password = "Srikanth@123"
    host     = azurerm_public_ip.Publicipnew.ip_address
  }
  provisioner "remote-exec" {
    inline = [
       "sudo apt-get update", 
       "sudo apt install openjdk-11-jdk -y",
       "sudo apt install software-properties-common",
       "sudo apt-add-repository --yes --update ppa:ansible/ansible",
       "sudo apt install ansible -y",
       "sudo apt-get install wget -y"
    ]
  }
}   
