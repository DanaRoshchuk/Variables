variable "magic_animal_tuple" {
  type    = bool
  default = false
#["usualcentaur1$", "Big Earth", "Non-Archery-Dry-check-on-222staging"]

  validation {
    condition     = can(var.magic_animal_tuple)
    error_message = "Should be failed!!!!!!Invalid fruit selected, only allowed fruits are: 'lemon', 'apple', 'mango', 'banana', 'cherry'. Default 'apple',Invalid fruit selected, only allowed fruits are: 'lemon', 'apple', 'mango', 'banana', 'cherry'. Default 'apple'"
  }
  }
#
#tuple([string, string, string])
