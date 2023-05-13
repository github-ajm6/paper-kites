remote_state {
  backend = "s3"
  config = {
    bucket  = "tf-states-${RID}"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
    dynamodb_table = "tf-lock"
  }
}


generate "init" {
  path      = "init.tf"
  if_exists = "skip"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "tf-states-${RID}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = true
    dynamodb_table = "tf-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66.1"
    }
  }

}
provider "aws" {
  region = "ap-southeast-1"
}
EOF
}



generate "datahub" {
  path      = "datahub.tf"
  if_exists = "skip"
  contents = <<EOF
data "terraform_remote_state" "null" {
  backend = "s3"
  config = {
    bucket  = "tf-states-${RID}"
    key     = "null/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
    dynamodb_table = "tf-lock"
  }
}
data "terraform_remote_state" "lambda" {
  backend = "s3"
  config = {
    bucket  = "tf-states-${RID}"
    key     = "lambda/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
    dynamodb_table = "tf-lock"
  }
}
EOF
}

