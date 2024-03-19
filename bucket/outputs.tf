output "cdn" {
  value       = digitalocean_cdn.this
  description = "DO CDN"
}

output "bucket" {
  value       = digitalocean_spaces_bucket.this
  description = "DO CDN bucket"
}

