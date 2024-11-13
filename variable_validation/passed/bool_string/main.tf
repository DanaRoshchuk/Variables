variable "create_cluster" {
  description = "Whether to create a new cluster."
  type        = bool
  default     = false
}
 
variable "cluster_endpoint" {
  description = "Endpoint of the existing cluster to use."
  type        = string
  default     = ""
 
  validation {
    condition     = var.create_cluster == false ? length(var.cluster_endpoint) > 0 : true
    error_message = "You must specify a value for cluster_endpoint if create_cluster is false."
  }
}
