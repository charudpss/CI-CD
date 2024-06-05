# configure backend
terraform {
  backend "s3" {
    bucket         = "awstfstate1"
    key            = "EKS/terraform.tfstate"
    region         = "us-east-1"
  }
}
