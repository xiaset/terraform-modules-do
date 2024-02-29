variable "firewall_name" {
  description = "The name of the firewall."
  type        = string
}

variable "droplet_ids" {
  type        = list(any)
  default     = []
  description = "The list of the IDs of the Droplets assigned to the Firewall"
}

variable "inbound_rules" {
  description = "A list of inbound rules including various source types"
  type        = list(any)
  default = []
}

variable "outbound_rules" {
  description = "A list of outbound rules for the firewall"
  type        = list(any)
  default = []
}
