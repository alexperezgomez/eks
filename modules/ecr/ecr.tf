resource "aws_ecr_repository" "ecr_01" {
  name                 = var.ecr_01
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}


resource "aws_ecr_repository" "ecr_02" {
  name                 = var.ecr_02
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}


resource "aws_ecr_repository" "ecr_03" {
  name                 = var.ecr_03
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

