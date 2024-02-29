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

data "digitalocean_domain" "this" {
  name = var.domain
}

resource "digitalocean_record" "this" {
  for_each = var.records

  domain = data.digitalocean_domain.this.id
  name   = each.value["name"]
  type   = each.value["type"]
  ttl    = each.value["ttl"]
  value  = each.value["value"]
}
