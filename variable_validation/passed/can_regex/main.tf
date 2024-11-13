variable "resource_group_name" {
  description = "Name of the resource group"

  validation {
    condition     = can(regex("^rg-", var.resource_group_name))
    error_message = "The resource group name must start with 'rg-'."
  }
}
