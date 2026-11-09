module "resource_group" {
    source ="../modules/azurerm_resource_group"
    rg = var.rg
}

module "azurerm_virtual_network" {
    depends_on = [ module.resource_group ]
    source = "../modules/azurerm_virtual_network"
    vnet = var.vnet

}

module "subnet" {
    depends_on = [ module.azurerm_virtual_network ]
    source = "../modules/azurerm_subnet"
    sub = var.sub
  
}

module "azurerm_network_interface" { 
    depends_on = [ module.subnet ]
    source = "../modules/azurerm_nic"
    nic = var.nic
  
}

module "azurerm_windows_virtual_machine" {
    depends_on = [ module.azurerm_network_interface ]
    source = "../modules/azurerm_virtual_machine"
    vm = var.vm

}