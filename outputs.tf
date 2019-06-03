output "id" {
  value       = azurerm_virtual_network.main.id
  description = "The ID of the virtual network."
}

output "subnets" {
  value = {
    for s in azurerm_subnet.main :
    s.name => {
      id             = s.id
      name           = s.name
      address_prefix = s.address_prefix
    }
  }

  description = "Map of subnets."
}
