variable "test" {
  type = number
  default = null

  /*validation {
    condition = try(contains(["a", "b", "c"], var.test, true))
    error_message = "test must be one of a, b, c or null"
  }*/

 /*validation {
/*condition = (
      var.test != null ?
      var.test > 5 :
      true
    )*/
 
    condition = (
      var.test != null ?
      contains(["a", "b", "c"], var.test) :
      true
    )
    error_message = "test must be one of a, b, c or null"
  }*/
}

