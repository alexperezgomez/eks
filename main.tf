module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

cidr       = var.cidr_vpc
private_subnets   = var.subnet_private
public_subnets   = var.subnet_public
name =  var.vpc_name
azs = var.azs
enable_nat_gateway   = true
single_nat_gateway   = true
enable_dns_hostnames = true
 tags = {
    "kubernetes.io/clúster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/clúster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
    "Subnet_publica"                      = "ok"
  }

  private_subnet_tags = {
    "kubernetes.io/clúster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
    "Subnet_privada"                      = "ok"
  }



}


module "eks" {

source  = "./modules/eks"

vpc_id = module.vpc.vpc_id
private_subnets   =  module.vpc.private_subnets
cluster_name = local.cluster_name
cluster_version = var.cluster_version
root_volume_type = var.root_volume_type
name_worker = var.name_worker
instance_type = var.instance_type
asg_desired_capacity = var.asg_desired_capacity
cluster_endpoint_private_access = var.cluster_endpoint_private_access



}


module "ecr" {

source  = "./modules/ecr"

ecr_01 = var.ecr_01
ecr_02 = var.ecr_02
ecr_03 = var.ecr_03



}









