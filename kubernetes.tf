 provider "kubernetes" {
   load_config_file = false
   host                   = data.aws_eks_cluster.eks.endpoint
   token                  = data.aws_eks_cluster.eks.token
   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority.0.data)
  #  exec {
  #   api_version = "client.authentication.k8s.io/v1"
  #   args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
  #   command     = "aws"
  # }
 }
provider "kubectl" {
  host                   = data.aws_eks_cluster.l124-DP-Cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.l124-DP-Cluster.certificate_authority.0.data)
  load_config_file       = false
  exec {
    api_version = "client.authentication.k8s.io/v1"
    args        = ["eks", "get-token", "--cluster-name", local.cluster_name]
    command     = "aws"
  }
}

# provider "kubernetes" {
#   host                   = module.eks.cluster_endpoint
#   cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "aws"
#     # This requires the awscli to be installed locally where Terraform is executed
#     args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
#   }
# }