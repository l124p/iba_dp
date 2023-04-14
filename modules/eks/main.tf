#-------------AWS Network----------------------------------------
module "aws_network" {
    source = "../aws_network"
}

#-------------EKS Cluster----------------------------------------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.12"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
   
 
  vpc_id                         = module.aws_network.vpc_id
  subnet_ids                     = module.aws_network.private_subnet_ids
  cluster_endpoint_public_access = true

  cluster_encryption_config = {}
  tags = var.tags

  # eks_managed_node_group_defaults = {
  #   ami_type = "AL2_x86_64"
  # }

#-------------Node groups cluster----------------------------------------
  eks_managed_node_groups = {
    l124-node-DP = {
  
      instance_types = [var.instance.types]
      min_size       = var.instance.min_size
      max_size       = var.instance.max_size
      desired_size   = var.instance.desired_size
    tags = var.tags
    }
  }
}
