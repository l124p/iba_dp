module "aws_network" {
    source = "../aws_network"
}

resource "aws_security_group" "all_worker_group" {
    name_prefix = "worker_group_mgmt_one"
    vpc_id = module.aws_network.vpc_id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [
            "10.0.0.0/16"
        ]
    }
}
