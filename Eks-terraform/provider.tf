# configure aws provider
provider "aws" {
  region  = var.region
}

# configure backend
terraform {
  backend "s3" {
    bucket         = "awstfstate1"
    key            = "EKS/terraform.tfstate"
    region         = "us-east-1"
  }
}
