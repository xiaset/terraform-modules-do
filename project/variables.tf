variable "name" {
  description = "The name of the project"
  type        = string
}

variable "description" {
  description = "The description of the project"
  type        = string
  default     = ""
}

variable "purpose" {
  description = "The purpose of the project"
  type        = string
  default     = "Web Application"
}

variable "environment" {
  description = "The environment of the project's resources. The possible values are: Development, Staging, Production"
  type        = string
  default     = "Development"
}

