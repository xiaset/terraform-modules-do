output "cluster" {
  value       = digitalocean_kubernetes_cluster.k8s
  description = "Kubernetes Cluster"
  sensitive = true
}
