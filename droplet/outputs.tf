output "droplet" {
  value       = digitalocean_droplet.this
  description = "Droplet"
}

output "reserved_ip" {
  value       = digitalocean_reserved_ip.this
  description = "Reserver IP"
}
