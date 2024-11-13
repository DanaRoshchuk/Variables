variable "magic_animal_tuple" {
  type    = tuple([string, string, string, string])
  default = ["usualcentaur1$", "Big Earth", "Non-Archery-Dry-check-on-222staging", "ssss"]

  validation {
    condition     = can(var.magic_animal_tuple[3])
    error_message = var.magic_animal_tuple[3] #"Should be failed!!!!!!Invalid fruit selected, only allowed fruits are: 'lemon', 'apple', 'mango', 'banana', 'cherry'. Default 'apple',Invalid fruit selected, only allowed fruits are: 'lemon', 'apple', 'mango', 'banana', 'cherry'. Default 'apple'"
  }
  }
#
#tuple([string, string, string])
