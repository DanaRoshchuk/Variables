
resource "azurerm_resource_group" "main" {
 name     = "main-resources"
  location = var.primary_location
}


resource "azurerm_resource_group" "partner" {
 name     = "partner-resources"
  location = var.secondary_location
}


variable "primary_location" {
  type = string
  description = "Primary location for the resource group"
}

variable "secondary_location" {
  type = string
  description = "Partner location to use for deployment"

  validation {
    condition = var.secondary_location != var.primary_location
    error_message = "Secondary location must be different from the primary location"
  }
}
