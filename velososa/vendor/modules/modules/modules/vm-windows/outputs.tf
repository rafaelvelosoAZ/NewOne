output "vm_id" {
  value = azurerm_windows_virtual_machine.vm-windows.id
}

output "vm_ip" {
  value = azurerm_windows_virtual_machine.vm-windows.private_ip_address
}
