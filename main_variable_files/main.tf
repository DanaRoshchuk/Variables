resource "random_integer" "ran" {
  count = var.quantity
  min = 31
  max = 200
  keepers = {
    run_id = var.run_id
  }
}
resource "random_pet" "pet" {
 prefix = var.prefix[1]
 separator = "."
 length = 1
 }
 resource "null_resource" "env_vars" {
  triggers = {
    run_id = var.run_id
  }
  provisioner "local-exec" {
    command = "env"
  }
}
resource "random_shuffle" "my_shuffle" {
  input = var.strings
  result_count = length(var.strings)
}
resource "random_id" "my_id" {
    count = 2
    byte_length = 5
    prefix = "Yowsa"
}
