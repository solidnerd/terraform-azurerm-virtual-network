variable "name" {
  type        = string
  description = "The name of the virtual network (VNet)."
}

variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group."
}

variable "location" {
  type        = string
  default     = ""
  description = "The location where the virtual network is created."
}

variable "address_space" {
  type = list(string)
}

variable "dns_servers" {
  type    = list(string)
  default = []
}

variable "subnets" {
  type        = any
  description = "List of subnets."
}
