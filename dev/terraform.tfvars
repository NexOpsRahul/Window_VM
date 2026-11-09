rg = {
    rg1 = {
          name     = "nex-rahul"
          location = "central india"
    }
}

vnet = {
    vnet1 = {
       name                = "vnet-nex"
       location            = "central india"
       resource_group_name = "nex-rahul"
       address_space       = ["10.0.0.0/16"]
    }
}

sub = {
    sub1 = {
  name                 = "nex-subnet"
  resource_group_name  = "nex-rahul"
  virtual_network_name = "vnet-nex"
  address_prefixes     = ["10.0.1.0/24"]
    }
}

nic = {
    nic1 = {
          name                = "nex-nic"
          location            = "central india"
          resource_group_name = "nex-rahul"
    }
}

vm = {
    vm1 ={
          name                = "nex-vm"
          resource_group_name = "nex-rahul"
          location            = "central  india"
          size                = "Standard_D4_v5"
          admin_username      = "adminrahul"
          admin_password      = "Rahul@990080"
    }
}