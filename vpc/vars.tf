variable "region" {
  type        = string
  default     = "fra1"
  description = "The region to create VPC"
}

variable "name" {
  description = "Name of the VPC"
  type        = string
}

#variable "do_project" {
#  description = "Name of the DO project to assign resources"
#  type        = string
#}

variable "ip_range" {
  type        = string
  default     = "10.10.10.0/24"
  description = "The range of IP addresses for the VPC in CIDR notation. Network ranges cannot overlap with other networks in the same account and must be in range of private addresses as defined in RFC1918. It may not be larger than /16 or smaller than /24."
}
