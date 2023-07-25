resource "aws_security_group" "sg_worker_group" {
  name_prefix = "sg_worker_group"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.private_subnets
  cluster_endpoint_private_access	 = var.cluster_endpoint_private_access

  vpc_id = var.vpc_id

  workers_group_defaults = {
    root_volume_type = var.root_volume_type
  }

  worker_groups = [
    {
      name                          = var.name_worker
      instance_type                 = var.instance_type
      additional_security_group_ids = [aws_security_group.sg_worker_group.id]
      asg_desired_capacity          = var.asg_desired_capacity
    },
  ]
}


data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}






