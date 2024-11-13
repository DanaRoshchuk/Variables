variable "magic_animal_tuple" {
  type    = tuple([string, string, string])
  default = ["usualcentaur1$", "Big Earth", "Non-Archery-Dry-check-on-222staging"]

  validation {
    condition     = can(false)
    error_message = "Should be failed!!!!!!Invalid fruit selected, only allowed fruits are: 'lemon', 'apple', 'mango', 'banana', 'cherry'. Default 'apple',Invalid fruit selected, only allowed fruits are: 'lemon', 'apple', 'mango', 'banana', 'cherry'. Default 'apple'"
  }
  }
#var.magic_animal_tuple[3]
