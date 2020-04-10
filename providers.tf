provider "aws" {
  version = "~> 2.0"
  region = var.region
}

//S3 backend configuration
terraform {
  backend "s3" {
    bucket = "aws-tf-state"
    key    = "aws-tf-prj01"
    region = "eu-west-1"
  }
}