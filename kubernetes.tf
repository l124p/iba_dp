
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
  api_version = "client.authentication.k8s.io/v1beta1"
  args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  command = "aws"
  }
  
}

provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  #base64decode(data.aws_eks_cluster.eks-cluster.certificate_authority.0.data)
  load_config_file       = false
  exec {
  api_version = "client.authentication.k8s.io/v1beta1"
  args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  command = "aws"
  }
}  
