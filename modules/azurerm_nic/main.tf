 data "azurerm_subnet" "subnet-db" {
  name                 = "nex-subnet"
  virtual_network_name = "vnet-nex"
  resource_group_name  = "nex-rahul"
}

output "subnet_id" {
  value = data.azurerm_subnet.subnet-db.id
}

resource "azurerm_network_interface" "net-in" {
    for_each = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "nex-ip"
    subnet_id                     = data.azurerm_subnet.subnet-db.id
    private_ip_address_allocation = "Dynamic"
  }
}