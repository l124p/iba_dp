output "cluster_id" {
  description = "The ID of the EKS cluster. Note: currently a value is returned only for local EKS clusters created on Outposts"
  value       = try(eks.this[0].cluster_id, "")
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = try(eks.this[0].name, "")
}

output "cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = try(eks.this[0].endpoint, null)
}