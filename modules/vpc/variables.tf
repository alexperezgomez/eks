/*variable "cidr_vpc" {
  description = "cidr de la vpc"
  type        = string
}

variable "range_vpc" {
  description = "cidr de la vpc"
  type        = string
}*/


data "aws_availability_zones" "available" {}


variable "cluster_name" {
    type = string
}


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


