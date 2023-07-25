
variable "vpc_name" {
    type = string
}


variable "cidr_vpc" {
    type = string
}


variable "subnet_public" {
  type    = list(string)
}

variable "subnet_private" {
  type    = list(string)
}

variable "azs" {
  type    = list(string)
}



locals {
  cluster_name = "cluster-test"
}



variable "cluster_version" {
  type    = string
}

variable "root_volume_type" {
  type    = string
}

variable "name_worker" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "asg_desired_capacity" {
  type    = string
}

variable "cluster_endpoint_private_access" {
  type    = string
}



variable "ecr_01" {
    type = string
}

variable "ecr_02" {
    type = string
}

variable "ecr_03" {
    type = string
}







