variable "magic_animals_list" {
  type    = list(string)
  default = ["unicorn", "dragon", "phoenix", "griffin", "thestral", "dog"]

validation {
    condition = var.magic_animals_list[0] == "unicorn"
    error_message = "Some animal is not listed in default values"
  }
/*validation {
    condition = alltrue([
      for s in var.magic_animals_list :
      contains(
       ["unicorn", "dragon", "phoenix", "griffin", "thestral", "dog"],
        lower(s),
      )
    ])
    error_message = "<helpful error message>"
  }*/
}
