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

#data "digitalocean_project" "this" {
#  name = var.do_project
#}

resource "digitalocean_vpc" "this" {
  name     = var.name
  region   = var.region
  ip_range = var.ip_range
}

#resource "digitalocean_project_resources" "this" {
#  project = data.digitalocean_project.this.id
#  resources = [
#    digitalocean_vpc.this.urn
#  ]
#}
