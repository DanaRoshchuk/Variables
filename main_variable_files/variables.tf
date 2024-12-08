variable "quantity" {
	default = 2
	type = string
}
variable "prefix" {
	default = ["Mr", "Mrs", "Sir"]
	type = list
}
variable "run_id" {
  default = "run_id_3"
}
variable "strings" { 
default = ["a","b","c","d"]
type = list(string)
}
