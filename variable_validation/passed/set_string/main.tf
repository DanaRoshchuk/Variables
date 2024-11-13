variable "magic_animals_set" {
  type    = set(string)
  #sensitive = true
  default = ["unicorn$", "dragon", "phoenix", "griffin", "black cat"]

  validation {
    condition     = regex("[a-z]+", var.magic_animals_set[0]) == "unicorn"
    # Not allowed due to the use of a variable:
    # error_message = "Invalid value [${var.prefix}]. The prefix value can only contain letters and numbers."
    error_message = "The value can only contain letters and numbers."
  }
}
