variable "magic_animals_set" {
  type    = set(string)
  sensitive = true
  default = ["unicorn№", "dragon", "phoenix", "griffin", "black cat"]

  validation {
    condition     = can(regex("^w+$", var.magic_animals_set))
    # Not allowed due to the use of a variable:
    # error_message = "Invalid value [${var.prefix}]. The prefix value can only contain letters and numbers."
    error_message = "The prefix value can only contain letters and numbers."
  }
}