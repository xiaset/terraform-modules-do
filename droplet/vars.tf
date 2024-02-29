variable "do_project" {
  description = "Name of the DO project to assign resources"
  type        = string
}

variable "name" {
  type        = string
  default     = "droplet"
  description = "The Droplet name"
}

variable "region" {
  type        = string
  default     = "fra1"
  description = "The region where the Droplet will be created"
}

variable "size" {
  type        = string
  default     = "s-1vcpu-512mb-10gb"
  description = "The unique slug that indentifies the type of Droplet"
}

variable "vpc_uuid" {
  type        = string
  default     = ""
  description = "The ID of the VPC where the Droplet will be located"
}

variable "ssh_keys" {
  type        = list(any)
  default     = []
  description = "A list of SSH key IDs or fingerprints to enable"
}

variable "image" {
  type        = string
  default     = "ubuntu-22-04-x64"
  description = "The Droplet image ID or slug. This could be either image ID or droplet snapshot ID"
}

variable "create" {
  type = bool
  default = true
  description = "Whether to create droplet resource"
}

variable "create_reserved_ip" {
  type = bool
  default = true
  description = "Whether to create reserved IP resource"
}

variable "tags" {
  type        = list(any)
  default     = []
  description = "A list of the tags to be applied to this Droplet"
}
