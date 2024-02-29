variable "domain" {
  type        = string
  description = "DO Domain name"
}

variable "records" {
  description = "Map of records"
  type        = map(any)
}

