output "dns" {
  value       = digitalocean_record.this
  description = "DNS records"
}
