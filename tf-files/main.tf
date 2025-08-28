terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "alex-eks-terraform"
    key            = "global/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75" # pin to v3.x to match the module
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

