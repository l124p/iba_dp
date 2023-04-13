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


module "aws_network" {
   source = "./modules/deployments"
 }


data "aws_availability_zones" "available" {}


locals {
  name   = "iba-dp"
  region = "us-east-1"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-eks"
  }
}

