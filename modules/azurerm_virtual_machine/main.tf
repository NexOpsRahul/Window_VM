data "azurerm_network_interface" "nic-db" {
  name                = "nex-nic"
  resource_group_name = "nex-rahul"
}
resource "azurerm_windows_virtual_machine" "vm-window" {
    for_each = var.vm
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value. admin_password 
  network_interface_ids = [data.azurerm_network_interface.nic-db.id,]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
