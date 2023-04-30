terraform {
  backend "remote" {
    organization = "${ORGANIZATION}"
    workspaces {
      name = "${WORKSPACE}"
    }
  }
  required_version = "~> 0.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

