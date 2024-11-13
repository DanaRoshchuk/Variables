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
#jsonencode(keys(var.only_one_optional_key))