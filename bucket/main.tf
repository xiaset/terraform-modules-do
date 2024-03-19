terraform {
  # Live modules pin exact Terraform version; generic modules let consumers pin the version.
  # The latest version of Terragrunt (v0.29.0 and above) recommends Terraform 0.15.0 or above.
  required_version = "~> 1.5"

  # Live modules pin exact provider version; generic modules let consumers pin the version.
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.34.1"
    }
  }
}

resource "digitalocean_spaces_bucket" "this" {
  name = var.bucket_name
  region = var.region
  acl = var.bucket_acl
}

resource "digitalocean_certificate" "this" {
  name    = replace(var.cdn_domain, ".", "-")
  type    = "lets_encrypt"
  domains = [var.cdn_domain]
}


resource "digitalocean_cdn" "this" {
  origin           = digitalocean_spaces_bucket.this.bucket_domain_name
  custom_domain    = var.cdn_domain
  certificate_name = digitalocean_certificate.this.name
}

data "digitalocean_project" "this" {
  name = var.do_project
}

resource "digitalocean_project_resources" "this" {
  project = data.digitalocean_project.this.id
  resources = [
    digitalocean_spaces_bucket.this.urn,
  ]
}
