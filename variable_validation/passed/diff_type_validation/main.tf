#In this example, the magic_animals_list variable is defined as a list of strings representing magic animals. The resulting list will be ["unicorn", "dragon", "phoenix", "griffin"].
variable "magic_animals_list" {
  type    = list(string)
  default = ["unicorn", "dragon", "phoenix", "griffin", "thestral", "dog"]
  
  validation {
    condition = var.magic_animals_list[0] == "unicorn"
    error_message = "First animal is not listed in default values. First value should be unicorn"
  }
}

#In this example, the magic_animals variable is a list of objects. Each object represents a magic animal and contains attributes such as name, power, element, and description. The default value provides a list of four magic animals with their respective attributes.
variable "magic_animals" {
  type = list(object({
    name       = string
    power      = string
    element    = string
    description = string
  }))
  default = [
    {
      name        = "unicorn"
      power       = "sparkle"
      element     = "light"
      description = "A mystical creature with a single horn on its forehead."
    },
    {
      name        = "dragon"
      power       = "fire"
      element     = "fire"
      description = "A powerful creature with the ability to breathe fire."
    },
    {
      name        = "phoenix"
      power       = "rebirth"
      element     = "fire"
      description = "A legendary bird that is reborn from its own ashes."
    },
    {
      name        = "griffin"
      power       = "majesty"
      element     = "air"
      description = "A majestic creature with the body of a lion and the head of an eagle."
    }
  ]
   validation {
    condition = contains(["cat", "unicorn"], var.magic_animals[0].name)
    error_message = "Invalid object, name can be unicorn(set by default configuration for first object in the template)."
  }
}

#In this example, the magic_animals_set variable is defined as a set of strings representing magic animals. The resulting set will be ["unicorn", "dragon", "phoenix", "griffin"]
variable "magic_animals_set" {
  type    = set(string)
  sensitive = true
  #default = ["unicorn", "dragon", "phoenix", "griffin", "black cat"]
validation {
     condition     = one(toset(var.magic_animals_set)) == "unicorn"
    error_message = "Only unicorn will be valid"
  }
}

#In this example, the magic_animals_map variable is defined as a map of strings representing magic animals and their associated qualities. The resulting map will be { "unicorn" = "sparkle", "dragon" = "fire", "phoenix" = "rebirth", "griffin" = "majesty" }.
variable "mymap" {
  type = map(object({
    my_key = string
  }))

  default = {
log1 = {my_key: "val%"}, 
log2 = {my_key: "val2"}
}

  validation {
    condition = alltrue(
       [for value in values(var.mymap) : regex("[a-z]+", value.my_key) == "val"]
    )
    error_message = "Each map key should include key string."
  }

}

#In this example, the magic_animal_object variable is defined as an object with three attributes: name, element, and power. The resulting object will be { "name" = "Mermaid", "element" = "Water", "power" = "Enchanting Voice" }.
variable "only_one_optional_key" {
    type = object({
        name = optional(string)
        cidrs = optional(list(string))
        netmask = optional(number)
    })

    default = {
        cidrs = ["10.0.0.0/16"]
        name = "test"
    }

    validation {
        error_message =  "Must specify at least one key from declaired var type ( \"cidrs\", or \"netmask\" or \"name\".)"
        condition = length(toset(setintersection(keys(var.only_one_optional_key), ["cidrs"]))) > 0
    }
}

#In this example, the magic_animal_tuple variable is defined as a tuple that contains three magical animal attributes: name, element, and power. The resulting tuple will be ["Centaur", "Earth", "Archery"].
variable "magic_animal_tuple" {
  type    = tuple([string, string, string, string])
  default = ["usualcentaur1$", "Big Earth", "Non-Archery-Dry-check-on-222staging", "ssss"]

  validation {
    condition     = can(var.magic_animal_tuple[3])
    error_message = "Should be failed if delete some default value and left only 3 values!!!!!!"
  }
  }

 variable "string_may_not_contain" {
  type = string
  default = "test/"

  validation {
    error_message = "Value cannot contain a \"/\"."
    condition = !can(regex("/", var.string_may_not_contain))
  }
}

variable "num_in_range" {
  type        = number
  default     = 1

  validation {
    condition     = var.num_in_range >= 1 && var.num_in_range <= 16 && floor(var.num_in_range) == var.num_in_range
    error_message = "Accepted values: 1-16."
  }
}

variable "magic_animals_boolean" {
  type    = bool
  default = false

validation {
    condition = alltrue([
     var.magic_animals_boolean
    ])
    error_message = "<helpful error message>"
  }
}
