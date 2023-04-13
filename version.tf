terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.62"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.19"
    }
    
    kubectl = {
    source  = "gavinbunney/kubectl"
    version = ">= 1.14.0"
    }
  }
  required_version = ">= 1.0"
}