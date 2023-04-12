#resource "aws_eks" "eks" {
module "aws_network" {
    source = "../aws_network"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.12"

  cluster_name    = "l124-DP-Cluster"
  cluster_version = "1.25"
   
 
  vpc_id                         = module.aws_network.vpc_id
  #vpc_id = ["${module.aws_network.vpc_id}"]
  subnet_ids                     = module.aws_network.private_subnet_ids
  cluster_endpoint_public_access = true

  cluster_encryption_config = {}

  eks_managed_node_groups = {
    l124-node-DP = {
  
      instance_types = ["t2.micro"]
      min_size     = 2
      max_size     = 4
      desired_size = 2
    tags = {
      Environment = "DP"
      Terraform   = "true"
      github   = "true"
    }
    }
  }





  # eks_managed_node_group_defaults = {
  #   ami_type = "AL2_x86_64"

  # }

  # eks_managed_node_groups = {
  #   one = {
  #     name = "node-group-1"

  #     instance_types = ["t2.micro"]

  #     min_size     = 2
  #     max_size     = 4
  #     desired_size = 2
  #   }

    # two = {
    #   name = "node-group-2"

    #   instance_types = ["t2.micro"]

    #   min_size     = 2
    #   max_size     = 4
    #   desired_size = 2
    # }
  #}

}

# resource "aws_kms_key" "secrets" {
#     description         = "My KMS Keys for Data Encryption"
#     customer_master_key_spec = "SYMMETRIC_DEFAULT"
#     is_enabled               = false
#      #enable_key_rotation      = var.rotation_enabled  

#     tags = {
#         Name = "my_kms_key"
#       }
#   }

# resource "aws_kms_alias" "secrets" {
#   name          = "alias/secrets"
#   target_key_id = "${aws_kms_key.secrets.key_id}"
# }