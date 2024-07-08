variable "timestamp" {
  type        = string

  validation {
    # formatdate fails if the second argument is not a valid timestamp
    condition     = can(formatdate("", var.timestamp))
    error_message = "The timestamp argument requires a valid RFC 3339 timestamp."
  }
}
