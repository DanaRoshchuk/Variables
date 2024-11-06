/*variable "nullable" {
  type     = string
  default = null
}*/

variable "nullable" {
  type = string
  default = null
}

resource "null_resource" "name" {
  triggers = {
    trigger = var.nullable
  }
}

/*resource "null_resource" "name" {
  triggers = {
    time = var.timestamp
  }
}*/

