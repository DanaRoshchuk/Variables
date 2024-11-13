variable "magic_animals_set" {
  type    = set(string)
  #sensitive = true
  default = ["unicorn$"]

  validation {
    condition     = regex("[a-z]+", one(toset(var.magic_animals_set))) == "unicorn"
    # Not allowed due to the use of a variable:
    # error_message = "Invalid value [${var.prefix}]. The prefix value can only contain letters and numbers."
    error_message = "The value can only contain letters and numbers."
  }
}


#"dragon", "phoenix", "griffin", "black cat"
