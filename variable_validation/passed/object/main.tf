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
        error_message = "Can only specify either \"cidrs\", or \"netmask\"."
        condition = length(setintersection(keys(var.only_one_optional_key), ["cidrs", "netmask"])) == 1
    }
}
