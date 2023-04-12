provider "aws" {
  region = local.region
}

terraform {
 backend "s3" {
   bucket = "l124-dp-bucket"
   key = "dp/terraform.tfstate"
   region = "us-east-1"
   dynamodb_table = "l124-dp-terraform-state"
 }
}

module "eks"{
   source = "./modules/eks"
}

module "aws_ecr_repository"{
   source = "./modules/aws_ecr_repository"
}

# module "aws_network" {
#   source = "./modules/aws_network"
# }

# module "sg"{
#   source = "./modules/security_group"
# }

# module "dynamo"{
#   source = "./modules/dynamo"
# }

module "aws_network" {
   source = "./modules/deployments"
 }




data "aws_availability_zones" "available" {}

#data "aws_availability_zones" "available" {
    #state = "available"
#}


# data "aws_eks_cluster" "eks" {
#   name = module.eks.cluster_id
# }

# data "aws_eks_cluster_auth" "eks" {
#   name = module.eks.cluster_id
# }


locals {
  name   = "ex-${replace(basename(path.cwd), "_", "-")}"
  #name = ""
  region = "us-east-1"

  #vpc_cidr = "10.0.0.0/16"
  #azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-eks"
   # GithubOrg  = "terraform-aws-modules"
  }
}

# data "terraform_remote_state" "eks" {
#   backend = "local"
#   config = {
#     path = "../eks/terraform.tfstate"
#   }
# }