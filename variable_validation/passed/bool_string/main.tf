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
