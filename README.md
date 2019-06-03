# Azure Virtual Network (VNet)

Create a virtual network (VNet) in Azure.

## Example Usage

```hcl
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}

module "virtual_network" {
  source = "innovationnorway/virtual-network/azurerm"

  name = "example-network"

  resource_group_name = azurerm_resource_group.example.name

  address_space = ["10.0.0.0/16"]

  subnets = [
    {
      name           = "subnet-1"
      address_prefix = "10.0.1.0/24"
    },
    {
      name           = "subnet-2"
      address_prefix = "10.0.2.0/24"
      delegations    = ["Microsoft.ContainerInstance/containerGroups"]
    },
  ]
}
```

## Arguments

| Name | Type | Description |
| --- | --- | --- |
| `name` | `string` | The name of the virtual network. |
| `resource_group_name` | `string` | The name of an existing resource group in which to create the virtual network. |
| `address_space` | `list` | List of IP address prefixes for the virtual network. |
| `subnets` | `list` | List of subnets. |

The `subnets` object accepts the following keys:

| Name | Type | Description |
| --- | --- | --- |
| `name` | `string` | The name of the subnet. |
| `address_prefix` | `string` | The address prefix in CIDR format. |
| `delegations` | `list` | Designate a subnet to be used by a dedicated service. |
| `network_security_group_id` | `string` | The ID of a network security group. |
| `route_table_id` | `string` | The ID of a route table to associate with the subnet. |
| `service_endpoints` | `list` | List of service endpoints. |
