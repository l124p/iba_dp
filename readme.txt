Create jenkins jobs
1. terraform init
2. terraform plan
3. Create cluster om AWS (VPC, Route Table, NAT Gateway, SG, Public&Private subnet, EKS Cluster) - terraform apply
4. Create deployments


optional for Lens:
 - aws eks --region us-east-1 update-kubeconfig --name l124-dp-Cluster
