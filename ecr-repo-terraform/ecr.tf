provider "aws" {
  region = "eu-west-1" 
}

resource "aws_ecr_repository" "my_repo" {
  name                 = "ecr-repo-cartrawler"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "dev"
    Project     = "cartrawler-project"
  }
}

resource "aws_ecr_lifecycle_policy" "my_repo_policy" {
  repository = aws_ecr_repository.my_repo.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expire untagged images older than 14 days"
        selection = {
          tagStatus     = "untagged"
          countType     = "sinceImagePushed"
          countUnit     = "days"
          countNumber   = 14
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}


resource "aws_ecr_repository_policy" "my_repo_policy" {
  repository = aws_ecr_repository.my_repo.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
       Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:BatchGetImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:PutImage"
        ]
      }
    ]
  })
}