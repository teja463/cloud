terraform {
  backend "s3" {
    bucket         = "test-teja-devops-directive-bucket"
    key            = "workspaces/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "mymodule1" {
  source = "../mymodule"
  my_bucket_prefix = "module1"
}
