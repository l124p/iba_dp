1. terraform init
2. terraform plan
3. Create cluster om AWS (VPC, Route Table, NAT Gateway, SG, Public&Private subnet, EKS Cluster) - terraform apply


aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

