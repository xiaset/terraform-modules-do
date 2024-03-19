variable "bucket_name" {
  type        = string
  description = "CDN bucket name"
}

variable "bucket_acl" {
  type        = string
  description = "CDN bucket ACL"
  default = "public-read"
}

variable "region" {
  type        = string
  description = "The location of the cluster"
}

variable "cdn_domain" {
  type        = string
  description = "CDN domain name"
}

variable "do_project" {
  description = "Name of the DO project to assign resources"
  type        = string
}

