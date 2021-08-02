
###String com carctéres aleatórios para tornar o recurso único
resource "random_id" "vm" {
  byte_length = 4
}

###Provisionamento da NIC que a VM irá fazer uso
resource "azurerm_network_interface" "vmnic" {
  name                = lower(join("-", ["nic",var.vm_name,random_id.vm.hex]))
  location            = var.location #data.azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = lower(join("-", ["priv-ip",var.vm_name,random_id.vm.hex]))
    subnet_id                     = var.sn_id
    private_ip_address_allocation = var.ip_allocation
    private_ip_address = var.ip_allocation == "Static" ? var.ip_address : null
    private_ip_address_version    = "IPv4"
    primary                       = true
  }
}

### Provisionamento da VM sem disco extra anexado
resource "azurerm_windows_virtual_machine" "vm-windows" {
  name                  = var.vm_name
  location              = var.location 
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vmnic.id]
  size               = var.vm_size
  admin_username = var.admin_win_username
  admin_password = var.admin_win_pass
 os_disk {
    caching              = var.caching
    storage_account_type = var.stg_type
  }
source_image_reference {
    publisher = var.img_publisher
    offer     = var.img_offer
    sku       = var.img_sku
    version   = "latest"
  }
  tags                   = var.tags

boot_diagnostics {
   storage_account_uri = var.storage_uri
   }
}
