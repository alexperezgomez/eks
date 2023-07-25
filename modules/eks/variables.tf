
variable "vpc_id" {
    type = string
}


variable "private_subnets" {
  type    = list(string)
}

variable "cluster_name" {
    type = string
}


variable "cluster_version" {
    type = string
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
