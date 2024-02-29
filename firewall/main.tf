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

resource "digitalocean_firewall" "this" {
  name = var.firewall_name

  droplet_ids = var.droplet_ids

  dynamic "inbound_rule" {
    for_each = var.inbound_rules

    content {
      protocol   = inbound_rule.value.protocol
      port_range = inbound_rule.value.port_range

      source_addresses        = lookup(inbound_rule.value, "source_addresses", [])
      source_droplet_ids        = lookup(inbound_rule.value, "source_droplet_ids", [])
      source_tags = lookup(inbound_rule.value, "source_tags", [])
      source_load_balancer_uids = lookup(inbound_rule.value, "source_load_balancer_uids", [])
      source_kubernetes_ids = lookup(inbound_rule.value, "source_kubernetes_ids", [])
    }
  }

  dynamic "outbound_rule" {
    for_each = var.outbound_rules

    content {
      protocol   = outbound_rule.value.protocol
      port_range = outbound_rule.value.port_range

      destination_addresses = lookup(outbound_rule.value, "destination_addresses", [])
      destination_droplet_ids = lookup(outbound_rule.value, "destination_droplet_ids", [])
      destination_tags = lookup(outbound_rule.value, "destination_tags", [])
      destination_load_balancer_uids = lookup(outbound_rule.value, "destination_load_balancer_uids", [])
      destination_kubernetes_ids = lookup(outbound_rule.value, "destination_kubernetes_ids", [])
    }
  }
}

