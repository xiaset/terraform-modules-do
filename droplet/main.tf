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

data "digitalocean_project" "this" {
  name   = var.do_project
}

resource "digitalocean_droplet" "this" {
  count = var.create ? 1 : 0

  image    = var.image
  name     = var.name
  region   = var.region
  size     = var.size
  vpc_uuid = var.vpc_uuid
  ssh_keys = var.ssh_keys
  tags = var.tags
}

resource "digitalocean_project_resources" "this" {
  count = var.create ? 1 : 0

  project = data.digitalocean_project.this.id
  resources = [
    digitalocean_droplet.this[0].urn
  ]
}

resource "digitalocean_reserved_ip" "this" {
  count = var.create && var.create_reserved_ip ? 1 : 0

  droplet_id = digitalocean_droplet.this[0].id
  region     = var.region
}
