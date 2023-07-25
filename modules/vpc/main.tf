module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  name                 = var.vpc_name
  cidr                 = var.cidr_vpc
  azs                  = var.azs
  private_subnets      = var.subnet_private
  public_subnets       = var.subnet_public


  tags = {
    "kubernetes.io/clúster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/clúster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/clúster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}