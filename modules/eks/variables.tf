variable "tags" {
  default = {  
    Environment = "DP"
    Terraform   = "true"
    Owner   = "Andry Peshko"
    Project = "DP IBA"
  }
}

#---------- Cluster----------
variable "cluster_name" {
  default = "l124-dp-Cluster"
}

variable "cluster_version" {
  default = "1.25"
}

#--------Node--------------
variable "instance" {
  default = {
    ami_type = "AL2_x86_64"
    types = "t2.micro"
    min_size     = 2
    max_size     = 4
    desired_size = 2
  }
}      
