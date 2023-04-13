#-------------AWS Network----------------------------------------
module "aws_network" {
    source = "../aws_network"
}

#-------------EKS Cluster----------------------------------------
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.12"

  cluster_name    = "l124-dp-Cluster"
  cluster_version = "1.25"
   
 
  vpc_id                         = module.aws_network.vpc_id
  subnet_ids                     = module.aws_network.private_subnet_ids
  cluster_endpoint_public_access = true

  cluster_encryption_config = {}
  tags = {
    Environment = "DP"
    Terraform   = "true"
    Owner   = "Andry Peshko"
    Project = "DP IBA"
  }

  # eks_managed_node_group_defaults = {
  #   ami_type = "AL2_x86_64"
  # }

#-------------Node groups cluster----------------------------------------
  eks_managed_node_groups = {
    l124-node-DP = {
  
      instance_types = ["t2.micro"]
      min_size     = 2
      max_size     = 4
      desired_size = 2
    tags = {
      Environment = "DP"
      Terraform   = "true"
      Owner   = "Andry Peshko"
      Project = "DP IBA"
    }
    }
  }
 
}
